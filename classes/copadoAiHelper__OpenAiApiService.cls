public with sharing class OpenAiApiService {

    public class OpenAiWrapper {
        @AuraEnabled
        public Boolean isSuccess { get; set; }

        @AuraEnabled
        public Integer statusCode { get; set; }

        @AuraEnabled
        public String status { get; set; }

        @AuraEnabled
        public String message { get; set; }

        @AuraEnabled
        public String response { get; set; }
    }

    @AuraEnabled
    public static OpenAiWrapper sendRequest(String body) {

        // NOTE: we parse the body to reprocess the request and enforce the org defaults to maintain compatibility
        Map<String, Object> bodyMap = (Map<String, Object>)JSON.deserializeUntyped(body);

        Copado_AI_Companion_Configuration__mdt conf = getConfig();
        if(conf.Max_Tokens__c>0) {
            bodyMap.put('max_tokens', Integer.valueOf(conf.Max_Tokens__c));
        }
        bodyMap.put('temperature', conf.OpenAI_Temperature__c);
        String model = String.isEmpty(conf.OpenAI_Model__c) ?'' : conf.OpenAI_Model__c;
        bodyMap.put('model', model.replace('copado-', ''));
        body = JSON.serialize(bodyMap);
        System.debug(conf.OpenAI_Model__c);
        HttpResponse res;
        try{
            if(model.startsWith('copado-')) {
                res = copado.ApiProxy.callAI(body);
            }else{
                // Use the external OpenAI account
                HttpRequest req = new HttpRequest();
                req.setEndpoint('callout:.__OpenAI/v1/chat/completions');
                req.setHeader('Content-Type', 'application/json');
                req.setMethod('POST');
                req.setBody(body);
                req.setTimeout(110000);
                Http http = new Http();
                res = http.send(req);
            }
        }catch(Exception e) {
            System.debug(LoggingLevel.ERROR, 'Error: ' + e.getLineNumber()+' '+ e);
            res = new HttpResponse();
            res.setBody(e.getMessage());
            res.setStatus('Server Error');
            res.setStatusCode(500);
        } 

        OpenAiWrapper lwcResponse = new OpenAiWrapper();
        lwcResponse.isSuccess = false;
        lwcResponse.statusCode = res.getStatusCode();
        lwcResponse.status = res.getStatus();
        if (res.getStatusCode() == 200) {
            lwcResponse.isSuccess = true;
            lwcResponse.message = '';
            lwcResponse.response = res.getBody();
        } else {
            lwcResponse.isSuccess = false;
            lwcResponse.message = 'Could not contact the API. Details: ' + res.getStatus() + ' ' + res.getBody();
        }
        return lwcResponse;
    }

    public static Copado_AI_Companion_Configuration__mdt getConfig() {
        // for test only, we will ignore the configuration. It cannot be created by the tests
        if(Test.isRunningTest()) {
            return new Copado_AI_Companion_Configuration__mdt();
        }

        Map<String, Copado_AI_Companion_Configuration__mdt> confs = Copado_AI_Companion_Configuration__mdt.getAll();
        for(Copado_AI_Companion_Configuration__mdt c : confs.values()) {
            if(c.DeveloperName!='Default') {
                return c;
            }
        }
        if(!confs.isEmpty()) {
            // returns the default record, since there was no non-default named one.
            return confs.values()[0];
        }
        // not having any record should never happen, but just in case.
        return new Copado_AI_Companion_Configuration__mdt();
    }
}