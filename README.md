# Capacitor AppsFlyer plugin for Android and iOS

Currently only works on ios, but android support will be coming soon

# Available methods:

- `setCurrencyCode()`
- `setСustomerUserID()`
- `anonymizeUser()`
- `setIsStopped()`
- `getAppsFlyerUID()`
- `logEvent()`
- `getSdkVersion()`
- `setAppInviteOneLinkID()`
- `generateInviteLink()`
- `logCrossPromotionImpression()`
- `logCrossPromotionAndOpenStore()`
- `setSharingFilter()`
- `setSharingFilterForAllPartners()`
- `disableCollectASA()`
- `setDisableAdvertisingIdentifier()`
- `setOneLinkCustomDomains()`
- `enableFacebookDeferredApplinks()`
- `setPhoneNumber()`
- `setUserEmails()`
- `validateAndLogInAppPurchase()`
- `setUseReceiptValidationSandbox()`
- `setHost()`
- `addPushNotificationDeepLinkPath()`
- `setResolveDeepLinkURLs()`
- `disableSKAD()`

# Usage example:

0. In `AppDelegate.swift` (usually `ios/App/App/AppDelegate.swift`)

```swift
...
import AppsFlyerLib

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?

...

  func applicationDidBecomeActive(_: UIApplication) {
    Appsflyer.shared.applicationDidBecomeActive()
  }

...

  func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
    ...
	Appsflyer.shared.application(open: url, options: options)
    ...
  }

...

  func application(_: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
   	...
    Appsflyer.shared.application(continue: userActivity, restorationHandler: restorationHandler)
    ...
	}

...

  func application(_: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
    Appsflyer.shared.application(didReceiveRemoteNotification: userInfo)
  }

...

  func application(_: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
   ...
    Appsflyer.shared.application(didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
   ...
  }

...
}

```

1. In your module (e.g. `app.module.ts`)

```ts
...
import { Appsflyer } from 'capacitor-appsflyer'

@NgModule({
	...
	providers: [
		...
		Appsflyer,
	],
})
export class AppModule {}

```

2. In your main component (e.g. `app.component.ts`)

```ts
...
import { Appsflyer } from 'capacitor-appsflyer'

@Component()
export class AppComponent {
	constructor(private appsflyer: Appsflyer) {
        this.platform
			.ready()
			.then(() => {
                this.appsflyer.addListener('onConversionDataSuccess', (data) => {
					console.log('AppsflyerPlugin onConversionDataSuccess', data)
				})
            })
    }
}

```

// TODO docs
