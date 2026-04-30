using CatalogService as service from '../../srv/CatalogService';

annotate service.POs with @(

    UI.SelectionFields: [
        PO_ID,
        PARTNER_GUID.COMPANY_NAME,
        PARTNER_GUID.ADDRESS_GUID.COUNTRY,
        GROSS_AMOUNT,
        CURRENCY_code,
        OVERALL_STATUS
    ],

    //Add the drill arrow at the side of row
    UI.LineItem       : [
        {
            $Type: 'UI.DataField',
            Value: PO_ID,
        },
        {
            $Type: 'UI.DataField',
            Value: PARTNER_GUID_NODE_KEY,
        },
        {
            $Type: 'UI.DataField',
            Value: GROSS_AMOUNT,
        },

        {
            $Type: 'UI.DataField',
            Value: CURRENCY_code,
        },

        {
            $Type : 'UI.DataFieldForAction',
            Label : 'boost',
            Inline: true,
            Action : 'CatalogService.boost',
        },

        {
            $Type: 'UI.DataField',
            Value: OverallStatusText,
        },

        {
            $Type      : 'UI.DataField',
            Value      : OverallStatusText,
            Criticality: IconColor, // This adds the semantic color!
        }


    ],

    UI.HeaderInfo     : {
        TypeName      : 'Purchase Order',
        TypeNamePlural: 'Purchase Orders',
        Title         : {Value: PO_ID},
        Description   : {Value: PARTNER_GUID_NODE_KEY},
        ImageUrl      : 'data:image/jpeg;base64,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'
    },

    UI.Facets         : [{
        $Type : 'UI.CollectionFacet',
        Label : 'Additional Info',
        Facets: [
            {
                $Type : 'UI.ReferenceFacet',
                Label : 'Order Details',
                Target: '@UI.Identification'
            },
            {
                $Type : 'UI.ReferenceFacet',
                Label : 'Configuration Details',
                Target: '@UI.FieldGroup#Spiderman'
            },
            {
                $Type : 'UI.ReferenceFacet',
                Label : 'Status Info',
                Target: '@UI.FieldGroup#Superman'
            }

        ],

    },
    {
        $Type : 'UI.ReferenceFacet',
        Label: 'Order Items',
        Target : 'Items/@UI.LineItem'
           
    }],

    UI.Identification : [
        {

            $Type: 'UI.DataField',
            Value: PO_ID
        },
        {
            $Type: 'UI.DataField',
            Value: PARTNER_GUID_NODE_KEY
        },
        {
            $Type: 'UI.DataField',
            Value: OVERALL_STATUS
        }
    ],

    UI.FieldGroup #Spiderman    : {
        Label: 'Pricing',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: OverallStatusText,
            },
            {
                $Type: 'UI.DataField',
                Value: NET_AMOUNT,
            },
            {
                $Type: 'UI.DataField',
                Value: TAX_AMOUNT,
            }
        ]
    },

    UI.FieldGroup #Superman:{
        Label : 'Status Info',
    Data  : [
        {
            $Type : 'UI.DataField',
            Value : CURRENCY_code,
        },
        {
            $Type : 'UI.DataField',
            Value : OVERALL_STATUS,
        },
        {
            $Type : 'UI.DataField',
            Value : YOUR_FIELD_NAME, // Replace with your actual property
        }
    ],
    }
);

annotate service.POItems @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : PO_ITEM_POS,
            Label : 'Item Position',
        },
        {
            $Type : 'UI.DataField',
            Value : PRODUCT_GUID_NODE_KEY,
            Label : 'Product ID',
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
            Value : TAX_AMOUNT,
        },
        {
            $Type : 'UI.DataField',
            Value : NET_AMOUNT,
        }
    ],
    UI.Facets:[
        {
            $Type: 'UI.ReferenceFacet',
            Label: 'Item Details',
            Target: '@UI.Identification'
        },
        {
            $Type: 'UI.ReferenceFacet',
            Label: 'Product Details',
            Target: '@UI.FieldGroup#ProdInfo'
        }
    ],
    
//Header that appear when we drill down on second screen
    UI.HeaderInfo:{
            TypeName: 'Order Item',
            TypeNamePlural: 'Order Items',
            Title: {Value: PO_ITEM_POS},
            Description:{Value: PRODUCT_GUID.ProductName}
        },


//Fields that appear when we drill down on second screen
    UI.Identification: [
        {
                $Type : 'UI.DataField',
                Value: PO_ITEM_POS,
        },
                {
                $Type : 'UI.DataField',

                Value: PRODUCT_GUID_NODE_KEY ,
        },
                {
                $Type : 'UI.DataField',
                Value: GROSS_AMOUNT,
        },
                {
                $Type : 'UI.DataField',
                Value: NET_AMOUNT,
                
        },
                {
                $Type : 'UI.DataField',
                Value: TAX_AMOUNT,
        },
                {
                $Type : 'UI.DataField',
                Value: CURRENCY_code,
        },
    ],

    UI.FieldGroup#ProdInfo: {
    Label:'Product Info',
    Data: [
        {
                $Type : 'UI.DataField',
                Value: PO_ITEM_POS,
        },
        {
                $Type : 'UI.DataField',
                Value: PRODUCT_GUID.ProductId,
        },
        {
                $Type : 'UI.DataField',
                Value: PRODUCT_GUID.ProductName,
        },
        {
                $Type : 'UI.DataField',
                Value: PRODUCT_GUID.Category,
        },
        {
                $Type : 'UI.DataField',
                Value: PRODUCT_GUID.SupplierId,
        }
    ]
}
);


annotate service.POs with @(
    odata.draft.enabled: true
) {
    PARTNER_GUID @(
        Common.Text: PARTNER_GUID.COMPANY_NAME
        );
    OVERALL_STATUS @(
                Common.Text: OverallStatusText
    )
} ;

annotate service.POItems with {
    PRODUCT_GUID @(
        Common.Text: PRODUCT_GUID.ProductName
        )
} ;
