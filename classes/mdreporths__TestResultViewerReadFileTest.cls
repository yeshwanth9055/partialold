@isTest
private with sharing class TestResultViewerReadFileTest {
    @isTest
    private static void testSuccess() {
        copado__Test__c test = new copado__Test__c();
        insert test;
        copado__Result__c result = new copado__Result__c(copado__Test__c=test.Id, copado__Job_Type__c='Integration');
        insert result;

        // create the mock file
        ContentVersion cv = new ContentVersion();
        cv.PathOnClient = TestResultViewerReadFile.documentTitle;
        cv.Title = TestResultViewerReadFile.documentTitle;
        cv.VersionData = Blob.valueOf('test file body');
        insert cv;
        ContentDocumentLink cdl = new ContentDocumentLink();
        cdl.ContentDocumentId = [SELECT Id, ContentDocumentId FROM ContentVersion WHERE Id =: cv.Id].ContentDocumentId;
        cdl.LinkedEntityId = result.Id;
        cdl.ShareType = 'V';
        insert cdl;

        TestResultViewerReadFile.Response resp = TestResultViewerReadFile.readFile(test.Id);
        System.assert(resp.size>0, 'File should be found');
    }

}