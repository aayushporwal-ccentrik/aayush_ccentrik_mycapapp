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
        $Type : 'UI.DataFieldForAction',
        Value : CURRENCY_code,
        },

                        {
        $Type : 'UI.DataFieldForAction',
        Label: 'boost',
        inline: true,
        Value : CatalogService.boost,
        },

                {
        $Type : 'UI.DataField',
        Value : OverallStatusText,
        },

        {
            $Type : 'UI.DataField',
            Value : OverallStatusText,
            Criticality : IconColor, // This adds the semantic color!
        }

        
    ],

UI.HeaderInfo:{
    TypeName: 'Purchase Order',
    TypeNamePlural: 'Purchase Orders'
}
)