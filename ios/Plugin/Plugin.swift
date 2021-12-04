import AppsFlyerLib
import Capacitor
import Foundation

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(AppsflyerPlugin)
public class AppsflyerPlugin: CAPPlugin, AppsFlyerLibDelegate {
    override public func load() {
        let devKey = getConfigValue("devKey") as! String
        let appId = getConfigValue("appId") as! String
        let isDebug = getConfigValue("isDebug") as? Bool ?? false
        let waitForATTUserAuthorization = getConfigValue("waitForATTUserAuthorization") as? Int
        let useUninstallSandbox = getConfigValue("useUninstallSandbox") as? Bool ?? false

        AppsFlyerLib.shared().appsFlyerDevKey = devKey
        AppsFlyerLib.shared().appleAppID = appId
        AppsFlyerLib.shared().delegate = self
        AppsFlyerLib.shared().isDebug = isDebug
        AppsFlyerLib.shared().useUninstallSandbox = useUninstallSandbox
        if waitForATTUserAuthorization != nil {
            AppsFlyerLib.shared().waitForATTUserAuthorization(timeoutInterval: TimeInterval(waitForATTUserAuthorization!))
        }
    }

    @objc func setCurrencyCode(_ call: CAPPluginCall) {
        guard let currencyCode = call.getString("currencyCode") else {
            return call.reject("missing currencyCode option")
        }
        AppsFlyerLib.shared().currencyCode = currencyCode
        call.resolve()
    }

    @objc func setСustomerUserID(_ call: CAPPluginCall) {
        guard let customerUserID = call.getString("customerUserID") else {
            return call.reject("missing customerUserID option")
        }
        AppsFlyerLib.shared().customerUserID = customerUserID
        call.resolve()
    }

    @objc func anonymizeUser(_ call: CAPPluginCall) {
        guard let anonymizeUser = call.getBool("value") else {
            return call.reject("missing value option")
        }
        AppsFlyerLib.shared().anonymizeUser = anonymizeUser
        call.resolve()
    }

    @objc func setIsStopped(_ call: CAPPluginCall) {
        guard let isStopped = call.getBool("value") else {
            return call.reject("missing value option")
        }
        AppsFlyerLib.shared().isStopped = isStopped
        call.resolve()
    }

    @objc func getAppsFlyerUID(_ call: CAPPluginCall) {
        let appsFlyerUID = AppsFlyerLib.shared().getAppsFlyerUID()
        call.resolve([
            "appsFlyerUID": appsFlyerUID,
        ])
    }

    @objc func logEvent(_ call: CAPPluginCall) {
        guard let name = call.getString("name") else {
            return call.reject("missing name option")
        }

        let values = call.getObject("values") ?? nil

        AppsFlyerLib.shared().logEvent(name: name, values: values, completionHandler: {
            (response: [String: Any]?, error: Error?) in
            if let error = error {
                return call.reject(error.localizedDescription)
            }
            call.resolve([
                "response": response as Any,
            ])
        })
    }

    @objc func getSdkVersion(_ call: CAPPluginCall) {
        let version = AppsFlyerLib.shared().getSDKVersion()
        call.resolve([
            "version": version,
        ])
    }

    @objc func setAppInviteOneLinkID(_ call: CAPPluginCall) {
        guard let appInviteOneLinkID = call.getString("appInviteOneLinkID") else {
            return call.reject("missing appInviteOneLinkID option")
        }
        AppsFlyerLib.shared().appInviteOneLinkID = appInviteOneLinkID
        call.resolve()
    }

    @objc func generateInviteLink(_ call: CAPPluginCall) {
        // TODO: generateInviteLink
        call.unimplemented()
    }

    @objc func logCrossPromotionImpression(_ call: CAPPluginCall) {
        // TODO: logCrossPromotionImpression
        call.unimplemented()
    }

    @objc func logCrossPromotionAndOpenStore(_ call: CAPPluginCall) {
        // TODO: logCrossPromotionAndOpenStore
        call.unimplemented()
    }

    @objc func setSharingFilter(_ call: CAPPluginCall) {
        guard let partners = call.getArray("partners", String.self) else {
            return call.reject("missing partners option")
        }
        AppsFlyerLib.shared().sharingFilter = partners
        call.resolve()
    }

    @objc func setSharingFilterForAllPartners(_ call: CAPPluginCall) {
        AppsFlyerLib.shared().setSharingFilterForAllPartners()
        call.resolve()
    }

    @objc func disableCollectASA(_ call: CAPPluginCall) {
        guard let isDisabled = call.getBool("value") else {
            return call.reject("missing value option")
        }
        AppsFlyerLib.shared().disableCollectASA = isDisabled
        call.resolve()
    }

    #if AFSDK_NO_IDFA

        @objc func setDisableAdvertisingIdentifier(_ call: CAPPluginCall) {
            guard let isDisabled = call.getBool("value") else {
                return call.reject("missing value option")
            }
            AppsFlyerLib.shared().setDisableAdvertisingIdentifier = isDisabled
            call.resolve()
        }

    #endif

    @objc func setOneLinkCustomDomains(_ call: CAPPluginCall) {
        guard let domains = call.getArray("domains", String.self) else {
            return call.reject("missing domains option")
        }
        AppsFlyerLib.shared().oneLinkCustomDomains = domains
        call.resolve()
    }

