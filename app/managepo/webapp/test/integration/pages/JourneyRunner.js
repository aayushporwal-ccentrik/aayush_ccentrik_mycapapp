sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/aayush/procurement/po/managepo/test/integration/pages/POsList",
	"com/aayush/procurement/po/managepo/test/integration/pages/POsObjectPage",
	"com/aayush/procurement/po/managepo/test/integration/pages/POItemsObjectPage"
], function (JourneyRunner, POsList, POsObjectPage, POItemsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/aayush/procurement/po/managepo') + '/test/flp.html#app-preview',
        pages: {
			onThePOsList: POsList,
			onThePOsObjectPage: POsObjectPage,
			onThePOItemsObjectPage: POItemsObjectPage
        },
        async: true
    });

    return runner;
});

