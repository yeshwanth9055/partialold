public with sharing class TestResultViewerReadFile {
    @testVisible
    private final static String documentTitle = 'metadata_report_hs.json';

    // NOTE: objectId can be a Test or a Test Result?
    @AuraEnabled(cacheable=true)
    public static Response readFile(Id objectId) {
        String parentId = objectId;
        Schema.SObjectType token = objectId.getSObjectType();
        if( token == copado__Result__c.sObjectType ) {
            // no need to do anything(?)
        }else if( token == copado__Test__c.sObjectType ) {
            // TODO: find the ... last result associated with this?
            copado__Result__c[] results = [SELECT Id FROM copado__Result__c WHERE copado__Test__c = :parentId WITH SECURITY_ENFORCED ORDER BY CreatedDate DESC LIMIT 1];
            if(!results.isempty()) {
                parentId = results[0].Id;
            }
        }

        System.debug('request: '+objectId+' '+parentId+' '+documentTitle);
        Response response = new Response();

        List<ContentDocumentLink> cdls = [SELECT 
            ContentDocumentId,
            ContentDocument.LatestPublishedVersion.ContentSize, 
            ContentDocument.LatestPublishedVersion.VersionData
                FROM ContentDocumentLink 
                WHERE LinkedEntityId = :parentId 
                AND (ContentDocument.Title = :documentTitle OR ContentDocument.Title = :documentTitle.substringBeforeLast('.') )
                WITH SECURITY_ENFORCED ORDER BY ContentDocument.LastModifiedDate DESC LIMIT 1];
        for(ContentDocumentLink cdl : cdls) {
            response.contentDocumentId = cdl.ContentDocumentId;
            response.size = cdl.ContentDocument.LatestPublishedVersion.ContentSize;
            if(response.size < 5000000) {
                response.data = cdl.ContentDocument.LatestPublishedVersion.VersionData.toString();
            }
        }

        return response;
    }

    public with sharing class Response {
        @AuraEnabled
        public Integer size=0;
        @AuraEnabled
        public String data;
        @AuraEnabled
        public String contentDocumentId;
    }

    public with sharing class CustomException extends Exception {}
}