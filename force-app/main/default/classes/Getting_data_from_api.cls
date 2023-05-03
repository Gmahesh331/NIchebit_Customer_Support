public class Getting_data_from_api {
    
    @AuraEnabled (cacheable=true)
    public static list<object> makeGetCallout(string id) 
    {
        system.debug('The id is' + id);
        list<object> results = new list<object> ();
        //map<string,object> finalresults = new map<string,object> ();
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        String Endpoint ='https://jn6jdtrw4l.execute-api.eu-north-1.amazonaws.com/default/'+id;
        request.setEndpoint(Endpoint);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if(response.getStatusCode() == 200) {
            system.debug(response.getBody());
            //Deserializes the JSON string into collections of primitive data types.
             results = (list<object>) JSON.deserializeUntyped(response.getBody());
                       
            System.debug(results);
            
            
        }
        
        return results;
    }
    /*public class wrapper
    {
        @AuraEnabled public string Member_Id {get;set;}
        @AuraEnabled public string Mobile {get;set;}
        @AuraEnabled public String Name {get;set;}
        @AuraEnabled public String PAN_Card {get;set;}
        @AuraEnabled public String Phone {get;set;}
        @AuraEnabled public String Physically_Handicapped  {get;set;}
        @AuraEnabled public string Marital_Status {get;set;}
        @AuraEnabled public string Mailing_Zip_Postal_Code {get;set;}
        @AuraEnabled public String Mailing_Street {get;set;}
        @AuraEnabled public String Mailing_State {get;set;}
        @AuraEnabled public String Mailing_Country {get;set;}
        @AuraEnabled public String Mailing_City  {get;set;}
        @AuraEnabled public string Height {get;set;}
        @AuraEnabled public string Gender {get;set;}
        @AuraEnabled public String Fax {get;set;}
        @AuraEnabled public String Email {get;set;}
        @AuraEnabled public String DoB {get;set;}
        @AuraEnabled public String Additional_Information  {get;set;}
        @AuraEnabled public String Weight {get;set;}
        
    }*/
}