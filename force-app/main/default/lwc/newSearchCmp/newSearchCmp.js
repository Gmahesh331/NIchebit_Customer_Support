import { LightningElement,track } from 'lwc';
import makeGetCallout from '@salesforce/apex/Getting_data_from_api.makeGetCallout';


export default class NewSearchCmp extends LightningElement {
     columns = [
        { label: 'Member_Id', fieldName: 'Member_Id',type: 'button', typeAttributes:{label:{fieldName:'Member_Id'},variant:'base'}},
        { label: 'Name', fieldName: 'Name' },
        { label: 'Mobile', fieldName: 'Mobile' },
        { label: 'PAN_Card', fieldName: 'PAN_Card'},
        { label: 'Phone', fieldName: 'Phone'},
        { label: 'Weight', fieldName: 'Weight' },
        // { label: 'Physically_Handicapped', fieldName: 'Physically_Handicapped'},
        // { label: 'Marital_Status', fieldName: 'Marital_Status'},
        // { label: 'Mailing_Zip_Postal_Code', fieldName: 'Mailing_Zip_Postal_Code'},
        // { label: 'Mailing_Street', fieldName: 'Mailing_Street'},
        // { label: 'Mailing_State', fieldName: 'Mailing_State' },
        // { label: 'Mailing_Country', fieldName: 'Mailing_Country'},
        // { label: 'Mailing_City', fieldName: 'Mailing_City'},
        // { label: 'Height', fieldName: 'Height'},
        // { label: 'Gender', fieldName: 'Gender'},
        // { label: 'Fax', fieldName: 'Fax' },
        // { label: 'Email', fieldName: 'Email' },
        // { label: 'DoB', fieldName: 'DoB'},
        // { label: 'Additional_Information', fieldName: 'Additional_Information'},
        
    ];

    idfromsearch;
    error;
    data;
    objdata={};
    showsearch=false;
    showdetails=false;
    handleClick(event)
    {
  this.idfromsearch=event.target.value;
  //console.log(this.idfromsearch);
    }
    handlebtnClick()
    {
        makeGetCallout({ id: this.idfromsearch })
            .then((result) => {
                this.showsearch=true;
                this.data = result;
                this.objdata=this.data[0];
                console.log(this.objdata);
                this.error = undefined;
            })
            .catch((error) => {
                this.error = error;
                this.data = undefined;
            });
    }
    showdetailsbtn()
    {
        this.showsearch=false;
        this.showdetails=true;
    }

}