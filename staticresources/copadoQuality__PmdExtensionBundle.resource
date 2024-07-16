{
    "recordTypeMap": {},
    "RecordSetBundles": [
        {
            "Records": [
                {
                    "attributes": {
                        "type": "copado__JobTemplate__c",
                        "url": "/services/data/v59.0/sobjects/copado__JobTemplate__c/a0u3O000009rtT9QAI"
                    },
                    "copado__ApiName__c": "Run PMD_1",
                    "copado__Type__c": "Standard",
                    "copado__Version__c": 1,
                    "Id": "a0u3O000009rtT9QAI",
                    "LastReferencedDate": "2023-09-05T14:34:39.000+0000",
                    "LastViewedDate": "2023-09-05T14:34:39.000+0000",
                    "Name": "Run PMD"
                },
                {
                    "attributes": {
                        "type": "copado__JobTemplate__c",
                        "url": "/services/data/v59.0/sobjects/copado__JobTemplate__c/a0u3O00000CzYaCQAV"
                    },
                    "copado__ApiName__c": "Generate_Default_PMD_Ruleset_1",
                    "copado__Description__c": "<ol><li>Fetch the Default rule set for a given language from PMD OSS and upload it as a file under extension Configuration</li><li><span style=\"font-size: 14px; background-color: rgb(255, 255, 255);\">Create SCA Rule Records for a given Ruleset file</span></li></ol>",
                    "copado__Type__c": "Standard",
                    "copado__Version__c": 1,
                    "Id": "a0u3O00000CzYaCQAV",
                    "LastReferencedDate": "2023-09-05T14:34:31.000+0000",
                    "LastViewedDate": "2023-09-05T14:34:31.000+0000",
                    "Name": "Generate Default PMD Ruleset"
                },
                {
                    "attributes": {
                        "type": "copado__JobTemplate__c",
                        "url": "/services/data/v59.0/sobjects/copado__JobTemplate__c/a0u3O00000CzYhwQAF"
                    },
                    "copado__ApiName__c": "Create_SCA_Rules_From_PMD_Ruleset_1",
                    "copado__Description__c": "<p>Create SCA Rules From PMD Ruleset</p>",
                    "copado__Type__c": "Standard",
                    "copado__Version__c": 1,
                    "Id": "a0u3O00000CzYhwQAF",
                    "LastReferencedDate": "2023-09-05T14:34:32.000+0000",
                    "LastViewedDate": "2023-09-05T14:34:32.000+0000",
                    "Name": "Create SCA Rules From PMD Ruleset"
                },
                {
                    "attributes": {
                        "type": "copado__JobTemplate__c",
                        "url": "/services/data/v59.0/sobjects/copado__JobTemplate__c/a0u3O00000DD7F9QAL"
                    },
                    "copado__ApiName__c": "Generate_PMD_Ruleset_From_SCA_Rules_1",
                    "copado__Description__c": "<p>Generate new ruleset file based on SCA records</p>",
                    "copado__Type__c": "Standard",
                    "copado__Version__c": 1,
                    "Id": "a0u3O00000DD7F9QAL",
                    "LastReferencedDate": "2023-09-05T14:34:30.000+0000",
                    "LastViewedDate": "2023-09-05T14:34:30.000+0000",
                    "Name": "Generate PMD Ruleset From SCA Rules"
                }
            ],
            "ObjectType": "copado__JobTemplate__c"
        },
        {
            "Records": [
                {
                    "attributes": {
                        "type": "copado__JobStep__c",
                        "url": "/services/data/v59.0/sobjects/copado__JobStep__c/a0t3O000005dGguQAE"
                    },
                    "copado__ApiName__c": "Run PMD_Execute PMD",
                    "copado__ConfigJson__c": "{\"functionName\":\"RunPmd\",\"parameters\":[{\"name\":\"git_json\",\"value\":\"{$Context.Repository.Credential}\",\"required\":false},{\"name\":\"RulesetFileName\",\"value\":\"ruleset\",\"required\":false},{\"name\":\"testResultIds\",\"value\":\"{$Context.JobExecution__r.DataJson.resultIds}\",\"required\":false},{\"name\":\"branchesAndFileIdJson\",\"value\":\"{$Context.Apex.copadoQuality.RetrieveBranchesAndFileIdForPmdScan}\"},{\"name\":\"deltaScan\",\"value\":\"{$Context.Apex.copadoQuality.IsDeltaScan}\"},{\"name\":\"consolidatedResultId\",\"value\":\"{$Context.JobExecution__r.DataJson.resultId}\"}]}",
                    "copado__CustomType__c": "Function",
                    "copado__IsSkipped__c": false,
                    "copado__JobTemplate__c": "a0u3O000009rtT9QAI",
                    "copado__Order__c": 1,
                    "copado__Type__c": "Function",
                    "Id": "a0t3O000005dGguQAE",
                    "Name": "Execute PMD"
                },
                {
                    "attributes": {
                        "type": "copado__JobStep__c",
                        "url": "/services/data/v59.0/sobjects/copado__JobStep__c/a0t3O000005dGgvQAE"
                    },
                    "copado__ApiName__c": "Run PMD_Evaluate PMD Acceptance Criteria",
                    "copado__ConfigJson__c": "{\"functionName\":\"Evaluate_PMD_Acceptance_Criteria\",\"parameters\":[{\"name\":\"acceptanceCriteria\",\"value\":\"{$Context.JobExecution__r.DataJson.acceptanceCriteria}\"},{\"name\":\"sarifFileId\",\"value\":\"{$Context.Apex.copadoQuality.GetSarifFileId}\"},{\"name\":\"sarifFileName\",\"value\":\"scan-output.sarif.json\"}]}",
                    "copado__CustomType__c": "Function",
                    "copado__IsSkipped__c": false,
                    "copado__JobTemplate__c": "a0u3O000009rtT9QAI",
                    "copado__Order__c": 2,
                    "copado__Type__c": "Function",
                    "Id": "a0t3O000005dGgvQAE",
                    "Name": "Evaluate PMD Acceptance Criteria"
                },
                {
                    "attributes": {
                        "type": "copado__JobStep__c",
                        "url": "/services/data/v59.0/sobjects/copado__JobStep__c/a0t3O000005eifWQAQ"
                    },
                    "copado__ApiName__c": "Generate_Default_Rules_1_Fetch_Ruleset_from_Repo_1",
                    "copado__ConfigJson__c": "{\"functionName\":\"Create_Default_Ruleset_File\",\"parameters\":[{\"name\":\"ruleLanguage\",\"value\":\"{$Context.JobExecution__r.DataJson.ruleLanguage}\",\"required\":true},{\"name\":\"extensionConfigId\",\"value\":\"{$Context.JobExecution__r.copado__ParentRecord_Id__c}\",\"required\":true}]}",
                    "copado__CustomType__c": "Function",
                    "copado__IsSkipped__c": false,
                    "copado__JobTemplate__c": "a0u3O00000CzYaCQAV",
                    "copado__Order__c": 1,
                    "copado__Type__c": "Function",
                    "Id": "a0t3O000005eifWQAQ",
                    "Name": "Create Default Ruleset File"
                },
                {
                    "attributes": {
                        "type": "copado__JobStep__c",
                        "url": "/services/data/v59.0/sobjects/copado__JobStep__c/a0t3O000005eifbQAA"
                    },
                    "copado__ApiName__c": "Generate_Default_Rules_1_Create_Rules_2",
                    "copado__ConfigJson__c": "{\"functionName\":\"Create_SCA_Rules\",\"parameters\":[]}",
                    "copado__CustomType__c": "Function",
                    "copado__IsSkipped__c": false,
                    "copado__JobTemplate__c": "a0u3O00000CzYaCQAV",
                    "copado__Order__c": 2,
                    "copado__Type__c": "Function",
                    "Id": "a0t3O000005eifbQAA",
                    "Name": "Create SCA Rules"
                },
                {
                    "attributes": {
                        "type": "copado__JobStep__c",
                        "url": "/services/data/v59.0/sobjects/copado__JobStep__c/a0t3O000005eigZQAQ"
                    },
                    "copado__ApiName__c": "Create_Rules_1_Create_Rules_1",
                    "copado__ConfigJson__c": "{\"functionName\":\"Create_SCA_Rules\",\"parameters\":[]}",
                    "copado__CustomType__c": "Function",
                    "copado__IsSkipped__c": false,
                    "copado__JobTemplate__c": "a0u3O00000CzYhwQAF",
                    "copado__Order__c": 1,
                    "copado__Type__c": "Function",
                    "Id": "a0t3O000005eigZQAQ",
                    "Name": "Create Rules"
                },
                {
                    "attributes": {
                        "type": "copado__JobStep__c",
                        "url": "/services/data/v59.0/sobjects/copado__JobStep__c/a0t3O000005ey2cQAA"
                    },
                    "copado__ApiName__c": "Push_Changes_to_Ruleset_1_Update_Ruleset_1",
                    "copado__ConfigJson__c": "{\"functionName\":\"Generate_PMD_Ruleset_From_SCA_Rules_1\",\"parameters\":[{\"name\":\"extensionConfigId\",\"value\":\"{$Context.JobExecution__r.copado__ParentRecord_Id__c}\",\"required\":true},{\"name\":\"existingRulesetId\",\"value\":\"{$Context.Apex.copadoQuality.GetRulesetId}\"}]}",
                    "copado__CustomType__c": "Function",
                    "copado__IsSkipped__c": false,
                    "copado__JobTemplate__c": "a0u3O00000DD7F9QAL",
                    "copado__Order__c": 1,
                    "copado__Type__c": "Function",
                    "Id": "a0t3O000005ey2cQAA",
                    "Name": "Generate PMD Ruleset From SCA Rules"
                }
            ],
            "ObjectType": "copado__JobStep__c"
        },
        {
            "Records": [
                {
                    "attributes": {
                        "type": "copado__Function__c",
                        "url": "/services/data/v59.0/sobjects/copado__Function__c/a0l3O000001oDChQAM"
                    },
                    "copado__API_Name__c": "RunPmd",
                    "copado__Image_Name__c": "copado-multicloud-pmd:v2",
                    "copado__Options__c": "[ ]",
                    "copado__Parameters__c": "[ {\n  \"required\" : false,\n  \"name\" : \"git_json\",\n  \"defaultValue\" : \"{$Context.Repository.Credential}\"\n}, {\n  \"required\" : false,\n  \"name\" : \"RulesetFileName\",\n  \"defaultValue\" : \"ruleset\"\n}, {\n  \"required\" : false,\n  \"name\" : \"testResultIds\",\n  \"defaultValue\" : \"{$Context.JobExecution__r.DataJson.resultIds}\"\n}, {\n  \"name\" : \"branchesAndFileIdJson\",\n  \"defaultValue\" : \"{$Context.Apex.copadoQuality.RetrieveBranchesAndFileIdForPmdScan}\"\n}, {\n  \"name\" : \"deltaScan\",\n  \"defaultValue\" : \"{$Context.Apex.copadoQuality.IsDeltaScan}\"\n}, {\n  \"name\" : \"consolidatedResultId\",\n  \"defaultValue\" : \"{$Context.JobExecution__r.DataJson.resultId}\"\n} ]",
                    "copado__Script__c": "export JAVA_TOOL_OPTIONS=\"-XX:CompressedClassSpaceSize=256m -XX:MaxMetaspaceSize=512m -XX:MaxRAMPercentage=50.0\"\n\nparseBranchesAndFileIdJson() {\n\techo $branchesAndFileIdJson\n    originBranch=$(jq -r '.originBranch' <<< $branchesAndFileIdJson)\n    destinationBranch=$(jq -r '.destinationBranch' <<< $branchesAndFileIdJson)\n    rulesetFileId=$(jq -r '.rulesetFileId' <<< $branchesAndFileIdJson)\n    if [[ \"$originBranch\" == *\"null\"* || \"$destinationBranch\" == \"null\" ]]; then\n  \t\tcopado -p \"Error\" -e \"There was some issue executing the scan. Please check logs for more information\" && exit 1\n\tfi\n}\n\ngetCode() {\n \tcopado -p \"Fetching Git branches: $originBranch\"\n\tmkdir code && cd code\n \tgit_depth=${git_depth:-100}\n \tcopado-git-get --depth \"$git_depth\" \"$originBranch\"\n}\n\ngetDiffFiles() {\n\tcopado -p \"Comparing $originBranch with $destinationBranch to obtain diffs\"\n    git fetch\n    git checkout $destinationBranch\n    git checkout $originBranch\n\tdiff=$(git diff --name-only --diff-filter=d origin/$destinationBranch...origin/$originBranch| sed ':a;N;$!ba;s/\\n/,/g')\n\tfiles=\"\"\n    echo \"Git Difference\" $diff\n    IFS=',' read -ra file_array <<< \"$diff\"\n\tfor file in \"${file_array[@]}\";\n\tdo \n    \tfile=$(echo $file| sed 's/.*\\///')\n\t\tfiles=\"$files$file,\"\n\tdone\n    \n   \tif [ -z \"$files\" ]\n    then\n        copado -p \"The scan was skipped because PMD did not detect any code differences between the origin and the destination branches or destructive changes are being performed.\"\n        exit 0\n    else\n        files=${files::-1}\n    fi\n}\n\nremoveUnwantedFiles() {\n\tcd ..\n\tbase_command=\"find 'code/' -type f\"\n    IFS=',' read -ra file_array <<< \"$files\"\n    \n    for value in \"${file_array[@]}\";\n    do\t\n    \tvalue=$(echo \"$value\" | sed 's/[)(]//g' | sed 's/,/ /g')\n    \tbase_command=\"${base_command} -not -iname '${value}'\"\n    done\n   \n\tbase_command=\"${base_command} -delete\"\n    eval ${base_command}\n}\n\ngetRuleset() {\n\tcopado -p \"Downloading Ruleset file\"\n\tcopado --downloadfiles \"$rulesetFileId\" --downloaddir /tmp/\n\truleset=$(</tmp/\"$RulesetFileName\")\n}\n\nrunOriginBranchScan() {\n\tcopado -p \"Running Scan\"\n    echo \"PMD version\"\n    pmd --version\n    \n    fileExtension=$(file --mime-type -b /tmp/ruleset)\n    if [ \"$fileExtension\" = 'application/zip' ];\n    then\n        cd /tmp\n        mv ruleset ruleset.zip\n        unzip -o ruleset.zip -d ruleset\n        cd /app\n        echo \"filenames..\"\n        filenames=$(copado-get-file-names --directoryName /tmp/ruleset) \n        echo $filenames\n\t    pmd check -d code/ -f sarif -R $filenames > scan-output.sarif.json || true\n    else\n        pmd check -d code/ -f sarif -R /tmp/ruleset > scan-output.sarif.json || true\n    fi\n}\n\ngetFilesInDestinationBranch() {\n  \tmkdir dest && cd dest\n  \tcopado-git-get \"$destinationBranch\"\n  \tcd ..\n  \n\tbase_command=\"find 'dest/' -type f\"\n    \n    IFS=',' read -ra file_array <<< \"$files\"\n    for value in \"${file_array[@]}\";\n    do\t\n    \tvalue=$(echo \"$value\" | sed 's/[)(]//g' | sed 's/,/ /g')\n    \tbase_command=\"${base_command} -not -iname '${value}'\"\n    done\n\n\tbase_command=\"${base_command} -delete\"\n\n\techo ${base_command}\n\teval ${base_command}\n}\n\nrunDestinationBranchScan() {\n    \n    if [ -f \"/tmp/ruleset.zip\" ];\n    then\n        filenames=$(copado-get-file-names --directoryName /tmp/ruleset) \n        echo $filenames\n\t    pmd check -d dest/ -f sarif -R $filenames > scan-dest-output.sarif.json || true\n    else\n        pmd check -d dest/ -f sarif -R /tmp/ruleset > scan-dest-output.sarif.json || true\n    fi\n}\n\ndeltaScanOutput() {\n######################## DELTA SCAN NODE.JS SCRIPT START ########################\ncat << __EOF__ > ./main.js\nconst fs = require('fs');\n\nconst sarifDest = JSON.parse(fs.readFileSync('scan-dest-output.sarif.json'));\nconst sarifSrc = JSON.parse(fs.readFileSync('scan-output.sarif.json'));\n\nconst originalViolations = flatten(sarifDest);\nconst latestViolations = flatten(sarifSrc);\n\nconst deltaViolations = latestViolations.filter( (violation) => isNew(violation, originalViolations));\n\nconst deltaSarif = createDeltaSarif(sarifSrc, deltaViolations);\nfs.writeFileSync('delta.sarif.json', JSON.stringify(deltaSarif, null, 2));\n\nfunction createDeltaSarif(completeSarif, deltaViolations) {\n    const result = completeSarif;\n\n    result.runs[0].tool.driver.rules = result.runs[0].tool.driver.rules.filter((rule) => idInViolations(rule.id, deltaViolations));\n\n    result.runs[0].results = result.runs[0].results.filter((result) => idInViolations(result.ruleId, deltaViolations));\n\n    result.runs[0].results = result.runs[0].results.filter((result) => {\n        result.locations = result.locations.filter((location) => {\n            let isNewLocation = false;\n\n            deltaViolations.forEach((newViolation) => {\n                if (result.ruleId == newViolation.ruleId &&\n                    withoutPrefix(location.physicalLocation.artifactLocation.uri) == newViolation.uri &&\n                    JSON.stringify(location.physicalLocation.region) == JSON.stringify(newViolation.region)) {\n                        isNewLocation = true;\n                    }\n            })\n\n            return isNewLocation;\n        });\n\n        return result.locations.length > 0;\n    });\n\n    return result;\n}\n\n\n\nfunction idInViolations(id, violations) {\n    let result = false;\n\n    violations.forEach((violation) => {\n        if (id == violation.ruleId) {\n            result = true;\n        }\n    });\n\n    return result;\n}\n\nfunction flatten(sarif) {\n    return sarif.runs[0].results.reduce( (result, ruleViolations) =>\n            result.concat(ruleViolations.locations.map((location) => {\n                return {\n                    ruleId: ruleViolations.ruleId,\n                    region: location.physicalLocation.region,\n                    uri: withoutPrefix(location.physicalLocation.artifactLocation.uri)\n                }\n            }))\n    , []);\n}\n\nfunction isNew(violation, originalViolations) {\n    let result = true;\n\n    originalViolations.forEach((originalViolation) => {\n        if (JSON.stringify(originalViolation) == JSON.stringify(violation)) {\n            result = false;\n        }\n    });\n\n\treturn result;\n}\n\nfunction withoutPrefix(uri) {\n    return uri.split('code/').pop().split('dest/').pop();\n}\n__EOF__\n######################## DELTA SCAN NODE.JS SCRIPT END ########################\n\n\tviolations=$(node main.js)\n}\n\nattachTestResults() {\n\tcopado -p \"Uploading Analysis Output\"\n\t\n\tif [ -n \"$testResultIds\" ];\n    then\n      testResultsIds=$(echo $testResultIds | sed -e \"s/\\[//g\" | sed -e \"s/\\]//g\" | sed -e \"s/ //g\" | xargs)\n       for testResultId in `echo $testResultsIds | sed 's/[)(]//g' | sed 's/,/ /g'`\n       do\n       \t   if [ \"$deltaScan\" == 'true' ];\n           then\n               copado -u delta.sarif.json --name \"scan-output.sarif.json\" --parentid $testResultId\n           else\n               copado -u scan-output.sarif.json --parentid $testResultId\n           fi \n\t   done\n    fi\n}\n\nattachResult(){\n    if [ \"$deltaScan\" == 'true' ];\n    then\n    copado -u delta.sarif.json --name \"scan-output.sarif.json\"\n    else\n    copado -u scan-output.sarif.json\n    fi\n}\n\nattachConsolidatedResult(){\n      if [ \"$deltaScan\" == 'true' ];\n      then\n        copado -u delta.sarif.json --name \"scan-output.sarif.json\" --parentid $consolidatedResultId\nelse\n        copado -u scan-output.sarif.json --parentid $consolidatedResultId\n      fi \n}\n\nparseBranchesAndFileIdJson\ngetCode\ngetDiffFiles\nremoveUnwantedFiles\ngetRuleset\nrunOriginBranchScan\nif [ \"$deltaScan\" == 'true' ];\nthen\n\tcopado -p \"Executing Delta Scan\"\n\tgetFilesInDestinationBranch\n\trunDestinationBranchScan\n\tdeltaScanOutput\nfi\nattachTestResults\nattachResult\n\nif [ -n \"$consolidatedResultId\" ];\nthen\n\tattachConsolidatedResult\nfi",
                    "copado__Timeout__c": 1440,
                    "copado__Type__c": "Standard",
                    "copado__Version__c": "1",
                    "copado__Worker_Size__c": "S",
                    "Id": "a0l3O000001oDChQAM",
                    "LastReferencedDate": "2023-09-05T14:29:48.000+0000",
                    "LastViewedDate": "2023-09-05T14:29:48.000+0000",
                    "Name": "[PMD] Run PMD"
                },
                {
                    "attributes": {
                        "type": "copado__Function__c",
                        "url": "/services/data/v59.0/sobjects/copado__Function__c/a0l3O000002EsYyQAK"
                    },
                    "copado__ApexClass__c": "copadoQuality.EvaluatePmdCriteriaCallback",
                    "copado__API_Name__c": "Evaluate_PMD_Acceptance_Criteria",
                    "copado__Callback_Type__c": "ApexClass",
                    "copado__Image_Name__c": "copado-multicloud-pmd:v2",
                    "copado__Options__c": "[ ]",
                    "copado__Parameters__c": "[ {\n  \"name\" : \"acceptanceCriteria\",\n  \"defaultValue\" : \"{$Context.JobExecution__r.DataJson.acceptanceCriteria}\"\n}, {\n  \"name\" : \"sarifFileId\",\n  \"defaultValue\" : \"{$Context.Apex.copadoQuality.GetSarifFileId}\"\n}, {\n  \"name\" : \"sarifFileName\",\n  \"defaultValue\" : \"scan-output.sarif.json\"\n} ]",
                    "copado__Script__c": "export JAVA_TOOL_OPTIONS=\"-XX:CompressedClassSpaceSize=256m -XX:MaxMetaspaceSize=512m -XX:MaxRAMPercentage=50.0\"\n\ngetSarif() {\n\tcopado -p \"Downloading scan results\" \t\n    if [ ! -z \"$sarifFileId\" -a \"$sarifFileId\" != \"\" ]\n    then\n        copado --downloadfiles \"$sarifFileId\" --downloaddir /tmp/\n\t\tsarifFile=$(</tmp/\"$sarifFileName\")\n\t\techo \"$sarifFile\" > scan-output.sarif.json\n    else \n    \tcopado -p \"The evaluation of PMD acceptance criteria was skipped because PMD did not detect any code differences between the origin and the destination branches or destructive changes are being performed.\" \n    \texit 0\n    fi\n}\n\nevaluationOutput() {\ncopado -p \"Evaluating Acceptance Criteria\"\n######################## ACCEPTANCE CRITERIA EVALUATION NODE.JS SCRIPT START ########################\ncat << __EOF__ > ./main.js\nconst fs = require('fs');\n\nconst acceptanceCriteria = $acceptanceCriteria;\n\nconst outputSarif = JSON.parse(fs.readFileSync('scan-output.sarif.json'));\n\nconst violations = flatten(outputSarif);\n\nconst finalResult = evaluate(violations, acceptanceCriteria);\nfs.writeFileSync('pmd-evaluation-result.json', JSON.stringify(finalResult));\n\n\nfunction evaluate(violations, acceptanceCriteria) {\n    let errorMessage = [];\n    const evaluationResult = [];\n\n    const criteria = [];\n    for (const metric in acceptanceCriteria) {\n        criteria.push({ acceptanceCriteria: acceptanceCriteria[metric], metric: metric })\n    }\n\n    criteria.forEach((criteriaRow) => {\n\n        const violationCount = getViolationsCount(violations, getPriority(criteriaRow.acceptanceCriteria.priority), criteriaRow.metric);\n       \n        const passed = checkIfPass(criteriaRow.acceptanceCriteria.violationFrequency, criteriaRow.acceptanceCriteria.warning, violationCount);\n        \n        evaluationResult.push(passed);\n\n        if (!passed && criteriaRow.acceptanceCriteria.errorDescription) {\n            errorMessage = getErrorMessage(criteriaRow.acceptanceCriteria.errorDescription, criteriaRow.metric, errorMessage);\n        }\n\n    });\n\n    errorMessage = getFinalMessage(evaluationResult, errorMessage);\n\n    return errorMessage;\n}\n\nfunction flatten(sarif) {\n    const result = [];\n    const rules = sarif.runs[0].tool.driver.rules;\n\n    if (sarif.runs[0].results.length > 0) {\n        sarif.runs[0].results.forEach((ruleResult) => {\n            const rule = rules.find((item) => item.id === ruleResult.ruleId);\n\n            result.push({\n                ruleset: rule.properties.ruleset,\n                priority: rule.properties.priority\n            });\n        });\n    }\n\n    return result;\n}\n\nfunction getPriority(priority) {\n    let result;\n\n    switch (priority) {\n        case '1 - High':\n            result = 1;\n            break;\n        case '2 - Medium High':\n            result = 2;\n            break;\n        case '3 - Medium':\n            result = 3;\n            break;\n        case '4 - Medium Low':\n            result = 4;\n            break;\n        case '5 - Low':\n            result = 5;\n            break;\n        case 'All':\n            result = 'All';\n            break;\n        default:\n            break;\n    }\n\n    return result;\n}\n\nfunction getViolationsCount(allViolations, criteriaPriority, criteriaMetric) {\n    const violations = [];\n\n    if (criteriaPriority === 'All' && criteriaMetric === 'All') {\n        violations.push(...allViolations);\n    } else {\n        allViolations.forEach((violation) => {\n            if (matches(criteriaPriority, criteriaMetric, violation.ruleset, violation.priority)) {\n                violations.push(violation);\n            }\n        });\n    }\n\n    return violations.length;\n}\n\nfunction matches(criteriaPriority, criteriaMetric, violationRuleset, violationPriority) {\n    return ((criteriaPriority === 'All' && violationRuleset === criteriaMetric) || (criteriaMetric === 'All' && violationPriority === criteriaPriority) || (violationRuleset === criteriaMetric && violationPriority === criteriaPriority));\n}\n\nfunction checkIfPass(criteriaFrequency, criteriaWarning, violationCount) {\n\n    switch (criteriaFrequency.toLowerCase()) {\n        case 'equals':\n            return violationCount == criteriaWarning;\n        case 'equals or greater than':\n            return violationCount >= criteriaWarning;\n        case 'equals or less than':\n            return violationCount <= criteriaWarning;\n        case 'greater than':\n            return violationCount > criteriaWarning;\n        case 'less than':\n            return violationCount < criteriaWarning;\n        default:\n            return false;\n    }\n}\n\nfunction getErrorMessage(errorDescription, metric, consolidatedMessage) {\n    consolidatedMessage.push({\n        category: metric,\n        message: errorDescription\n    });\n\n    return consolidatedMessage;\n}\n\nfunction getFinalMessage(evaluationResult, errorMessage) {\n    if (evaluationResult.includes(false) && errorMessage.length == 0) {\n        errorMessage.push({\n            category: 'General',\n            message: 'The test failed. Please check the acceptance criteria in the Acceptance Criteria section of the Test record or in the Quality Gate Rule record, based on the execution. Additionally, review the PMD Violations section in the Result record for specific details about the test failure.'\n        });\n    }\n\n    return errorMessage;\n}\n__EOF__\n######################## ACCEPTANCE CRITERIA EVALUATION NODE.JS SCRIPT END ########################\n\texecuteScript=$(node main.js)\n}\n\nattachResult(){\n    copado -u pmd-evaluation-result.json\n}\n\ncheckforErrorAndExit(){\n   evaluationResult=\"$(<pmd-evaluation-result.json)\"\n   error_message=$(jq -r '.[] | .message' <<< $evaluationResult)\n   if [[ \"$error_message\" != \"\" ]]; then\n       copado -p \"Error\" -e \"$error_message\" && exit 1\n   fi\n}\ngetSarif\nevaluationOutput\nattachResult\ncheckforErrorAndExit",
                    "copado__Timeout__c": 1440,
                    "copado__Type__c": "Standard",
                    "copado__Version__c": "1",
                    "copado__Worker_Size__c": "S",
                    "Id": "a0l3O000002EsYyQAK",
                    "LastReferencedDate": "2023-09-05T14:27:15.000+0000",
                    "LastViewedDate": "2023-09-05T14:27:15.000+0000",
                    "Name": "[PMD] Evaluate PMD Acceptance Criteria"
                },
                {
                    "attributes": {
                        "type": "copado__Function__c",
                        "url": "/services/data/v59.0/sobjects/copado__Function__c/a0l3O0000031lO5QAI"
                    },
                    "copado__ApexClass__c": "copadoQuality.CreateRulesCallback",
                    "copado__API_Name__c": "Create_SCA_Rules",
                    "copado__Callback_Type__c": "ApexClass",
                    "copado__Description__c": "Create SCA Rule Records for a given Ruleset file",
                    "copado__Image_Name__c": "copado-multicloud-pmd:v2",
                    "copado__Options__c": "[ ]",
                    "copado__Parameters__c": "[ {\n  \"required\" : true,\n  \"name\" : \"extensionConfigId\",\n  \"defaultValue\" : \"{$Context.JobExecution__r.copado__ParentRecord_Id__c}\"\n}, {\n  \"required\" : true,\n  \"name\" : \"existingRulesetId\",\n  \"defaultValue\" : \"{$Context.Apex.copadoQuality.GetRulesetId}\"\n} ]",
                    "copado__Script__c": "#!/bin/bash\n\n# Authenticate the SFDX CLI to the Copado Org\nexport SFDX_ACCESS_TOKEN=\"$CF_SF_SESSIONID\"\nsfdx org login access-token --instance-url $CF_SF_ENDPOINT --no-prompt -a CopadoOrg -s\n\ncopado -p \"Fetching rulesets\"\ncopado --downloadfiles \"$existingRulesetId\"\n\nfileExtension=$(file --mime-type -b ruleset)\nfileName=ruleset.${fileExtension##*/}\n\nmv ruleset $fileName\n\ncopado -p \"Processing $fileName\"\nrecordsFileName=$(copado-get-ruleset-sca --inputFile $fileName --parentId \"$extensionConfigId\" -n copadoQuality) || exit 1\n\ncopado -p \"Deleting old Rules\"\nsfdx data query -q \"SELECT Id FROM copadoQuality__SCA_Rule__c WHERE copadoQuality__Extension_Configuration__c = '$extensionConfigId'\" -r \"csv\" > tobedeleted.csv\n\n\nif [ -s \"tobedeleted.csv\" ]; then\necho \"inside if\"\n    sf force data bulk delete -s copadoQuality__SCA_Rule__c -f tobedeleted.csv --json || true\nfi\n\ncopado -p \"Updating Rulesets\"\necho \"File Name: $recordsFileName\"\n\nif [[ \"$recordsFileName\" == \"export.json\" ]]\nthen\n    sf data import tree -f $recordsFileName\nelif [[ \"$recordsFileName\" == \"export.csv\" ]]\nthen\n    sf data upsert bulk --sobject copadoQuality__SCA_Rule__c --file $recordsFileName --external-id Id -w 5\nelse\n    echo \"No data\"\nfi",
                    "copado__Type__c": "Standard",
                    "copado__Version__c": "1",
                    "copado__Worker_Size__c": "S",
                    "Id": "a0l3O0000031lO5QAI",
                    "LastReferencedDate": "2023-09-05T14:26:28.000+0000",
                    "LastViewedDate": "2023-09-05T14:26:28.000+0000",
                    "Name": "[PMD] Create SCA Rules"
                },
                {
                    "attributes": {
                        "type": "copado__Function__c",
                        "url": "/services/data/v59.0/sobjects/copado__Function__c/a0l3O00000323NKQAY"
                    },
                    "copado__API_Name__c": "Create_Default_Ruleset_File",
                    "copado__Description__c": "Fetch Default rule set for a given language from PMD OSS and upload it as a file under extension Configuration",
                    "copado__Image_Name__c": "copado-multicloud-pmd:v2",
                    "copado__Options__c": "[ ]",
                    "copado__Parameters__c": "[ {\n  \"required\" : true,\n  \"name\" : \"ruleLanguage\",\n  \"defaultValue\" : \"{$Context.JobExecution__r.DataJson.ruleLanguage}\"\n}, {\n  \"required\" : true,\n  \"name\" : \"extensionConfigId\",\n  \"defaultValue\" : \"{$Context.JobExecution__r.copado__ParentRecord_Id__c}\"\n} ]",
                    "copado__Script__c": "#!/bin/bash\n\n# Authenticate the SFDX CLI to the Copado Org\nexport SFDX_ACCESS_TOKEN=\"$CF_SF_SESSIONID\"\nsfdx org login access-token --instance-url $CF_SF_ENDPOINT --no-prompt -a CopadoOrg -s\n\ncopado -p \"Fetching ruleset for $ruleLanguage\"\nrulesetFileName=$(copado-get-default-ruleset -l $ruleLanguage) || exit 1\n\n\ncopado -p \"Uploading $rulesetFileName\"\ncopado -u $rulesetFileName --parentid $extensionConfigId -n ruleset",
                    "copado__Type__c": "Standard",
                    "copado__Version__c": "1",
                    "copado__Worker_Size__c": "S",
                    "Id": "a0l3O00000323NKQAY",
                    "LastReferencedDate": "2023-09-05T14:22:00.000+0000",
                    "LastViewedDate": "2023-09-05T14:22:00.000+0000",
                    "Name": "[PMD] Create Default Ruleset File"
                },
                {
                    "attributes": {
                        "type": "copado__Function__c",
                        "url": "/services/data/v59.0/sobjects/copado__Function__c/a0l3O00000325puQAA"
                    },
                    "copado__ApexClass__c": "copadoQuality.RulesetSyncCallback",
                    "copado__API_Name__c": "Generate_PMD_Ruleset_From_SCA_Rules_1",
                    "copado__Callback_Type__c": "ApexClass",
                    "copado__Description__c": "Generate PMD Ruleset From SCA Rules",
                    "copado__Image_Name__c": "copado-multicloud-pmd:v2",
                    "copado__Options__c": "[ ]",
                    "copado__Parameters__c": "[ {\n  \"required\" : true,\n  \"name\" : \"extensionConfigId\",\n  \"defaultValue\" : \"{$Context.JobExecution__r.copado__ParentRecord_Id__c}\"\n} ]",
                    "copado__Script__c": "#!/bin/bash\n\n# Authenticate the SFDX CLI to the Copado Org\nexport SFDX_ACCESS_TOKEN=\"$CF_SF_SESSIONID\"\nsfdx org login access-token --instance-url $CF_SF_ENDPOINT --no-prompt -a CopadoOrg -s\n\ncopado -p \"Fetching Rules\"\n\nSOQL_QUERY=\"SELECT Id, Name, copadoQuality__Extension_Configuration__c, copadoQuality__Active__c, copadoQuality__Rule_Type__c, copadoQuality__Category__c, copadoQuality__Priority__c, copadoQuality__Message__c, copadoQuality__XPath_Version__c, copadoQuality__XPath_Expression__c, copadoQuality__Rule_Language__c, copadoQuality__Rule_Name__c, copadoQuality__Rule_Reference__c, copadoQuality__FilePath__c, copadoQuality__ConfigJson__c FROM copadoQuality__SCA_Rule__c WHERE copadoQuality__Extension_Configuration__c = '$extensionConfigId'\"\n\nsfdx data query --query \"$SOQL_QUERY\" -o CopadoOrg -r \"csv\" > export.csv || exit 1\n\ncopado -p \"Creating ruleset file\"\n\nrulesetFileName=$(copado-get-ruleset-xml -i export.csv -n copadoQuality) || exit 1\ncopado -u $rulesetFileName --parentid $extensionConfigId -n ruleset",
                    "copado__Timeout__c": 1440,
                    "copado__Type__c": "Standard",
                    "copado__Version__c": "1",
                    "copado__Worker_Size__c": "S",
                    "Id": "a0l3O00000325puQAA",
                    "LastReferencedDate": "2023-09-06T14:21:47.000+0000",
                    "LastViewedDate": "2023-09-06T14:21:47.000+0000",
                    "Name": "[PMD] Generate PMD Ruleset From SCA Rules"
                }
            ],
            "ObjectType": "copado__Function__c"
        }
    ],
    "blobsByUID": {}
}
