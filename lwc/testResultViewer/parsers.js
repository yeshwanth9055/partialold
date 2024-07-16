import { dump } from './js-yaml';

function _safeyaml(s) {
    try{
        return dump(s);
    }catch(e) {
        console.error('_safeyaml', e, s);
        return ''+s;
    }
}

// necessary to generate a unique id for LWC
let _globalRuleCounter = 0;


function parseSarifV2(sarif) {
    let scans = [];
    const parseResult = (result, rules) => {
        rules = rules || []
        if(result.hasOwnProperty('ruleIndex')) {
            const rule = rules[result.ruleIndex]
            result.rule = rule;
        }
        const raw = _safeyaml(result);
        let locationsText = '';
        const ruleId = result.ruleId;
        const level = result.level 
            || (result.rule?.properties?.priority ?`priority: ${result.rule.properties.priority}` :'none');
        const message = result.message?.text || ''+result.message;
        const locations = result.locations || [];
        try{
            locationsText = locations.map( x => `${x?.physicalLocation?.artifactLocation?.uri} line ${x?.physicalLocation?.region?.startLine}` ).join(' ');
        }catch(e) {
            locationsText = '(parsing error '+e+')';
        }
        return {
            'uid': _globalRuleCounter++,
            'ruleId': ruleId,
            'level': level,
            'message': message,
            'location': locationsText,
            'rule': result.rule || {},
            'raw': raw
        }
    }
    
    for(let run of sarif.runs) {
        const items = run.results || [];
        delete sarif.results;
        scans.push({
            'tool': run.tool?.driver?.name,
            'summary': '',
            'raw': _safeyaml(run),
            'items': items.map( item => parseResult(item, run.tool?.driver?.rules) )
        });
    }
    return scans;
}

function parseSarifV1(sarif) {
    const parseIssue = (issue) => {
        const raw = _safeyaml(issue);
        let locationsText = '';
        const ruleId = issue.ruleId;
        const locations = issue.locations || [];
        const message = issue.shortMessage || issue.fullMessage;
        const severity = issue.properties?.severity;
        try{
            locationsText = locations.map( x => `${x?.analysisTarget[0]?.uri} line ${x?.analysisTarget[0]?.region?.startLine}` ).join(' ');
        }catch(e) {
            locationsText = '(parsing error '+e+')';
        }
        return {
            'uid': _globalRuleCounter++,
            'ruleId': ruleId,
            'level': severity,
            'message': message,
            'location': locationsText,
            'rule': {},
            'raw': raw
        }
    }
    
    const issues = sarif.issues || [];
    delete sarif.issues;
    return [{
        'tool': sarif.toolInfo?.toolName,
        'summary': '',
        'raw': _safeyaml(sarif),
        'items': issues.map( issue => parseIssue(issue) )
    }];
}

function parseJest(jest) {
    const parseTestResult = (result) => {
        if(result.status == 'passed') {
            return null;
        }
        const raw = _safeyaml(result);
        return {
            'uid': _globalRuleCounter++,
            'ruleId': result.name,
            'level': result.status,
            'message': result.message.replaceAll(/\x1b\[[0-9;]*[mGKHF]/g,''),
            'location': result.name,
            'rule': {},
            'raw': raw
        }
    };

    const items = jest.testResults || [];
    delete jest.testResults;
    const successErrorMessage = jest.success ?'Success!' :'Failed tests!';
    const summary = `
    ${successErrorMessage} ${jest.numFailedTests} failed tests, ${jest.numPassedTests} passed out of of ${jest.numTotalTests}
    ${jest.testExecError||''}`;
    return [{
        'tool': 'Jest',
        'summary': summary,
        'raw': _safeyaml(jest),
        // we first process all the items, and then filter out the empty ones
        'items': items.map( item => parseTestResult(item) ).filter( item => item )
    }];
}

function parseJUnitXML(xmlstring) {
    // spec for xml junit https://llg.cubic.org/docs/junit/

    const evaluateXPath = (aNode, aExpr) => {
        const xpe = new XPathEvaluator();
        const nsResolver = xpe.createNSResolver(aNode.ownerDocument === null ? aNode.documentElement : aNode.ownerDocument.documentElement);
        const result = xpe.evaluate(aExpr, aNode, nsResolver, 0, null);
        const found = [];
        let res;
        while ((res = result.iterateNext())) {
            found.push(res);
        }
        return found;
    };

    const parseJUnitXMLFailure = (testcase) => {
        const failure = evaluateXPath(testcase, 'failure')[0];
        const serializer = new XMLSerializer();
        const raw = serializer.serializeToString(testcase);
        return {
            'uid': _globalRuleCounter++,
            'ruleId': testcase.getAttribute('name'),
            'level': 'error',
            'message': failure.textContent,
            'location': failure.getAttribute('message'),
            'rule': {},
            'raw': raw
        }
    };

    const parser = new DOMParser();
    const doc = parser.parseFromString(xmlstring, "application/xml");
    const testsuites = doc.querySelector('testsuites');
    const failures = parseInt(testsuites.getAttribute('failures'), 10);
    const errors = parseInt(testsuites.getAttribute('errors'), 10);
    const tests = parseInt(testsuites.getAttribute('tests'), 10);
    const successErrorMessage = failures==='0' && errors==='0' ? 'Success' : 'Errors';
    // find testcases with failures only
    const items = evaluateXPath(doc, '//testcase/*[self::failure or self::error]/parent::testcase');
    const summary = `
    ${successErrorMessage} ${errors+failures} failed tests, ${tests-errors-failures} passed out of of ${tests}`;
    return [{
        'tool': 'JUnit',
        'summary': summary,
        'raw': xmlstring,
        'items': items.map( item => parseJUnitXMLFailure(item) )
    }];
}

export function parseFileContents(data) {
    if(!data) {
        return [];
    }
    let scans = [];
    try{
        if(data.startsWith('{')) {
            data = JSON.parse(data);
            if(data.hasOwnProperty('runs')) {
                scans = parseSarifV2(data);
            }else if(data.hasOwnProperty('issues')) {
                scans = parseSarifV1(sarif);
            }else if(data.hasOwnProperty('testResults')) {
                scans =  parseJest(data);
            }else{
                scans = [];
            }
            }else if(data.startsWith('<')) {
                scans = parseJUnitXML(data)
        }else{
            scans = [];
        }
    }catch(e) {
        // in case of any kind of error, do not fail, just return nothing
        console.error('sarifViewer: there was an error parsing the file. Error:', e);
        return [];
    }
    return scans;
}