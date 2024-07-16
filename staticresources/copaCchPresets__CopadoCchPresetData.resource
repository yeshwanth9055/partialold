{
    "recordTypeMap": {
        "0125g000001WOLOAA4": {
            "attributes": {
                "type": "RecordType",
                "url": "/services/data/v51.0/sobjects/RecordType/0125g000001WOLOAA4"
            },
            "Id": "0125g000001WOLOAA4",
            "Description": "Use this record type to define scan rules run by Copado.",
            "DeveloperName": "Copado",
            "Name": "Copado",
            "SobjectType": "copado__Compliance_Rule__c",
            "NamespacePrefix": "copado"
        }
    },
    "RecordSetBundles": [
        {
            "Records": [
                {
                    "attributes": {
                        "type": "copado__Compliance_Rule__c",
                        "url": "/services/data/v51.0/sobjects/copado__Compliance_Rule__c/a0H5g000002VJ7jEAG"
                    },
                    "copado__Action__c": "Continue with alert",
                    "copado__Active__c": true,
                    "copado__Error_Message__c": "Profiles cannot have \"No Restriction\" as the password complexity requirement.",
                    "copado__Filter_Criteria__c": "RC-001651",
                    "copado__Is_Valid__c": true,
                    "copado__Matching_Criteria__c": "Greater or Equal",
                    "copado__Metadata_Type__c": "SecuritySettings",
                    "copado__Record_Count__c": 1,
                    "copado__Record_Count_Criteria__c": "Number of groups",
                    "copado__Risk_Details__c": "It is a high security risk for any profile to have \"No Restriction\" as the password complexity requirement.",
                    "copado__Severity__c": "Medium",
                    "CreatedDate": "2021-06-08T05:26:19.000+0000",
                    "Id": "a0H5g000002VJ7jEAG",
                    "IsDeleted": false,
                    "LastModifiedDate": "2021-06-08T05:31:21.000+0000",
                    "Name": "Password Policies: Complexity Requirement",
                    "RecordTypeId": "0125g000001WOLOAA4",
                    "SystemModstamp": "2021-06-08T05:31:21.000+0000"
                },
                {
                    "attributes": {
                        "type": "copado__Compliance_Rule__c",
                        "url": "/services/data/v51.0/sobjects/copado__Compliance_Rule__c/a0H5g000002VJ7kEAG"
                    },
                    "copado__Action__c": "Document Only",
                    "copado__Active__c": true,
                    "copado__Error_Message__c": "Allowing less than 8 characters is not secure.",
                    "copado__Filter_Criteria__c": "RC-001664",
                    "copado__Is_Valid__c": true,
                    "copado__Matching_Criteria__c": "Greater or Equal",
                    "copado__Metadata_Type__c": "SecuritySettings",
                    "copado__Record_Count__c": 1,
                    "copado__Record_Count_Criteria__c": "Number of groups",
                    "copado__Risk_Details__c": "The default value for the password length is 8 characters. Less than 8 characters is not secure.",
                    "copado__Severity__c": "Medium",
                    "CreatedDate": "2021-06-08T05:26:19.000+0000",
                    "Id": "a0H5g000002VJ7kEAG",
                    "IsDeleted": false,
                    "LastModifiedDate": "2021-06-08T05:31:21.000+0000",
                    "Name": "Password Policies: Minimum Length",
                    "RecordTypeId": "0125g000001WOLOAA4",
                    "SystemModstamp": "2021-06-08T05:31:21.000+0000"
                },
                {
                    "attributes": {
                        "type": "copado__Compliance_Rule__c",
                        "url": "/services/data/v51.0/sobjects/copado__Compliance_Rule__c/a0H5g000002VJ7lEAG"
                    },
                    "copado__Action__c": "Abort Process",
                    "copado__Active__c": true,
                    "copado__Error_Message__c": "ViewAllData & ModifyAll data are restricted to only a specific set of administrator profiles. In case your requirement is in conflict with this compliance rule, please check with your technical leader.",
                    "copado__Filter_Criteria__c": "(RC-001554 OR RC-001556) AND RC-001557 AND RC-001558",
                    "copado__Is_Valid__c": true,
                    "copado__Matching_Criteria__c": "Greater or Equal",
                    "copado__Metadata_Type__c": "Profile",
                    "copado__Record_Count__c": 1,
                    "copado__Record_Count_Criteria__c": "Number of groups",
                    "copado__Risk_Details__c": "Only Admins can view and modify all data, if any other profile get these permissions, they could manipulate records that shouldn't",
                    "copado__Severity__c": "Critical",
                    "CreatedDate": "2021-06-08T05:26:19.000+0000",
                    "Id": "a0H5g000002VJ7lEAG",
                    "IsDeleted": false,
                    "LastModifiedDate": "2021-06-08T05:31:21.000+0000",
                    "Name": "Modify View All Data for System Admin Profile Only",
                    "RecordTypeId": "0125g000001WOLOAA4",
                    "SystemModstamp": "2021-06-08T05:31:21.000+0000"
                },
                {
                    "attributes": {
                        "type": "copado__Compliance_Rule__c",
                        "url": "/services/data/v51.0/sobjects/copado__Compliance_Rule__c/a0H5g000002VJ7mEAG"
                    },
                    "copado__Action__c": "Abort Process",
                    "copado__Active__c": true,
                    "copado__Error_Message__c": "No permission set can have Modify All Data access.",
                    "copado__Filter_Criteria__c": "RC-001607 AND RC-001608",
                    "copado__Is_Valid__c": true,
                    "copado__Matching_Criteria__c": "Greater or Equal",
                    "copado__Metadata_Type__c": "PermissionSet",
                    "copado__Record_Count__c": 1,
                    "copado__Record_Count_Criteria__c": "Number of groups",
                    "copado__Risk_Details__c": "Allowing this user permission can give access and ability to modify sensitive data.",
                    "copado__Severity__c": "Critical",
                    "CreatedDate": "2021-06-08T05:26:19.000+0000",
                    "Id": "a0H5g000002VJ7mEAG",
                    "IsDeleted": false,
                    "LastModifiedDate": "2021-06-08T05:31:21.000+0000",
                    "Name": "ModifyAllData in Permission Sets",
                    "RecordTypeId": "0125g000001WOLOAA4",
                    "SystemModstamp": "2021-06-08T05:31:21.000+0000"
                },
                {
                    "attributes": {
                        "type": "copado__Compliance_Rule__c",
                        "url": "/services/data/v51.0/sobjects/copado__Compliance_Rule__c/a0H5g000002VJ7nEAG"
                    },
                    "copado__Action__c": "Abort Process",
                    "copado__Active__c": true,
                    "copado__Error_Message__c": "No permission set can have View All Data access.",
                    "copado__Filter_Criteria__c": "RC-001611 AND RC-001612",
                    "copado__Is_Valid__c": true,
                    "copado__Matching_Criteria__c": "Greater or Equal",
                    "copado__Metadata_Type__c": "PermissionSet",
                    "copado__Record_Count__c": 1,
                    "copado__Record_Count_Criteria__c": "Number of groups",
                    "copado__Risk_Details__c": "Allowing this user permission can give access to sensitive data.",
                    "copado__Severity__c": "Critical",
                    "CreatedDate": "2021-06-08T05:26:19.000+0000",
                    "Id": "a0H5g000002VJ7nEAG",
                    "IsDeleted": false,
                    "LastModifiedDate": "2021-06-08T05:31:21.000+0000",
                    "Name": "ViewAllData in Permission Set",
                    "RecordTypeId": "0125g000001WOLOAA4",
                    "SystemModstamp": "2021-06-08T05:31:21.000+0000"
                },
                {
                    "attributes": {
                        "type": "copado__Compliance_Rule__c",
                        "url": "/services/data/v51.0/sobjects/copado__Compliance_Rule__c/a0H5g000002VJ7oEAG"
                    },
                    "copado__Action__c": "Document Only",
                    "copado__Active__c": true,
                    "copado__Error_Message__c": "Only System Administrator Profile can manage users (Create, edit, and deactivate users, and manage security settings, including profiles and roles.)",
                    "copado__Filter_Criteria__c": "RC-001656 AND RC-001657",
                    "copado__Is_Valid__c": true,
                    "copado__Matching_Criteria__c": "Greater or Equal",
                    "copado__Metadata_Type__c": "Profile",
                    "copado__Record_Count__c": 1,
                    "copado__Record_Count_Criteria__c": "Number of groups",
                    "copado__Risk_Details__c": "Due to HR policies, managing users need to be limited to System Administrator Profile only.",
                    "copado__Severity__c": "Medium",
                    "CreatedDate": "2021-06-08T05:26:19.000+0000",
                    "Id": "a0H5g000002VJ7oEAG",
                    "IsDeleted": false,
                    "LastModifiedDate": "2021-06-08T05:31:21.000+0000",
                    "Name": "Manage Users for System Administrator Profile Only",
                    "RecordTypeId": "0125g000001WOLOAA4",
                    "SystemModstamp": "2021-06-08T05:31:21.000+0000"
                },
                {
                    "attributes": {
                        "type": "copado__Compliance_Rule__c",
                        "url": "/services/data/v51.0/sobjects/copado__Compliance_Rule__c/a0H5g000002VJ7pEAG"
                    },
                    "copado__Action__c": "Continue with alert",
                    "copado__Active__c": true,
                    "copado__Error_Message__c": "Cannot assign 12 or 24 hours of inactivity as the Timeout Session Setting.",
                    "copado__Filter_Criteria__c": "RC-001654 OR RC-001655",
                    "copado__Is_Valid__c": true,
                    "copado__Matching_Criteria__c": "Greater or Equal",
                    "copado__Metadata_Type__c": "SecuritySettings",
                    "copado__Record_Count__c": 1,
                    "copado__Record_Count_Criteria__c": "Number of groups",
                    "copado__Risk_Details__c": "Allowing access to an inactive session for more than 12 hours is a security risk.",
                    "copado__Severity__c": "Medium",
                    "CreatedDate": "2021-06-08T05:26:19.000+0000",
                    "Id": "a0H5g000002VJ7pEAG",
                    "IsDeleted": false,
                    "LastModifiedDate": "2021-06-08T05:31:21.000+0000",
                    "Name": "Session Settings: Timeout",
                    "RecordTypeId": "0125g000001WOLOAA4",
                    "SystemModstamp": "2021-06-08T05:31:21.000+0000"
                },
                {
                    "attributes": {
                        "type": "copado__Compliance_Rule__c",
                        "url": "/services/data/v51.0/sobjects/copado__Compliance_Rule__c/a0H5g000002VJ7qEAG"
                    },
                    "copado__Action__c": "Document Only",
                    "copado__Active__c": true,
                    "copado__Error_Message__c": "Password expirations cannot be \"Never\", \"6 Months\", nor \"1 Year\". Users need to reset a new password every 90 days.",
                    "copado__Filter_Criteria__c": "RC-001647 OR RC-001649 OR RC-001650",
                    "copado__Is_Valid__c": true,
                    "copado__Matching_Criteria__c": "Greater or Equal",
                    "copado__Metadata_Type__c": "SecuritySettings",
                    "copado__Record_Count__c": 1,
                    "copado__Record_Count_Criteria__c": "Number of groups",
                    "copado__Risk_Details__c": "Passwords need to expire every 90 days for security.",
                    "copado__Severity__c": "Medium",
                    "CreatedDate": "2021-06-08T05:26:19.000+0000",
                    "Id": "a0H5g000002VJ7qEAG",
                    "IsDeleted": false,
                    "LastModifiedDate": "2021-06-08T06:48:20.000+0000",
                    "Name": "Password Policies: Expiration",
                    "RecordTypeId": "0125g000001WOLOAA4",
                    "SystemModstamp": "2021-06-08T06:48:20.000+0000"
                },
                {
                    "attributes": {
                        "type": "copado__Compliance_Rule__c",
                        "url": "/services/data/v51.0/sobjects/copado__Compliance_Rule__c/a0H5g000002VJ7rEAG"
                    },
                    "copado__Action__c": "Continue with alert",
                    "copado__Active__c": true,
                    "copado__Error_Message__c": "Setup menu shouldn't be visible to non-Admins",
                    "copado__Filter_Criteria__c": "RC-001644 AND RC-001645 AND RC-001646",
                    "copado__Is_Valid__c": true,
                    "copado__Matching_Criteria__c": "Greater or Equal",
                    "copado__Metadata_Type__c": "Profile",
                    "copado__Record_Count__c": 1,
                    "copado__Record_Count_Criteria__c": "Number of groups",
                    "copado__Risk_Details__c": "Exposing the setup menu to non-authorized users.",
                    "copado__Severity__c": "Medium",
                    "CreatedDate": "2021-06-08T05:26:19.000+0000",
                    "Id": "a0H5g000002VJ7rEAG",
                    "IsDeleted": false,
                    "LastModifiedDate": "2021-06-08T05:31:21.000+0000",
                    "Name": "ViewSetup is restricted to Sys Admin",
                    "RecordTypeId": "0125g000001WOLOAA4",
                    "SystemModstamp": "2021-06-08T05:31:21.000+0000"
                },
                {
                    "attributes": {
                        "type": "copado__Compliance_Rule__c",
                        "url": "/services/data/v51.0/sobjects/copado__Compliance_Rule__c/a0H5g000002VJ7sEAG"
                    },
                    "copado__Action__c": "Continue with alert",
                    "copado__Active__c": true,
                    "copado__Error_Message__c": "Account object CRUD is restricted to Admin Permset. In case your requirement is in conflict with this compliance rule, please check with your technical leader.",
                    "copado__Filter_Criteria__c": "RC-001638 AND (RC-001639 OR RC-001640 OR RC-001641 OR RC-001642) AND RC-001643",
                    "copado__Is_Valid__c": true,
                    "copado__Matching_Criteria__c": "Greater or Equal",
                    "copado__Metadata_Type__c": "PermissionSet",
                    "copado__Record_Count__c": 1,
                    "copado__Record_Count_Criteria__c": "Number of groups",
                    "copado__Risk_Details__c": "Accounts are only managed by admin, of any other permission set has it account information could leak",
                    "copado__Severity__c": "High",
                    "CreatedDate": "2021-06-08T05:26:19.000+0000",
                    "Id": "a0H5g000002VJ7sEAG",
                    "IsDeleted": false,
                    "LastModifiedDate": "2021-06-08T05:31:21.000+0000",
                    "Name": "Account Object CRUD Restricted to Admin PermSet",
                    "RecordTypeId": "0125g000001WOLOAA4",
                    "SystemModstamp": "2021-06-08T05:31:21.000+0000"
                }
            ],
            "ObjectType": "copado__Compliance_Rule__c"
        },
        {
            "Records": [
                {
                    "attributes": {
                        "type": "copado__Compliance_Rule_Criteria__c",
                        "url": "/services/data/v51.0/sobjects/copado__Compliance_Rule_Criteria__c/a0E5g000000lReJEAU"
                    },
                    "copado__Compliance_Rule__c": "a0H5g000002VJ7jEAG",
                    "copado__Criteria__c": "passwordPolicies.complexity<EQUALS>No restriction",
                    "copado__Field__c": "complexity",
                    "copado__Field_Type__c": "STRING",
                    "copado__Node__c": "passwordPolicies",
                    "copado__Operator__c": "equals",
                    "copado__Order__c": 1,
                    "copado__Value__c": "No restriction",
                    "CreatedDate": "2021-06-08T05:31:21.000+0000",
                    "Id": "a0E5g000000lReJEAU",
                    "IsDeleted": false,
                    "LastModifiedDate": "2021-06-08T05:31:21.000+0000",
                    "SystemModstamp": "2021-06-08T05:31:21.000+0000"
                },
                {
                    "attributes": {
                        "type": "copado__Compliance_Rule_Criteria__c",
                        "url": "/services/data/v51.0/sobjects/copado__Compliance_Rule_Criteria__c/a0E5g000000lReKEAU"
                    },
                    "copado__Compliance_Rule__c": "a0H5g000002VJ7kEAG",
                    "copado__Criteria__c": "passwordPolicies.minimumPasswordLength<LESSTHAN>8",
                    "copado__Field__c": "minimumPasswordLength",
                    "copado__Field_Type__c": "STRING",
                    "copado__Node__c": "passwordPolicies",
                    "copado__Operator__c": "less than",
                    "copado__Order__c": 1,
                    "copado__Value__c": "8",
                    "CreatedDate": "2021-06-08T05:31:21.000+0000",
                    "Id": "a0E5g000000lReKEAU",
                    "IsDeleted": false,
                    "LastModifiedDate": "2021-06-08T05:31:21.000+0000",
                    "SystemModstamp": "2021-06-08T05:31:21.000+0000"
                },
                {
                    "attributes": {
                        "type": "copado__Compliance_Rule_Criteria__c",
                        "url": "/services/data/v51.0/sobjects/copado__Compliance_Rule_Criteria__c/a0E5g000000lReLEAU"
                    },
                    "copado__Compliance_Rule__c": "a0H5g000002VJ7lEAG",
                    "copado__Criteria__c": "userPermissions.name<EQUALS>ModifyAllData",
                    "copado__Field__c": "name",
                    "copado__Field_Type__c": "STRING",
                    "copado__Node__c": "userPermissions",
                    "copado__Operator__c": "equals",
                    "copado__Order__c": 1,
                    "copado__Value__c": "ModifyAllData",
                    "CreatedDate": "2021-06-08T05:31:21.000+0000",
                    "Id": "a0E5g000000lReLEAU",
                    "IsDeleted": false,
                    "LastModifiedDate": "2021-06-08T05:31:21.000+0000",
                    "SystemModstamp": "2021-06-08T05:31:21.000+0000"
                },
                {
                    "attributes": {
                        "type": "copado__Compliance_Rule_Criteria__c",
                        "url": "/services/data/v51.0/sobjects/copado__Compliance_Rule_Criteria__c/a0E5g000000lReMEAU"
                    },
                    "copado__Compliance_Rule__c": "a0H5g000002VJ7lEAG",
                    "copado__Criteria__c": "userPermissions.name<EQUALS>ViewAllData",
                    "copado__Field__c": "name",
                    "copado__Field_Type__c": "STRING",
                    "copado__Node__c": "userPermissions",
                    "copado__Operator__c": "equals",
                    "copado__Order__c": 2,
                    "copado__Value__c": "ViewAllData",
                    "CreatedDate": "2021-06-08T05:31:21.000+0000",
                    "Id": "a0E5g000000lReMEAU",
                    "IsDeleted": false,
                    "LastModifiedDate": "2021-06-08T05:31:21.000+0000",
                    "SystemModstamp": "2021-06-08T05:31:21.000+0000"
                },
                {
                    "attributes": {
                        "type": "copado__Compliance_Rule_Criteria__c",
                        "url": "/services/data/v51.0/sobjects/copado__Compliance_Rule_Criteria__c/a0E5g000000lReNEAU"
                    },
                    "copado__Compliance_Rule__c": "a0H5g000002VJ7lEAG",
                    "copado__Criteria__c": "name.value<NOTEQUALTO>System Administrator",
                    "copado__Field__c": "value",
                    "copado__Field_Type__c": "STRING",
                    "copado__Node__c": "name",
                    "copado__Operator__c": "not equal to",
                    "copado__Order__c": 3,
                    "copado__Value__c": "System Administrator",
                    "CreatedDate": "2021-06-08T05:31:21.000+0000",
                    "Id": "a0E5g000000lReNEAU",
                    "IsDeleted": false,
                    "LastModifiedDate": "2021-06-08T05:31:21.000+0000",
                    "SystemModstamp": "2021-06-08T05:31:21.000+0000"
                },
                {
                    "attributes": {
                        "type": "copado__Compliance_Rule_Criteria__c",
                        "url": "/services/data/v51.0/sobjects/copado__Compliance_Rule_Criteria__c/a0E5g000000lReOEAU"
                    },
                    "copado__Compliance_Rule__c": "a0H5g000002VJ7lEAG",
                    "copado__Criteria__c": "userPermissions.enabled<EQUALS>true",
                    "copado__Field__c": "enabled",
                    "copado__Field_Type__c": "BOOLEAN",
                    "copado__Node__c": "userPermissions",
                    "copado__Operator__c": "equals",
                    "copado__Order__c": 4,
                    "copado__Value__c": "true",
                    "CreatedDate": "2021-06-08T05:31:21.000+0000",
                    "Id": "a0E5g000000lReOEAU",
                    "IsDeleted": false,
                    "LastModifiedDate": "2021-06-08T05:31:21.000+0000",
                    "SystemModstamp": "2021-06-08T05:31:21.000+0000"
                },
                {
                    "attributes": {
                        "type": "copado__Compliance_Rule_Criteria__c",
                        "url": "/services/data/v51.0/sobjects/copado__Compliance_Rule_Criteria__c/a0E5g000000lRePEAU"
                    },
                    "copado__Compliance_Rule__c": "a0H5g000002VJ7mEAG",
                    "copado__Criteria__c": "userPermissions.name<EQUALS>ModifyAllData",
                    "copado__Field__c": "name",
                    "copado__Field_Type__c": "STRING",
                    "copado__Node__c": "userPermissions",
                    "copado__Operator__c": "equals",
                    "copado__Order__c": 1,
                    "copado__Value__c": "ModifyAllData",
                    "CreatedDate": "2021-06-08T05:31:21.000+0000",
                    "Id": "a0E5g000000lRePEAU",
                    "IsDeleted": false,
                    "LastModifiedDate": "2021-06-08T05:31:21.000+0000",
                    "SystemModstamp": "2021-06-08T05:31:21.000+0000"
                },
                {
                    "attributes": {
                        "type": "copado__Compliance_Rule_Criteria__c",
                        "url": "/services/data/v51.0/sobjects/copado__Compliance_Rule_Criteria__c/a0E5g000000lReQEAU"
                    },
                    "copado__Compliance_Rule__c": "a0H5g000002VJ7mEAG",
                    "copado__Criteria__c": "userPermissions.enabled<EQUALS>true",
                    "copado__Field__c": "enabled",
                    "copado__Field_Type__c": "BOOLEAN",
                    "copado__Node__c": "userPermissions",
                    "copado__Operator__c": "equals",
                    "copado__Order__c": 2,
                    "copado__Value__c": "true",
                    "CreatedDate": "2021-06-08T05:31:21.000+0000",
                    "Id": "a0E5g000000lReQEAU",
                    "IsDeleted": false,
                    "LastModifiedDate": "2021-06-08T05:31:21.000+0000",
                    "SystemModstamp": "2021-06-08T05:31:21.000+0000"
                },
                {
                    "attributes": {
                        "type": "copado__Compliance_Rule_Criteria__c",
                        "url": "/services/data/v51.0/sobjects/copado__Compliance_Rule_Criteria__c/a0E5g000000lReREAU"
                    },
                    "copado__Compliance_Rule__c": "a0H5g000002VJ7nEAG",
                    "copado__Criteria__c": "userPermissions.name<EQUALS>ViewAllData",
                    "copado__Field__c": "name",
                    "copado__Field_Type__c": "STRING",
                    "copado__Node__c": "userPermissions",
                    "copado__Operator__c": "equals",
                    "copado__Order__c": 1,
                    "copado__Value__c": "ViewAllData",
                    "CreatedDate": "2021-06-08T05:31:21.000+0000",
                    "Id": "a0E5g000000lReREAU",
                    "IsDeleted": false,
                    "LastModifiedDate": "2021-06-08T05:31:21.000+0000",
                    "SystemModstamp": "2021-06-08T05:31:21.000+0000"
                },
                {
                    "attributes": {
                        "type": "copado__Compliance_Rule_Criteria__c",
                        "url": "/services/data/v51.0/sobjects/copado__Compliance_Rule_Criteria__c/a0E5g000000lReSEAU"
                    },
                    "copado__Compliance_Rule__c": "a0H5g000002VJ7nEAG",
                    "copado__Criteria__c": "userPermissions.enabled<EQUALS>true",
                    "copado__Field__c": "enabled",
                    "copado__Field_Type__c": "BOOLEAN",
                    "copado__Node__c": "userPermissions",
                    "copado__Operator__c": "equals",
                    "copado__Order__c": 2,
                    "copado__Value__c": "true",
                    "CreatedDate": "2021-06-08T05:31:21.000+0000",
                    "Id": "a0E5g000000lReSEAU",
                    "IsDeleted": false,
                    "LastModifiedDate": "2021-06-08T05:31:21.000+0000",
                    "SystemModstamp": "2021-06-08T05:31:21.000+0000"
                },
                {
                    "attributes": {
                        "type": "copado__Compliance_Rule_Criteria__c",
                        "url": "/services/data/v51.0/sobjects/copado__Compliance_Rule_Criteria__c/a0E5g000000lReUEAU"
                    },
                    "copado__Compliance_Rule__c": "a0H5g000002VJ7oEAG",
                    "copado__Criteria__c": "name.value<NOTEQUALTO>System Administrator",
                    "copado__Field__c": "value",
                    "copado__Field_Type__c": "STRING",
                    "copado__Node__c": "name",
                    "copado__Operator__c": "not equal to",
                    "copado__Order__c": 1,
                    "copado__Value__c": "System Administrator",
                    "CreatedDate": "2021-06-08T05:31:21.000+0000",
                    "Id": "a0E5g000000lReUEAU",
                    "IsDeleted": false,
                    "LastModifiedDate": "2021-06-08T05:31:21.000+0000",
                    "SystemModstamp": "2021-06-08T05:31:21.000+0000"
                },
                {
                    "attributes": {
                        "type": "copado__Compliance_Rule_Criteria__c",
                        "url": "/services/data/v51.0/sobjects/copado__Compliance_Rule_Criteria__c/a0E5g000000lReVEAU"
                    },
                    "copado__Compliance_Rule__c": "a0H5g000002VJ7oEAG",
                    "copado__Criteria__c": "userPermissions.name<EQUALS>ManageUsers",
                    "copado__Field__c": "name",
                    "copado__Field_Type__c": "STRING",
                    "copado__Node__c": "userPermissions",
                    "copado__Operator__c": "equals",
                    "copado__Order__c": 2,
                    "copado__Value__c": "ManageUsers",
                    "CreatedDate": "2021-06-08T05:31:21.000+0000",
                    "Id": "a0E5g000000lReVEAU",
                    "IsDeleted": false,
                    "LastModifiedDate": "2021-06-08T05:31:21.000+0000",
                    "SystemModstamp": "2021-06-08T05:31:21.000+0000"
                },
                {
                    "attributes": {
                        "type": "copado__Compliance_Rule_Criteria__c",
                        "url": "/services/data/v51.0/sobjects/copado__Compliance_Rule_Criteria__c/a0E5g000000lReWEAU"
                    },
                    "copado__Compliance_Rule__c": "a0H5g000002VJ7pEAG",
                    "copado__Criteria__c": "sessionSettings.sessionTimeout<EQUALS>24 hours of inactivity",
                    "copado__Field__c": "sessionTimeout",
                    "copado__Field_Type__c": "STRING",
                    "copado__Node__c": "sessionSettings",
                    "copado__Operator__c": "equals",
                    "copado__Order__c": 1,
                    "copado__Value__c": "24 hours of inactivity",
                    "CreatedDate": "2021-06-08T05:31:21.000+0000",
                    "Id": "a0E5g000000lReWEAU",
                    "IsDeleted": false,
                    "LastModifiedDate": "2021-06-08T05:31:21.000+0000",
                    "SystemModstamp": "2021-06-08T05:31:21.000+0000"
                },
                {
                    "attributes": {
                        "type": "copado__Compliance_Rule_Criteria__c",
                        "url": "/services/data/v51.0/sobjects/copado__Compliance_Rule_Criteria__c/a0E5g000000lReXEAU"
                    },
                    "copado__Compliance_Rule__c": "a0H5g000002VJ7pEAG",
                    "copado__Criteria__c": "sessionSettings.sessionTimeout<EQUALS>12 hours of inactivity",
                    "copado__Field__c": "sessionTimeout",
                    "copado__Field_Type__c": "STRING",
                    "copado__Node__c": "sessionSettings",
                    "copado__Operator__c": "equals",
                    "copado__Order__c": 2,
                    "copado__Value__c": "12 hours of inactivity",
                    "CreatedDate": "2021-06-08T05:31:21.000+0000",
                    "Id": "a0E5g000000lReXEAU",
                    "IsDeleted": false,
                    "LastModifiedDate": "2021-06-08T05:31:21.000+0000",
                    "SystemModstamp": "2021-06-08T05:31:21.000+0000"
                },
                {
                    "attributes": {
                        "type": "copado__Compliance_Rule_Criteria__c",
                        "url": "/services/data/v51.0/sobjects/copado__Compliance_Rule_Criteria__c/a0E5g000000lRiUEAU"
                    },
                    "copado__Compliance_Rule__c": "a0H5g000002VJ7qEAG",
                    "copado__Criteria__c": "passwordPolicies.expiration<EQUALS>Never",
                    "copado__Field__c": "expiration",
                    "copado__Field_Type__c": "STRING",
                    "copado__Node__c": "passwordPolicies",
                    "copado__Operator__c": "equals",
                    "copado__Order__c": 1,
                    "copado__Value__c": "Never",
                    "CreatedDate": "2021-06-08T06:44:36.000+0000",
                    "Id": "a0E5g000000lRiUEAU",
                    "IsDeleted": false,
                    "LastModifiedDate": "2021-06-08T06:44:36.000+0000",
                    "SystemModstamp": "2021-06-08T06:44:36.000+0000"
                },
                {
                    "attributes": {
                        "type": "copado__Compliance_Rule_Criteria__c",
                        "url": "/services/data/v51.0/sobjects/copado__Compliance_Rule_Criteria__c/a0E5g000000lRiZEAU"
                    },
                    "copado__Compliance_Rule__c": "a0H5g000002VJ7qEAG",
                    "copado__Criteria__c": "passwordPolicies.expiration<EQUALS>OneYear",
                    "copado__Field__c": "expiration",
                    "copado__Field_Type__c": "STRING",
                    "copado__Node__c": "passwordPolicies",
                    "copado__Operator__c": "equals",
                    "copado__Order__c": 3,
                    "copado__Value__c": "OneYear",
                    "CreatedDate": "2021-06-08T06:48:20.000+0000",
                    "Id": "a0E5g000000lRiZEAU",
                    "IsDeleted": false,
                    "LastModifiedDate": "2021-06-08T06:48:20.000+0000",
                    "SystemModstamp": "2021-06-08T06:48:20.000+0000"
                },
                {
                    "attributes": {
                        "type": "copado__Compliance_Rule_Criteria__c",
                        "url": "/services/data/v51.0/sobjects/copado__Compliance_Rule_Criteria__c/a0E5g000000lRiVEAU"
                    },
                    "copado__Compliance_Rule__c": "a0H5g000002VJ7qEAG",
                    "copado__Criteria__c": "passwordPolicies.expiration<EQUALS>SixMonths",
                    "copado__Field__c": "expiration",
                    "copado__Field_Type__c": "STRING",
                    "copado__Node__c": "passwordPolicies",
                    "copado__Operator__c": "equals",
                    "copado__Order__c": 2,
                    "copado__Value__c": "SixMonths",
                    "CreatedDate": "2021-06-08T06:47:02.000+0000",
                    "Id": "a0E5g000000lRiVEAU",
                    "IsDeleted": false,
                    "LastModifiedDate": "2021-06-08T06:47:02.000+0000",
                    "SystemModstamp": "2021-06-08T06:47:02.000+0000"
                },
                {
                    "attributes": {
                        "type": "copado__Compliance_Rule_Criteria__c",
                        "url": "/services/data/v51.0/sobjects/copado__Compliance_Rule_Criteria__c/a0E5g000000lRebEAE"
                    },
                    "copado__Compliance_Rule__c": "a0H5g000002VJ7rEAG",
                    "copado__Criteria__c": "name.value<NOTEQUALTO>System Administrator",
                    "copado__Field__c": "value",
                    "copado__Field_Type__c": "STRING",
                    "copado__Node__c": "name",
                    "copado__Operator__c": "not equal to",
                    "copado__Order__c": 1,
                    "copado__Value__c": "System Administrator",
                    "CreatedDate": "2021-06-08T05:31:21.000+0000",
                    "Id": "a0E5g000000lRebEAE",
                    "IsDeleted": false,
                    "LastModifiedDate": "2021-06-08T05:31:21.000+0000",
                    "SystemModstamp": "2021-06-08T05:31:21.000+0000"
                },
                {
                    "attributes": {
                        "type": "copado__Compliance_Rule_Criteria__c",
                        "url": "/services/data/v51.0/sobjects/copado__Compliance_Rule_Criteria__c/a0E5g000000lRecEAE"
                    },
                    "copado__Compliance_Rule__c": "a0H5g000002VJ7rEAG",
                    "copado__Criteria__c": "userPermissions.enabled<EQUALS>true",
                    "copado__Field__c": "enabled",
                    "copado__Field_Type__c": "BOOLEAN",
                    "copado__Node__c": "userPermissions",
                    "copado__Operator__c": "equals",
                    "copado__Order__c": 2,
                    "copado__Value__c": "true",
                    "CreatedDate": "2021-06-08T05:31:21.000+0000",
                    "Id": "a0E5g000000lRecEAE",
                    "IsDeleted": false,
                    "LastModifiedDate": "2021-06-08T05:31:21.000+0000",
                    "SystemModstamp": "2021-06-08T05:31:21.000+0000"
                },
                {
                    "attributes": {
                        "type": "copado__Compliance_Rule_Criteria__c",
                        "url": "/services/data/v51.0/sobjects/copado__Compliance_Rule_Criteria__c/a0E5g000000lRedEAE"
                    },
                    "copado__Compliance_Rule__c": "a0H5g000002VJ7rEAG",
                    "copado__Criteria__c": "userPermissions.name<EQUALS>ViewSetup",
                    "copado__Field__c": "name",
                    "copado__Field_Type__c": "STRING",
                    "copado__Node__c": "userPermissions",
                    "copado__Operator__c": "equals",
                    "copado__Order__c": 3,
                    "copado__Value__c": "ViewSetup",
                    "CreatedDate": "2021-06-08T05:31:21.000+0000",
                    "Id": "a0E5g000000lRedEAE",
                    "IsDeleted": false,
                    "LastModifiedDate": "2021-06-08T05:31:21.000+0000",
                    "SystemModstamp": "2021-06-08T05:31:21.000+0000"
                },
                {
                    "attributes": {
                        "type": "copado__Compliance_Rule_Criteria__c",
                        "url": "/services/data/v51.0/sobjects/copado__Compliance_Rule_Criteria__c/a0E5g000000lReeEAE"
                    },
                    "copado__Compliance_Rule__c": "a0H5g000002VJ7sEAG",
                    "copado__Criteria__c": "name.value<NOTEQUALTO>Admin",
                    "copado__Field__c": "value",
                    "copado__Field_Type__c": "STRING",
                    "copado__Node__c": "name",
                    "copado__Operator__c": "not equal to",
                    "copado__Order__c": 1,
                    "copado__Value__c": "Admin",
                    "CreatedDate": "2021-06-08T05:31:21.000+0000",
                    "Id": "a0E5g000000lReeEAE",
                    "IsDeleted": false,
                    "LastModifiedDate": "2021-06-08T05:31:21.000+0000",
                    "SystemModstamp": "2021-06-08T05:31:21.000+0000"
                },
                {
                    "attributes": {
                        "type": "copado__Compliance_Rule_Criteria__c",
                        "url": "/services/data/v51.0/sobjects/copado__Compliance_Rule_Criteria__c/a0E5g000000lRefEAE"
                    },
                    "copado__Compliance_Rule__c": "a0H5g000002VJ7sEAG",
                    "copado__Criteria__c": "objectPermissions.allowCreate<EQUALS>true",
                    "copado__Field__c": "allowCreate",
                    "copado__Field_Type__c": "BOOLEAN",
                    "copado__Node__c": "objectPermissions",
                    "copado__Operator__c": "equals",
                    "copado__Order__c": 2,
                    "copado__Value__c": "true",
                    "CreatedDate": "2021-06-08T05:31:21.000+0000",
                    "Id": "a0E5g000000lRefEAE",
                    "IsDeleted": false,
                    "LastModifiedDate": "2021-06-08T05:31:21.000+0000",
                    "SystemModstamp": "2021-06-08T05:31:21.000+0000"
                },
                {
                    "attributes": {
                        "type": "copado__Compliance_Rule_Criteria__c",
                        "url": "/services/data/v51.0/sobjects/copado__Compliance_Rule_Criteria__c/a0E5g000000lRegEAE"
                    },
                    "copado__Compliance_Rule__c": "a0H5g000002VJ7sEAG",
                    "copado__Criteria__c": "objectPermissions.allowDelete<EQUALS>true",
                    "copado__Field__c": "allowDelete",
                    "copado__Field_Type__c": "BOOLEAN",
                    "copado__Node__c": "objectPermissions",
                    "copado__Operator__c": "equals",
                    "copado__Order__c": 3,
                    "copado__Value__c": "true",
                    "CreatedDate": "2021-06-08T05:31:21.000+0000",
                    "Id": "a0E5g000000lRegEAE",
                    "IsDeleted": false,
                    "LastModifiedDate": "2021-06-08T05:31:21.000+0000",
                    "SystemModstamp": "2021-06-08T05:31:21.000+0000"
                },
                {
                    "attributes": {
                        "type": "copado__Compliance_Rule_Criteria__c",
                        "url": "/services/data/v51.0/sobjects/copado__Compliance_Rule_Criteria__c/a0E5g000000lRehEAE"
                    },
                    "copado__Compliance_Rule__c": "a0H5g000002VJ7sEAG",
                    "copado__Criteria__c": "objectPermissions.allowEdit<EQUALS>true",
                    "copado__Field__c": "allowEdit",
                    "copado__Field_Type__c": "BOOLEAN",
                    "copado__Node__c": "objectPermissions",
                    "copado__Operator__c": "equals",
                    "copado__Order__c": 4,
                    "copado__Value__c": "true",
                    "CreatedDate": "2021-06-08T05:31:21.000+0000",
                    "Id": "a0E5g000000lRehEAE",
                    "IsDeleted": false,
                    "LastModifiedDate": "2021-06-08T05:31:21.000+0000",
                    "SystemModstamp": "2021-06-08T05:31:21.000+0000"
                },
                {
                    "attributes": {
                        "type": "copado__Compliance_Rule_Criteria__c",
                        "url": "/services/data/v51.0/sobjects/copado__Compliance_Rule_Criteria__c/a0E5g000000lReiEAE"
                    },
                    "copado__Compliance_Rule__c": "a0H5g000002VJ7sEAG",
                    "copado__Criteria__c": "objectPermissions.allowRead<EQUALS>true",
                    "copado__Field__c": "allowRead",
                    "copado__Field_Type__c": "BOOLEAN",
                    "copado__Node__c": "objectPermissions",
                    "copado__Operator__c": "equals",
                    "copado__Order__c": 5,
                    "copado__Value__c": "true",
                    "CreatedDate": "2021-06-08T05:31:21.000+0000",
                    "Id": "a0E5g000000lReiEAE",
                    "IsDeleted": false,
                    "LastModifiedDate": "2021-06-08T05:31:21.000+0000",
                    "SystemModstamp": "2021-06-08T05:31:21.000+0000"
                },
                {
                    "attributes": {
                        "type": "copado__Compliance_Rule_Criteria__c",
                        "url": "/services/data/v51.0/sobjects/copado__Compliance_Rule_Criteria__c/a0E5g000000lRejEAE"
                    },
                    "copado__Compliance_Rule__c": "a0H5g000002VJ7sEAG",
                    "copado__Criteria__c": "objectPermissions.object<EQUALS>Account",
                    "copado__Field__c": "object",
                    "copado__Field_Type__c": "STRING",
                    "copado__Node__c": "objectPermissions",
                    "copado__Operator__c": "equals",
                    "copado__Order__c": 6,
                    "copado__Value__c": "Account",
                    "CreatedDate": "2021-06-08T05:31:21.000+0000",
                    "Id": "a0E5g000000lRejEAE",
                    "IsDeleted": false,
                    "LastModifiedDate": "2021-06-08T05:31:21.000+0000",
                    "SystemModstamp": "2021-06-08T05:31:21.000+0000"
                }
            ],
            "ObjectType": "copado__Compliance_Rule_Criteria__c"
        }
    ],
    "blobsByUID": {
        "a0E5g000000lRejEAE": {},
        "a0E5g000000lReiEAE": {},
        "a0E5g000000lRehEAE": {},
        "a0E5g000000lRegEAE": {},
        "a0E5g000000lRefEAE": {},
        "a0E5g000000lReeEAE": {},
        "a0E5g000000lRedEAE": {},
        "a0E5g000000lRecEAE": {},
        "a0E5g000000lRebEAE": {},
        "a0E5g000000lRiVEAU": {},
        "a0E5g000000lRiZEAU": {},
        "a0E5g000000lRiUEAU": {},
        "a0E5g000000lReXEAU": {},
        "a0E5g000000lReWEAU": {},
        "a0E5g000000lReVEAU": {},
        "a0E5g000000lReUEAU": {},
        "a0E5g000000lReSEAU": {},
        "a0E5g000000lReREAU": {},
        "a0E5g000000lReQEAU": {},
        "a0E5g000000lRePEAU": {},
        "a0E5g000000lReOEAU": {},
        "a0E5g000000lReNEAU": {},
        "a0E5g000000lReMEAU": {},
        "a0E5g000000lReLEAU": {},
        "a0E5g000000lReKEAU": {},
        "a0E5g000000lReJEAU": {},
        "a0H5g000002VJ7sEAG": {},
        "a0H5g000002VJ7rEAG": {},
        "a0H5g000002VJ7qEAG": {},
        "a0H5g000002VJ7pEAG": {},
        "a0H5g000002VJ7oEAG": {},
        "a0H5g000002VJ7nEAG": {},
        "a0H5g000002VJ7mEAG": {},
        "a0H5g000002VJ7lEAG": {},
        "a0H5g000002VJ7kEAG": {},
        "a0H5g000002VJ7jEAG": {}
    }
}
