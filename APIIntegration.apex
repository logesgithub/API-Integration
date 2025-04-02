public with sharing class Gettingotherorgdatascontrollerclass {
    @AuraEnabled
    public static string Gettingotherorgdatascontrollerclass() {
        Http http = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:GettingotherorgrecordsNC/services/data/v59.0/query/?q=SELECT+Name+from+Account' );
        req.setMethod('GET');
        HttpResponse res = http.send(req);
        system.debug('resporsedata'+res.getBody());
        return res.getBody();
    }
}
