{
  "recordTypeMap": {},
  "RecordSetBundles": [
    {
      "Records": [
        {
          "attributes": {
            "type": "copado__Function__c",
            "url": "/services/data/v56.0/sobjects/copado__Function__c/a0n7Q0000009X6rQAE"
          },
          "copado__API_Name__c": "setup_audit_trail",
          "copado__Callback_Type__c": "Flow",
          "copado__FlowHandler__c": "Monitor_Environments_Callback",
          "copado__Image_Name__c": "copado-multicloud-metadata:v1",
          "copado__Options__c": "[ ]",
          "copado__Parameters__c": "[ {\n  \"required\" : false,\n  \"name\" : \"SessionID\",\n  \"defaultValue\" : \"{$Context.Credential.SessionId}\"\n}, {\n  \"required\" : false,\n  \"name\" : \"Endpoint\",\n  \"defaultValue\" : \"{$Context.Credential.Endpoint}\"\n}, {\n  \"required\" : false,\n  \"name\" : \"IntegrationUsername\",\n  \"defaultValue\" : \"\"\n} ]",
          "copado__Script__c": "#!/usr/bin/env bash\nset -eo pipefail\n\nexport baseUrl=\"https://$(echo $Endpoint | sed -e 's/[^/]*\\/\\/\\([^@]*@\\)\\?\\([^:/]*\\).*/\\2/')\"\ncopado -p \"setting up sfdx context\"\nsfdx force:project:create -n monitor\ncd monitor\nsfdx force:config:set instanceUrl=${baseUrl} || echo \"error setting instanceUrl\"\n\n## Query SFDC for impersonations\nquery=\"select Name from User where Username='$IntegrationUsername'\"\ncopado -p \"executing User query\"\nsfdx force:data:soql:query -u $SessionID -q \"$query\" --json |jq --raw-output '.result' > userDetails.json  || echo \"error executing User query\"\n\n## Query SFDC for impersonations\nquery=\"SELECT ID, CreatedDate, CreatedBy.Name, CreatedBy.Username, Display from SetupAuditTrail WHERE createddate >= LAST_N_DAYS:3 AND Action = 'suOrgAdminLogin'\"\ncopado -p \"executing Impersonation query\"\nsfdx force:data:soql:query -u $SessionID -q \"$query\" --json |jq --raw-output '.result' > impersonations.json  || echo \"error executing Impersonation query\"\n\n\n## Query SFDC for metadata changes NOT made by the integration user OR they were made by impersonation\nquery=\"SELECT ID, CreatedDate, CreatedBy.Name, CreatedBy.Username, Action, Section, Display, DelegateUser FROM SetupAuditTrail WHERE createddate >= LAST_N_DAYS:3 AND CreatedByID !=null AND CreatedBy.Name !='Automated+Process'  AND ((CreatedBy.Username != '$IntegrationUsername') OR DelegateUser != null)\"\ncopado -p \"executing Metadata query\"\nsfdx force:data:soql:query -u $SessionID -q \"$query\" --json |jq --raw-output '.result' > metadatachanges.json  || echo \"error executing Metadata query\"\n\n## Save impersonation file back to Copado Salesforce Org so it can be processed\ncopado -p \"Uploading result files\"\ncopado -u impersonations.json\ncopado -u metadatachanges.json\ncopado -u userDetails.json",
          "copado__Type__c": "Custom",
          "Id": "a0n7Q0000009X6rQAE",
          "LastReferencedDate": "2022-11-17T08:39:06.000+0000",
          "LastViewedDate": "2022-11-17T08:39:06.000+0000",
          "Name": "Setup Audit Log Trail"
        }
      ],
      "ObjectType": "copado__Function__c"
    }
  ],
  "blobsByUID": {}
}