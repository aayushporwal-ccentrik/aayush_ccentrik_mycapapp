namespace aayush.views;

using{aayush.db.master, aayush.db.transaction} from '../db/data-model';

context CDSViews {
    
    //if we want the objectname and column name exactly same we would have to use ![ObjectName] 
    //o/w HANA will make every column in capital letters
    define view ![POWorklist] 
    as select from transaction.purchaseorder{

        key PO_ID as ![PurchaseOrderId],
        key Items.PO_ITEM_POS as ![ItemPoistion],
        PARTNER_GUID.BP_ID as ![PartnerId],
        PARTNER_GUID.COMPANY_NAME as ![Company_Name],
        Items.GROSS_AMOUNT as ![GrossAmount],
        Items.NET_AMOUNT as ![NetAmount],
        Items.TAX_AMOUNT as ![TaxAmount],
        Items.CURRENCY as ![CurrencyCode],
        Items.PRODUCT_GUID.DESCRIPTION as ![ProductName],
        PARTNER_GUID.ADDRESS_GUID.COUNTRY as ![Country],
        PARTNER_GUID.ADDRESS_GUID.CITY as ![City]        
    }

    define view ProductHelpView as
    select from master.product {
        @EndUserText.Label: [
            {language:'EN', text: 'ProductId'},
            {language:'HI', text: 'उत्पाद आईडी'}
        ]
        PRODUCT_ID as ![ProductId],

        @EndUserTextLabel: [
            {language:'EN', text: 'Description'},
            {language:'HI', text: 'विवरण'}
        ]
        DESCRIPTION as ![Description],

        @EndUserText.Label: [
            {language:'EN', text:'Category'},
            {language:'HI', text:'वर्ग'}
        ]
        CATEGORY as ![Category],
        
        PRICE as ![Price],
        CURRENCY_CODE as ![CurrencyCode],
        SUPPLIER_GUID.COMPANY_NAME as ![SupplierName]
    };

    define view ![ItemView] as
    select from transaction.poitems {
        key PARENT_KEY.PARTNER_GUID.NODE_KEY as ![SupplierId],
        key PRODUCT_GUID.NODE_KEY as ![ProductKey],
        GROSS_AMOUNT as ![GrossAmount],
        NET_AMOUNT as ![NetAmount],
        TAX_AMOUNT as ![TaxAmount],
        CURRENCY as ![CurrencyCode],
        PARENT_KEY.OVERALL_STATUS as ![Status]
    };

       // view on view along with lazy loading
    define view ![ProductView] as select from master.product

    // Mixin - is a keyword to define loose coupling of dependent data
    // which tells framework to never load the dependent data until requested
    Mixin {
        PO_ITEMS: Association to many ItemView
            on PO_ITEMS.ProductKey = $projection.ProductId
    } into {
        NODE_KEY as ![ProductId],
        DESCRIPTION as ![ProductName],
        CATEGORY as ![Category],
        //CURRENCY_CODE as 
        SUPPLIER_GUID.BP_ID as ![SupplierId],
        SUPPLIER_GUID.COMPANY_NAME as ![SupplierName],
        SUPPLIER_GUID.ADDRESS_GUID.COUNTRY as ![Country],

        // exposed association, @ Runtime the data will be loaded on-demand - lazy loading
        PO_ITEMS as ![To_Items]
    };

    define view CProductsSalesAnalytics as
        select from ProductView{

            key ProductName,
            Country,
            sum(To_Items.GrossAmount) as ![TotalPurchaseAmount]: Decimal(15,2),
            To_Items.CurrencyCode as CurrencyCode
        } group by ProductName, Country, To_Items.CurrencyCode;
    

}


