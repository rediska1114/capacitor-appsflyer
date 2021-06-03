#import <Foundation/Foundation.h>
#import <Capacitor/Capacitor.h>

// Define the plugin using the CAP_PLUGIN Macro, and
// each method the plugin supports using the CAP_PLUGIN_METHOD macro.
CAP_PLUGIN(AppsflyerPlugin, "Appsflyer",
        CAP_PLUGIN_METHOD(setCurrencyCode, CAPPluginReturnPromise);
        CAP_PLUGIN_METHOD(setСustomerUserID, CAPPluginReturnPromise);
        CAP_PLUGIN_METHOD(anonymizeUser, CAPPluginReturnPromise);
        CAP_PLUGIN_METHOD(setIsStopped, CAPPluginReturnPromise);
        CAP_PLUGIN_METHOD(getAppsFlyerUID, CAPPluginReturnPromise);
        CAP_PLUGIN_METHOD(logEvent, CAPPluginReturnPromise);
        CAP_PLUGIN_METHOD(getSdkVersion, CAPPluginReturnPromise);
        CAP_PLUGIN_METHOD(setAppInviteOneLinkID, CAPPluginReturnPromise);
        CAP_PLUGIN_METHOD(generateInviteLink, CAPPluginReturnPromise);
        CAP_PLUGIN_METHOD(logCrossPromotionImpression, CAPPluginReturnPromise);
        CAP_PLUGIN_METHOD(logCrossPromotionAndOpenStore, CAPPluginReturnPromise);
        CAP_PLUGIN_METHOD(setSharingFilter, CAPPluginReturnPromise);
        CAP_PLUGIN_METHOD(setSharingFilterForAllPartners, CAPPluginReturnPromise);
        CAP_PLUGIN_METHOD(disableCollectASA, CAPPluginReturnPromise);
        CAP_PLUGIN_METHOD(setDisableAdvertisingIdentifier, CAPPluginReturnPromise);
        CAP_PLUGIN_METHOD(setOneLinkCustomDomains, CAPPluginReturnPromise);
        CAP_PLUGIN_METHOD(enableFacebookDeferredApplinks, CAPPluginReturnPromise);
        CAP_PLUGIN_METHOD(setPhoneNumber, CAPPluginReturnPromise);
        CAP_PLUGIN_METHOD(setUserEmails, CAPPluginReturnPromise);
        CAP_PLUGIN_METHOD(validateAndLogInAppPurchase, CAPPluginReturnPromise);
        CAP_PLUGIN_METHOD(setUseReceiptValidationSandbox, CAPPluginReturnPromise);
        CAP_PLUGIN_METHOD(setHost, CAPPluginReturnPromise);
        CAP_PLUGIN_METHOD(addPushNotificationDeepLinkPath, CAPPluginReturnPromise);
        CAP_PLUGIN_METHOD(setResolveDeepLinkURLs, CAPPluginReturnPromise);
        CAP_PLUGIN_METHOD(disableSKAD, CAPPluginReturnPromise);
)
