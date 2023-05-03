@istest
public class Getting_data_from_API_test_Mock implements HttpCalloutMock  
{
    // Implement this interface method
    public HttpResponse respond(HttpRequest Request)
    {
        // Create a fake response
        HttpResponse response = new HttpResponse(); 
        response.setBody('[{"Member_Id":"122741384", "Name": "Bailey","Gender": "Male","Marital_Status": "Single","PAN_Card": "CDRUT6925C","DoB": 05/08/2000,"Height": "157",'+
                         '"Weight": "72","Physically_Handicapped":"NO","Phone":"417-294-5349","Mobile":"407-818-0472","Fax":"4 (506) 904-6494","Email":"bbedminster3@1688.com",'+
                         '"Mailing_Street":"Suite 7","Mailing_City":"Bengalore","Mailing_State":"Karnataka","Mailing_Zip_Postal_Code":"560001","Mailing_Country":"IN",'+
                         '"Additional_Information":"..............$"}]');
        response.setStatusCode(200);
        return response; 
        
    }
    @istest
    public static void testmakeGetCallout()
    {
        // Set mock callout class 
        Test.setMock(HttpCalloutMock.class, new Getting_data_from_API_test_Mock());
        // This causes a fake response to be sent
        // from the class that implements HttpCalloutMock. 
        list<object> response = Getting_data_from_api.makeGetCallout('122741384');
        // Verify that the response received contains fake values
       list<string> expectedvalue=new list<string> ();
       expectedvalue.add( '{"Member_Id":"122741384", "Name": "Bailey","Gender": "Male","Marital_Status": "Single","PAN_Card": "CDRUT6925C","DoB": 05/08/2000,"Height": "157",'+
                         '"Weight": "72","Physically_Handicapped":"NO","Phone":"417-294-5349","Mobile":"407-818-0472","Fax":"4 (506) 904-6494","Email":"bbedminster3@1688.com",'+
                         '"Mailing_Street":"Suite 7","Mailing_City":"Bengalore","Mailing_State":"Karnataka","Mailing_Zip_Postal_Code":"560001","Mailing_Country":"IN",'+
                         '"Additional_Information":"..............$"}');
        system.assertEquals(expectedvalue,response);
    }
    
}