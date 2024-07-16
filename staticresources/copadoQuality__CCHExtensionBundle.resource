{
    "recordTypeMap": {},
    "RecordSetBundles": [
        {
            "Records": [
                {
                    "attributes": {
                        "type": "copado__JobTemplate__c",
                        "url": "/services/data/v59.0/sobjects/copado__JobTemplate__c/a0u3O00000DQptlQAD"
                    },
                    "copado__ApiName__c": "Run_CCH_1",
                    "copado__Type__c": "Standard",
                    "copado__Version__c": 1,
                    "Id": "a0u3O00000DQptlQAD",
                    "LastReferencedDate": "2023-10-19T12:37:46.000+0000",
                    "LastViewedDate": "2023-10-19T12:37:46.000+0000",
                    "Name": "Run CCH"
                },
                {
                    "attributes": {
                        "type": "copado__JobTemplate__c",
                        "url": "/services/data/v59.0/sobjects/copado__JobTemplate__c/a0u3O00000DQqD2QAL"
                    },
                    "copado__ApiName__c": "Generate_Ruleset_from_Compliance_Rules_1",
                    "copado__Description__c": "<p><span style=\"font-size: 14px;\">Generate new ruleset file based on Compliance records</span></p>",
                    "copado__Type__c": "Standard",
                    "copado__Version__c": 1,
                    "Id": "a0u3O00000DQqD2QAL",
                    "LastReferencedDate": "2023-10-19T12:39:46.000+0000",
                    "LastViewedDate": "2023-10-19T12:39:46.000+0000",
                    "Name": "Generate Ruleset from Compliance Rules"
                }
            ],
            "ObjectType": "copado__JobTemplate__c"
        },
        {
            "Records": [
                {
                    "attributes": {
                        "type": "copado__JobStep__c",
                        "url": "/services/data/v59.0/sobjects/copado__JobStep__c/a0t3O000006QkCRQA0"
                    },
                    "copado__ApiName__c": "Run_CCH_1_Execute_CCH_Scan_1",
                    "copado__ConfigJson__c": "{\"functionName\":\"RunPmd\",\"parameters\":[{\"name\":\"git_json\",\"value\":\"{$Context.Repository.Credential}\",\"required\":false},{\"name\":\"RulesetFileName\",\"value\":\"ruleset\",\"required\":false},{\"name\":\"testResultIds\",\"value\":\"{$Context.JobExecution__r.DataJson.resultIds}\",\"required\":false},{\"name\":\"branchesAndFileIdJson\",\"value\":\"{$Context.Apex.copadoQuality.RetrieveBranchesAndFileIdForPmdScan}\"},{\"name\":\"deltaScan\",\"value\":\"{$Context.Apex.copadoQuality.IsDeltaScan}\"},{\"name\":\"consolidatedResultId\",\"value\":\"{$Context.JobExecution__r.DataJson.resultId}\"}]}",
                    "copado__CustomType__c": "Function",
                    "copado__IsSkipped__c": false,
                    "copado__JobTemplate__c": "a0u3O00000DQptlQAD",
                    "copado__Order__c": 1,
                    "copado__Type__c": "Function",
                    "Id": "a0t3O000006QkCRQA0",
                    "Name": "Execute CCH scan"
                },
                {
                    "attributes": {
                        "type": "copado__JobStep__c",
                        "url": "/services/data/v59.0/sobjects/copado__JobStep__c/a0t3O000006QkClQAK"
                    },
                    "copado__ApiName__c": "Generate_Ruleset_from_Compliance_Rules_1_Generate_Ruleset_from_Compliance_Rules_1",
                    "copado__ConfigJson__c": "{\"functionName\":\"Generate_Ruleset_From_Compliance_Rules_1\",\"parameters\":[{\"name\":\"extensionConfigId\",\"value\":\"{$Context.JobExecution__r.copado__ParentRecord_Id__c}\",\"required\":true}]}",
                    "copado__CustomType__c": "Function",
                    "copado__IsSkipped__c": false,
                    "copado__JobTemplate__c": "a0u3O00000DQqD2QAL",
                    "copado__Order__c": 1,
                    "copado__Type__c": "Function",
                    "Id": "a0t3O000006QkClQAK",
                    "Name": "Generate Ruleset from Compliance Rules"
                },
                {
                    "attributes": {
                        "type": "copado__JobStep__c",
                        "url": "/services/data/v59.0/sobjects/copado__JobStep__c/a0t3O000006QkCvQAK"
                    },
                    "copado__ApiName__c": "Run_CCH_1_Create_Compliance_Violations_2",
                    "copado__ConfigJson__c": "{\"functionName\":\"Process_Scan_Results\",\"parameters\":[{\"name\":\"sarifFileId\",\"value\":\"{$Context.Apex.copadoQuality.GetSarifFileId}\"},{\"name\":\"sarifFileName\",\"value\":\"scan-output.sarif.json\"},{\"name\":\"resultId\",\"value\":\"{$Context.copado__Result__c}\"},{\"name\":\"extensionConfigId\",\"value\":\"{$Context.Apex.copadoQuality.GetExtensionConfigurationId}\"}]}",
                    "copado__CustomType__c": "Function",
                    "copado__IsSkipped__c": false,
                    "copado__JobTemplate__c": "a0u3O00000DQptlQAD",
                    "copado__Order__c": 2,
                    "copado__Type__c": "Function",
                    "Id": "a0t3O000006QkCvQAK",
                    "Name": "Process Scan results"
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
                    "LastReferencedDate": "2023-10-19T12:41:24.000+0000",
                    "LastViewedDate": "2023-10-19T12:41:24.000+0000",
                    "Name": "[PMD] Run PMD"
                },
                {
                    "attributes": {
                        "type": "copado__Function__c",
                        "url": "/services/data/v59.0/sobjects/copado__Function__c/a0l3O0000032PFCQA2"
                    },
                    "copado__ApexClass__c": "copadoQuality.RulesetSyncCallback",
                    "copado__API_Name__c": "Generate_Ruleset_From_Compliance_Rules_1",
                    "copado__Callback_Type__c": "ApexClass",
                    "copado__Description__c": "Generate Ruleset From Compliance Rules",
                    "copado__Image_Name__c": "copado-multicloud-pmd:v2",
                    "copado__Options__c": "[ ]",
                    "copado__Parameters__c": "[ {\n  \"required\" : true,\n  \"name\" : \"extensionConfigId\",\n  \"defaultValue\" : \"{$Context.JobExecution__r.copado__ParentRecord_Id__c}\"\n} ]",
                    "copado__Script__c": "#!/bin/bash\n\n# Authenticate the SFDX CLI to the Copado Org\nexport SFDX_ACCESS_TOKEN=\"$CF_SF_SESSIONID\"\nsfdx org login access-token --instance-url $CF_SF_ENDPOINT --no-prompt -a CopadoOrg -s\n\ncopado -p \"Fetching Rules\"\n\nSOQL_QUERY=\"SELECT Id, Name, copadoQuality__Rule_Name__c, copadoQuality__Action__c, copadoQuality__Severity__c, copadoQuality__Error_Message__c, copadoQuality__Risk_Detail__c, copadoQuality__Active__c, copadoQuality__ConfigJSON__c, copadoQuality__XPath_Expression__c, copadoQuality__Extension_Configuration__c FROM copadoQuality__Compliance_Rule__c WHERE copadoQuality__Extension_Configuration__c = '$extensionConfigId'\"\n\nsfdx data query --query \"$SOQL_QUERY\" -o CopadoOrg -r \"csv\" > export.csv || exit 1\n\ncopado -p \"Creating ruleset file\"\nrulesetFileName=$(copado-get-cch-ruleset -i export.csv -n copadoQuality) || exit 1\n\nif [[ \"$rulesetFileName\" == \"ruleset.xml\" || \"$rulesetFileName\" == \"ruleset.zip\" ]]\nthen\n\tcopado -p \"Uploading $rulesetFileName\"\n\tcopado -u $rulesetFileName --parentid $extensionConfigId -n ruleset\nelse\n    copado -p 'Error' -e \"$rulesetFileName\" && exit 1\nfi",
                    "copado__Timeout__c": 1440,
                    "copado__Type__c": "Standard",
                    "copado__Version__c": "1",
                    "copado__Worker_Size__c": "S",
                    "Id": "a0l3O0000032PFCQA2",
                    "LastReferencedDate": "2023-10-19T12:37:00.000+0000",
                    "LastViewedDate": "2023-10-19T12:37:00.000+0000",
                    "Name": "[CCH] Generate Ruleset From Compliance Rules"
                },
                {
                    "attributes": {
                        "type": "copado__Function__c",
                        "url": "/services/data/v59.0/sobjects/copado__Function__c/a0l3O0000032PGPQA2"
                    },
                    "copado__ApexClass__c": "copadoQuality.CchScanCallback",
                    "copado__API_Name__c": "Process_Scan_Results",
                    "copado__Callback_Type__c": "ApexClass",
                    "copado__Description__c": "Processes the scan results to create violation records or alert users with emails",
                    "copado__Image_Name__c": "copado-multicloud-pmd:v2",
                    "copado__Options__c": "[ ]",
                    "copado__Parameters__c": "[ {\n  \"name\" : \"sarifFileId\",\n  \"defaultValue\" : \"{$Context.Apex.copadoQuality.GetSarifFileId}\"\n}, {\n  \"name\" : \"sarifFileName\",\n  \"defaultValue\" : \"scan-output.sarif.json\"\n}, {\n  \"name\" : \"resultId\",\n  \"defaultValue\" : \"{$Context.copado__Result__c}\"\n}, {\n  \"name\" : \"extensionConfigId\",\n  \"defaultValue\" : \"{$Context.Apex.copadoQuality.GetExtensionConfigurationId}\"\n} ]",
                    "copado__Script__c": "copado -p \"Downloading scan results\"\nif [ ! -z \"$sarifFileId\" -a \"$sarifFileId\" != \"\" ]\nthen\n    copado --downloadfiles \"$sarifFileId\" --downloaddir /tmp/\n    sarifFile=$(</tmp/\"$sarifFileName\")\n    echo \"$sarifFile\" > scan-output.sarif.json\nelse\n    copado -p \"The scan results processing was skipped because there weren't any code differences between the origin and the destination branches or destructive changes are being performed.\"\n    exit 0\nfi\n\n\n# Authenticate the SFDX CLI to the Copado Org\nexport SFDX_ACCESS_TOKEN=\"$CF_SF_SESSIONID\"\nsfdx org login access-token --instance-url $CF_SF_ENDPOINT --no-prompt -a CopadoOrg -s\n\ncopado -p \"Fetching Rules\"\nSOQL_QUERY=\"SELECT copadoQuality__Rule_Name__c, copadoQuality__Action__c FROM copadoQuality__Compliance_Rule__c WHERE copadoQuality__Active__c = true AND copadoQuality__Extension_Configuration__c = '$extensionConfigId'\"\n\nsfdx data query --query \"$SOQL_QUERY\" -o CopadoOrg -r \"json\" > rules.json || exit 1\n\n\nfinalResult=$(copado-get-violations -i scan-output.sarif.json -r rules.json  -p \"$resultId\" -n copadoQuality) || exit 1\ncopado -p 'Writing to result' -r \"$finalResult\"\n\nif [[ -s \"violations.json\" ]]\nthen\n\tsf data import tree -f \"violations.json\"\nelif [[ -s \"violations.csv\" ]]\nthen\n    sf data upsert bulk --sobject copadoQuality__Compliance_Rule_Violation__c --file \"violations.csv\" --external-id Id -w 5\nfi\n\n\nabortProcessValue=$(echo \"$finalResult\" | jq -r '.abortProcess')\n\n# Check if the value is greater than 0\nif [ \"$abortProcessValue\" -gt 0 ]; then\n    copado -p \"Error\" -e \"The process is aborted as there is atleast one rule out of compliance with action as 'Abort Process'\" && exit 1\nfi",
                    "copado__Type__c": "Standard",
                    "copado__Version__c": "1",
                    "copado__Worker_Size__c": "S",
                    "Id": "a0l3O0000032PGPQA2",
                    "LastReferencedDate": "2023-10-19T12:35:53.000+0000",
                    "LastViewedDate": "2023-10-19T12:35:53.000+0000",
                    "Name": "[CCH] Process Scan Results"
                }
            ],
            "ObjectType": "copado__Function__c"
        }
    ],
    "blobsByUID": {}
}