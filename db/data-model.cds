namespace aayush_db;

using cuid from '@sap/cds/common';

context master{


entity buissnesspartner{
    key NODE_KEY : String(32);
    BP_ROLE: String(2);
    EMAIL_ADDRESS: String(105);
    PHONE_NUMBER: String(32);
    FAX_NUMBER: String(32);
    WEB_ADDRESS: String(44);
    BP_ID: String(32);
    COMPANY_NAME: String(250);
    ADDRESS_GUID: Association to one address;

}

entity address {
    key NODE_KEY: String(32);
    CITY: String(44);
    POSTAL_CODE: String(8);
    STREET: String(44);
    BUILDING: String(128);
    COUNTRY: String(44);
    ADDRESS_TYPE: String(44);
    VAL_START_DATE: Date;
    VAL_END_DATE: Date;
    LATITUDE: Decimal;
    LONGITUDE: Decimal;
}

entity employees: cuid {

    nameFirst: String(40);
    nameMiddle: String(40);
    nameLast: String(40);
    nameInitials: String(40);
    sex: String(1);
    language: String(1);
    phoneNumber: String(20);
    email: String(30);
    Currency: String(4);
    salaryAmount: Decimal(10, 2);
    accountNumber: String(16);
    bankId: String(8);
    bankName: String(64);
}
}