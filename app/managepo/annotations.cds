using CatalogService as service from '../../srv/CatalogService';

annotate service.POs with @(

    UI.SelectionFields:[
        PO_ID,
        PARTNER_GUID.COMPANY_NAME,
        PARTNER_GUID.ADDRESS_GUID.COUNTRY,
        GROSS_AMOUNT,
        CURRENCY_code,
        OVERALL_STATUS
    ],

//Add the drill arrow at the side of row
    UI.LineItem:[
        {
        $Type : 'UI.DataField',
        Value : PO_ID,
        },
                {
        $Type : 'UI.DataField',
        Value : PARTNER_GUID_NODE_KEY,
        },
                {
        $Type : 'UI.DataField',
        Value : GROSS_AMOUNT,
                },

                {
        $Type : 'UI.DataField',
        Value : CURRENCY_code,
        },

                {
        $Type : 'UI.DataField',
        Value : OVERALL_STATUS,
        }
    ],

UI.HeaderInfo:{
    TypeName: 'Purchase Order',
    TypeNamePlural: 'Purchase Orders'
}
)