    @objc func enableFacebookDeferredApplinks(_ call: CAPPluginCall) {
        guard let isEnabled = call.getBool("value") else {
            return call.reject("missing value option")
        }
        if isEnabled {
            #if canImport(FBSDKAppLinkUtility)
                AppsFlyerLib.shared().enableFacebookDeferredApplinks(with: FBSDKAppLinkUtility.class)
            #else
                return call.reject("Please install FBSDK First!")
            #endif
        } else {
            AppsFlyerLib.shared().enableFacebookDeferredApplinks(with: nil)
        }
        call.resolve()
    }

    @objc func setPhoneNumber(_ call: CAPPluginCall) {
        guard let phoneNumber = call.getString("phoneNumber") else {
            return call.reject("missing phoneNumber option")
        }
        AppsFlyerLib.shared().phoneNumber = phoneNumber
        call.resolve()
    }

    @objc func setUserEmails(_ call: CAPPluginCall) {
        guard let emails = call.getArray("emails", String.self) else {
            return call.reject("missing emails option")
        }
        AppsFlyerLib.shared().setUserEmails(emails, with: EmailCryptTypeSHA256)
        call.resolve()
    }

    @objc func validateAndLogInAppPurchase(_ call: CAPPluginCall) {
        // TODO: logCrossPromotionAndOpenStore
        call.unimplemented()
    }

    @objc func setUseReceiptValidationSandbox(_ call: CAPPluginCall) {
        guard let value = call.getBool("value") else {
            return call.reject("missing value option")
        }
        AppsFlyerLib.shared().useUninstallSandbox = value
        call.resolve()
    }

    @objc func setHost(_ call: CAPPluginCall) {
        guard let prefix = call.getString("prefix") else {
            return call.reject("missing prefix option")
        }
        guard let host = call.getString("host") else {
            return call.reject("missing host option")
        }
        AppsFlyerLib.shared().setHost(host, withHostPrefix: prefix)
        call.resolve()
    }

    @objc func addPushNotificationDeepLinkPath(_ call: CAPPluginCall) {
        guard let path = call.getArray("path", String.self) else {
            return call.reject("missing path option")
        }
        AppsFlyerLib.shared().addPushNotificationDeepLinkPath(path)
        call.resolve()
    }

    @objc func setResolveDeepLinkURLs(_ call: CAPPluginCall) {
        guard let urls = call.getArray("urls", String.self) else {
            return call.reject("missing urls option")
        }
        AppsFlyerLib.shared().resolveDeepLinkURLs = urls
        call.resolve()
    }

    @objc func disableSKAD(_ call: CAPPluginCall) {
        guard let isDisabled = call.getBool("value") else {
            return call.reject("missing value option")
        }
        AppsFlyerLib.shared().disableSKAdNetwork = isDisabled
        call.resolve()
    }

    public func onConversionDataSuccess(_ installData: [AnyHashable: Any]) {
        print("AppsFlyerPlugin onConversionDataSuccess")
        notifyListeners("onConversionDataSuccess", data: ["installData": installData], retainUntilConsumed: true)

        for (key, value) in installData {
            print(key, ":", value)
        }
        if let status = installData["af_status"] as? String {
            if status == "Non-organic" {
                if let sourceID = installData["media_source"],
                   let campaign = installData["campaign"]
                {
                    print("This is a Non-Organic install. Media source: \(sourceID)  Campaign: \(campaign)")
                }
            } else {
                print("This is an organic install.")
            }
            if let is_first_launch = installData["is_first_launch"] as? Bool,
               is_first_launch
            {
                print("First Launch")
            } else {
                print("Not First Launch")
            }
        }
    }

    public func onConversionDataFail(_ error: Error) {
        print("AppsFlyerPlugin onConversionDataFail")
        notifyListeners("onConversionDataFail", data: ["error": error], retainUntilConsumed: true)
    }

    public func onAppOpenAttribution(_ attributionData: [AnyHashable: Any]) {
        print("AppsFlyerPlugin onAppOpenAttribution")
        notifyListeners("onAppOpenAttribution", data: ["attributionData": attributionData], retainUntilConsumed: true)

        for (key, value) in attributionData {
            print(key, ":", value)
        }
    }

    public func onAppOpenAttributionFailure(_ error: Error) {
        print("AppsFlyerPlugin onAppOpenAttributionFailure")
        notifyListeners("onAppOpenAttributionFailure", data: ["error": error], retainUntilConsumed: true)
    }
}

public class Appsflyer {
    public static let shared = Appsflyer()

    private init() {}

    public func applicationDidBecomeActive() {
        AppsFlyerLib.shared().start()
    }

    public func application(open url: URL, options: [UIApplication.OpenURLOptionsKey: Any]) {
        AppsFlyerLib.shared().handleOpen(url, options: options)
    }

    public func application(continue userActivity: NSUserActivity, restorationHandler _: @escaping ([UIUserActivityRestoring]?) -> Void) {
        AppsFlyerLib.shared().continue(userActivity, restorationHandler: nil)
    }

    public func application(didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
        AppsFlyerLib.shared().handlePushNotification(userInfo)
    }

    public func application(didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        AppsFlyerLib.shared().registerUninstall(deviceToken)
    }
}

// func encodeJson<T: Encodable>(from data: T) -> [String: Any] {
//     let encoder = JSONEncoder()

//     if let json = try? encoder.encode(data) {
//         do {
//             return try JSONSerialization.jsonObject(with: json, options: []) as? [String: Any] ?? [:]
//         } catch {
//             print(error.localizedDescription)
//         }
//     }
//     return [:]
// }
