namespace aayush.commons;
using {  Currency} from '@sap/cds/common';



 //reusable types like data element
    type GUID : String(32);
    
    //domain Fixed Values
    type Gender : String(1) enum {
        male = 'M';
        female = 'F';
        undisclosed = 'U';
    };

// When we put amount we always provide reference field called currency
//@ - annotation
    type AmountT : Decimal(10,2) @(   
        Semantics.amount.currencyCode : 'CURRENCY_code',
        sap.unit : 'CURRENCY_code'
        );

//Aspect is similar to append structure in ABAP
aspect Amount : {
    CURRENCY: Currency;
    GROSS_AMOUNT : AmountT;
    NET_AMOUNT : AmountT;
    TAX_AMOUNT : AmountT;
}

// Adding Regex
type PhoneNumber : String(30) @assert.format : '^\+?[1-9]\d{7,14}$';
//For email we are using annotation but we can alsp give a regex
type EmailAddress : String(50) @Communication.IsEmailAddress: true;

