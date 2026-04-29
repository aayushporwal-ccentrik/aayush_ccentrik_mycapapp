using {aayush.db.master, aayush.db.transaction} from '../db/data-model';
using { aayush.views.CDSViews } from '../db/CDSViews';



service CatalogService @(path : 'CatalogService', requires: 'authenticated-user'){

//@readonly 
//make Employee table unpadatable and non-deletable 
// @Capabilities : { 
//     Updatable: false,
//     Deletable: false
//  } 
    @(restrict:[
        {grant: ['READ'], to: 'Viewer', where: 'bankName = $user.BankName'},
        {grant: ['WRITE'], to: 'Editor'}
    ])
entity EmployeeSet as projection on master.employees;
entity BusinessPartnerSet as projection on master.businesspartner;
    @(restrict:[
        {grant: ['READ'], to: 'Viewer', where: 'COUNTRY = $user.Country'},
    ])
entity AddressSet as projection on master.address;

entity POItems as projection on transaction.poitems;

//Action and instance bound
//since the action is instance bound we will get PO_ID automatically
entity POs as projection on transaction.purchaseorder{
    *,
    //Add labels 
    case OVERALL_STATUS
        when 'A' then 'Approved'
        when 'X' then 'Rejected'
        when 'N' then 'New'
        else 'Pending'
    end as OverallStatusText : String(10),
    
//Add Color
    case OVERALL_STATUS
        when 'A' then 3
        when 'X' then 1
        when 'N' then 2
    else 2
    end as IconColor: Integer
}
actions{
action boost() returns POs;
};

//Expose the CDS view
entity ProductSet as projection on CDSViews.ProductView;
//A non instance bound action--- if you want multiple we will go with the array of actually
function getMostExpensiveOrder() returns POs;
   
}
