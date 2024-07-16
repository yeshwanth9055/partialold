{
  "recordTypeMap": {},
  "RecordSetBundles": [
    {
      "Records": [
        {
          "attributes": {
            "type": "copado__ExtensionConfiguration__c",
            "url": "/services/data/v57.0/sobjects/copado__ExtensionConfiguration__c/a0h09000009wdsVAAQ"
          },
          "Id": "a0h09000009wdsVAAQ",
          "Name": "metadata-report-hs",
          "copado__AcceptanceCriteria__c": "{}",
          "copado__Active__c": true,
          "copado__ExtensionApplication__c": "Test",
          "copado__Details__c": null,
          "copado__ExtensionTool__c": "metadata-report-hs",
          "copado__TestType__c": "Static Code Analysis"
        }
      ],
      "ObjectType": "copado__ExtensionConfiguration__c"
    },
    {
      "Records": [
        {
          "attributes": {
            "type": "copado__JobTemplate__c",
            "url": "/services/data/v57.0/sobjects/copado__JobTemplate__c/a0w09000008SkthAAC"
          },
          "Id": "a0w09000008SkthAAC",
          "Name": "metadata_report_hs",
          "copado__ApiName__c": "metadata_report_hs_1",
          "copado__Description__c": "<p>collect the list of changes of a user story and report each usage in the project</p>",
          "copado__Type__c": "Custom",
          "copado__Version__c": 1
        }
      ],
      "ObjectType": "copado__JobTemplate__c"
    },
    {
      "Records": [
        {
          "attributes": {
            "type": "copado__JobStep__c",
            "url": "/services/data/v57.0/sobjects/copado__JobStep__c/a0v09000007zba7AAA"
          },
          "Id": "a0v09000007zba7AAA",
          "Name": "metadata_report_hs",
          "copado__Parent_Owner_Id__c": "0050900000BnLFA",
          "copado__ApiName__c": "metadata_report_hs_1_metadata_report_hs_0",
          "copado__ConfigJson__c": "{\"functionName\":\"metadata_report_hs\",\"parameters\":[{\"name\":\"parentId\",\"value\":\"{$Context.JobExecution__r.ParentId__c}\",\"required\":true},{\"name\":\"sourceSessionId\",\"value\":\"{$Source.Credential.SessionId}\",\"required\":true},{\"name\":\"sourceEndpoint\",\"value\":\"{$Source.Credential.Endpoint}\",\"required\":true}]}",
          "copado__CustomType__c": "Function",
          "copado__JobTemplate__c": "a0w09000008SkthAAC",
          "copado__Order__c": 0,
          "copado__Type__c": "Function"
        }
      ],
      "ObjectType": "copado__JobStep__c"
    },
    {
      "Records": [
        {
          "attributes": {
            "type": "copado__Function__c",
            "url": "/services/data/v57.0/sobjects/copado__Function__c/a0n09000002WtZgAAK"
          },
          "Id": "a0n09000002WtZgAAK",
          "Name": "metadata_report_hs",
          "copado__API_Name__c": "metadata_report_hs",
          "copado__ApexClass__c": "mdreporths.UpdateTestResultFromResult",
          "copado__Callback_Type__c": "ApexClass",
          "copado__Image_Name__c": "copado-function-core:v1",
          "copado__Options__c": "[]",
          "copado__Parameters__c": "[{\"required\":false,\"name\":\"parentId\",\"defaultValue\":\"\"},{\"required\":true,\"name\":\"sourceSessionId\",\"defaultValue\":\"\"},{\"required\":true,\"name\":\"sourceEndpoint\",\"defaultValue\":\"\"}]",
          "copado__Script__c": "#!/usr/bin/env node\nconst { execSync } = require(\"child_process\");\nconst fs = require('fs');\n\nexecSync(\"npm install --no-audit --progress=false sfdc-soup@18.4.0 jsforce\", {stdio: 'inherit'});\n\nconst sfdcSoup = require('/app/node_modules/sfdc-soup');\nconst jsforce = require('/app/node_modules/jsforce');\n\nconst copadoConn = new jsforce.Connection({\n    serverUrl : 'https://'+ new URL(process.env.CF_SF_ENDPOINT).hostname,\n    sessionId : process.env.CF_SF_SESSIONID\n});\n\nconst sandboxConn = new jsforce.Connection({\n    serverUrl : 'https://'+ new URL(process.env.sourceEndpoint).hostname,\n    sessionId : process.env.sourceSessionId\n});\n\nconst sfdcConnection = {\n    url: 'https://'+ new URL(process.env.sourceEndpoint).hostname, \n    token: process.env.sourceSessionId,\n    apiVersion: '56.0'\n};\n\nasync function getMetadataItemsOfType(type, names) {\n    console.time(\"listmetadata\");\n    let metadataItems = await sandboxConn.metadata.list([{type: type}], '56.0');\n    // we need to check if .list() returns an array\n    // https://github.com/jsforce/jsforce/issues/871\n    if(!Array.isArray(metadataItems)) {\n        metadataItems = [metadataItems];\n    }\n    console.timeEnd(\"listmetadata\");\n\n    const matches = metadataItems.filter( item => names.includes(item.fullName) );\n    if(!matches.length) {\n        console.log('cannot find item ', names);\n        for(const item of metadataItems) {\n            console.debug(item.id, item.type, item.fullName);\n        }\n    }\n    return matches;\n}\n\nasync function getListOfMetadataFromUserStory(userStoryId) {\n    let metadataList = [];\n    let metadataListMap = {};\n    let response;\n\n    response = await copadoConn.query(\"SELECT ContentDocument.LatestPublishedVersionId FROM ContentDocumentLink WHERE LinkedEntityId = '\"+userStoryId+\"' AND ContentDocument.Title = 'Copado Commit changes' ORDER BY ContentDocument.ContentModifiedDate DESC LIMIT 1\");\n    if(response.records.length && response.records[0].ContentDocument.LatestPublishedVersionId) {\n        const contentVersionId = response.records[0].ContentDocument.LatestPublishedVersionId;\n\n        const result = await copadoConn.request('/services/data/v56.0/sobjects/ContentVersion/'+contentVersionId+'/VersionData');\n        metadataList = JSON.parse(result);\n \n        // generate a map of the metadata items, to avoid duplicates when merging with the US metadata\n        metadataListMap = metadataList.reduce((group, item) => {\n            const key = `${item.t}.${item.n}`\n            group[key] = group[key] ?? [];\n            group[key].push(item);\n            return group;\n          }, {});\n    }\n\n    response = await copadoConn.query(\"SELECT copado__Type__c, copado__Metadata_API_Name__c FROM copado__User_Story_Metadata__c WHERE copado__User_Story__c = '\"+userStoryId+\"' ORDER BY copado__Type__c, copado__Metadata_API_Name__c\");\n    for(const item of response.records) {\n        const key = `${item.copado__Type__c}.${item.copado__Metadata_API_Name__c}`;\n        if( !(key in metadataListMap) ) {\n            metadataList.push({t: item.copado__Type__c, n: item.copado__Metadata_API_Name__c})\n        }\n    }\n    return metadataList;\n}\n\nasync function getUserStoryAndResult(parentId) {\n    let resp;\n    let resultId;\n    let userStoryId;\n    resp = await copadoConn.query(\"SELECT Id FROM copado__Result__c WHERE copado__Test__c = '\"+parentId+\"' ORDER BY CreatedDate DESC LIMIT 1\");\n    if(resp.records.length) {\n        // parentId is a Test object (used as a Test Tool)\n        resultId = resp.records[0].Id;\n        resp = await copadoConn.query(\"SELECT copado__User_Story__c FROM copado__Test__c WHERE Id = '\"+parentId+\"'\");\n        if(!resp.records.length || !resp.records[0].copado__User_Story__c) {\n            throw new Error('Could not find the User Story (1)');\n        }\n        userStoryId = resp.records[0].copado__User_Story__c;\n    }else{\n        // parentId is a UserStoryCommit object (used as a Quality Gate)\n        resp = await copadoConn.query(\"SELECT copado__User_Story__c FROM copado__User_Story_Commit__c WHERE Id = '\"+parentId+\"'\");\n        if(!resp.records.length || !resp.records[0].copado__User_Story__c) {\n            throw new Error('Could not find the User Story (2)');\n        }\n        userStoryId = resp.records[0].copado__User_Story__c;\n\n        resp = await copadoConn.query(\"SELECT copado__Result__c FROM copado__JobStep__c WHERE copado__JobExecution__r.copado__UserStoryCommit__c = '\"+parentId+\"' ORDER BY CreatedDate DESC LIMIT 1\");\n        if(!resp.records.length || !resp.records[0].copado__Result__c) {\n            throw new Error('Could not find the Result');\n        }\n        resultId = resp.records[0].copado__Result__c;\n    }\n    return {userStoryId, resultId}\n}\n\nconst start = async () => {\n    console.log('[param] parentId=', process.env.parentId);\n\n    const {userStoryId, resultId} = await getUserStoryAndResult(process.env.parentId)\n    const changes = await getListOfMetadataFromUserStory(userStoryId);\n\n    if(!changes.length) {\n        throw new Error('The user story has no metadata items to scan');\n    }\n\n    let items = [];\n    for(const c of changes) {\n        console.log(c);\n        items = items.concat(await getMetadataItemsOfType(c.t, [c.n]));\n    }\n\n    if(!items.length) {\n        throw new Error('Could not find any metadata items to scan');\n    }\n\n    let result = {\n        \"version\": \"2.1.0\",\n        \"$schema\": \"http://json.schemastore.org/sarif-2.1.0\",\n        \"runs\": [\n            {\n            \"tool\": {\n                \"driver\": {\n                \"name\": \"happy-soup\",\n                \"rules\": []\n                }\n            },\n            \"results\": [],\n            \"invocations\": [\n                {\n                \"executionSuccessful\": true,\n                \"toolExecutionNotifications\": []\n                }\n            ]\n            }\n        ]\n    };\n\n\n    for(const item of items) {\n        console.debug(item.id, item.type, item.fullName);\n\n        const request = {\n            name: item.fullName, \n            type: item.type, \n            id: item.id\n        };\n        const soupApi = sfdcSoup(sfdcConnection, request);\n    \n        console.time(\"getUsage\");\n        const ur = await soupApi.getUsage();\n        console.timeEnd(\"getUsage\");\n\n        console.log('##### USAGE OF', item.fullName)\n        console.log(ur.csv);\n\n        let usagesBuf = [];\n        const usageTree = Object.values(ur.usageTree);\n        if(usageTree.length) {\n            for( const subitems of usageTree ) {\n                for(const item of subitems) {\n                    const ns = item.namespace? `${item.namespace}__` : '';\n                    usagesBuf.push(`referenced at ${ns}${item.name} (${item.type})`);\n                }\n            }\n        }else{\n            usagesBuf.push('(no referenced found)');\n        }\n\n        result.runs[0].results.push({\n            \"level\": \"info\",\n            \"ruleId\": `${ur.entryPoint.name} (${ur.entryPoint.type})`,\n            \"locations\": [],\n            \"message\": usagesBuf.join('\\n')\n        });\n    }\n\n    let data = JSON.stringify(result);\n    fs.writeFileSync('/tmp/metadata_report_hs.json', data);\n\n    execSync(\"copado -p 'uploading results to \"+resultId+\"'\", {stdio: 'inherit'});\n\n    execSync(\"copado -u /tmp/metadata_report_hs.json --parentid \"+resultId, {stdio: 'inherit'});\n};\n\n// never fail, because we do not want to interrupt the copado action if there is a problem.\nstart().catch((e) => { console.error('there was a problem executing the scan', e); });",
          "copado__Timeout__c": 60,
          "copado__Type__c": "Custom",
          "copado__Version__c": "1",
          "copado__Worker_Size__c": "S"
        }
      ],
      "ObjectType": "copado__Function__c"
    }
  ],
  "blobsByUID": {}
}