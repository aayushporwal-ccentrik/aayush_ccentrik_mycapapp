namespace aayush.db;

using cuid from '@sap/cds/common';

using {aayush.commons} from './commons';

context master
{     
    entity product {
    key NODE_KEY: commons.GUID;
    PRODUCT_ID: String(28);
    TYPE_CODE: String(2);
    CATEGORY: String(32);
    DESCRIPTION: String(255);
    SUPPLIER_GUID: Association to buissnesspartner;
    TAX_TARIF_CODE: Integer;
    MEASURE_UNIT: String(2);
    WEIGHT_MEASURE: Decimal(5,2);
    WEIGHT_UNIT: String(2);
    CURRENCY_CODE: String(4);
    PRICE: Decimal(15,2);
    WIDTH: Decimal(15,2);
    DEPTH: Decimal(15,2);
    HEIGHT: Decimal(15,2);
    DIM_UNIT: String(2);
} 
    entity buissnesspartner
    {
        key NODE_KEY : commons.GUID;
        BP_ROLE : String(2);
        EMAIL_ADDRESS : String(105);
        PHONE_NUMBER : String(32);
        FAX_NUMBER : String(32);
        WEB_ADDRESS : String(44);
        BP_ID : String(32);
        COMPANY_NAME : String(250);
        ADDRESS_GUID : Association to one address;
    }

    entity address
    {
        key NODE_KEY : commons.GUID;
        CITY : String(44);
        POSTAL_CODE : String(8);
        STREET : String(44);
        BUILDING : String(128);
        COUNTRY : String(44);
        ADDRESS_TYPE : String(44);
        VAL_START_DATE : Date;
        VAL_END_DATE : Date;
        LATITUDE : Decimal;
        LONGITUDE : Decimal;
        buissnesspartner : Association to one buissnesspartner on buissnesspartner.ADDRESS_GUID = $self;
    }

    entity employees : cuid
    {
        nameFirst : String(40);
        nameMiddle : String(40);
        nameLast : String(40);
        nameInitials : String(40);
        sex : commons.Gender;
        language : String(1);
        phoneNumber : commons.PhoneNumber;
        email : commons.EmailAddress;
        CURRENCY : String(4);
        salaryAmount : commons.AmountT;
        accountNumber : String(16);
        bankId : String(8);
        bankName : String(64);
    }
}
