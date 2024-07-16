global with sharing class ImportPresetComplianceRules {

    // GLOBAL

    global void execute() {
        List<copado__Compliance_Rule__c> rules = deserializeRulesFromStaticResource();

        fixCriteriaAutoNumbers(rules);
        addToGroup(rules);
    }

    // PRIVATE

    private List<copado__Compliance_Rule__c> deserializeRulesFromStaticResource() {
        StaticResource resource = [SELECT Body FROM StaticResource WHERE Name = 'CopadoCchPresetData' LIMIT 1][0];
        Set<Id> ids = SObjectDataLoader.deserialize(resource.Body.toString());

        return [
            SELECT copado__Filter_Criteria__c, (SELECT Name FROM copado__Compliance_Rule_Criteria__r ORDER BY copado__Order__c ASC)
            FROM copado__Compliance_Rule__c
            WHERE Id IN :ids
        ];
    }

    private void fixCriteriaAutoNumbers(List<copado__Compliance_Rule__c> rules) {
        for (copado__Compliance_Rule__c rule : rules) {
            List<String> criteriaReferences = extractCriteriaReferencesFrom(rule);

            for (Integer i = 0; i < rule.copado__Compliance_Rule_Criteria__r.size(); i++) {
                rule.copado__Filter_Criteria__c = rule.copado__Filter_Criteria__c.replace(
                    criteriaReferences[i],
                    rule.copado__Compliance_Rule_Criteria__r[i].Name
                );
            }

            rule.copado__Is_Valid__c = true;
        }

        update rules;
    }

    private List<String> extractCriteriaReferencesFrom(copado__Compliance_Rule__c rule) {
        List<String> result = new List<String>();

        for (String reference : rule.copado__Filter_Criteria__c.toUpperCase().trim().split('AND|OR')) {
            result.add(reference.replace('(', '').replace(')', '').deleteWhitespace());
        }

        return result;
    }

    private void addToGroup(List<copado__Compliance_Rule__c> rules) {
        copado__Compliance_Rule_Group__c ruleGroup = new copado__Compliance_Rule_Group__c(Name = 'CCH Preset Rule Group');
        insert ruleGroup;

        List<copado__Compliance_Rule_Group_Item__c> items = new List<copado__Compliance_Rule_Group_Item__c>();
        for (copado__Compliance_Rule__c rule : rules) {
            items.add(
                new copado__Compliance_Rule_Group_Item__c(copado__Compliance_Rule_Group__c = ruleGroup.Id, copado__Compliance_Rule__c = rule.Id)
            );
        }
        insert items;
    }
}