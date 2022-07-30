import { registerPlugin } from '@capacitor/core';

import type { AppsflyerPlugin } from './definitions';

const CapacitorAppsflyer = registerPlugin<AppsflyerPlugin>('Appsflyer', {
  // web: () => import('./web').then(m => new m.AppsflyerWeb()),
});

export class NotImplementedError extends Error {
  constructor() {
    super('not implemented');
  }
}

export class Appsflyer {
  private plugin = CapacitorAppsflyer;

  addListener = this.plugin.addListener;
  /**
   *
   * @param {string} [currencyCode=USD] http://www.xe.com/iso4217.php
   * @returns
   * @example
   * appsFlyer.setCurrencyCode('USD');
   * appsFlyer.setCurrencyCode('GBP'); // British Pound
   */
  setCurrencyCode(currencyCode: string) {
    return this.plugin.setCurrencyCode({ currencyCode });
  }
  /**
   * @description Setting your own Custom ID enables you to cross-reference your own unique ID with AppsFlyer’s user ID and the other devices’ IDs. This ID is available in AppsFlyer CSV reports along with postbacks APIs for cross-referencing with you internal IDs.
   * Note! The ID must be set during the first launch of the app at the SDK initialization. The best practice is to call this API during the deviceready event, where possible.
   * @param {string} customerUserID
   * @returns
   * @example appsFlyer.setСustomerUserID(customerUserID)
   */
  setСustomerUserID(customerUserID: string) {
    return this.plugin.setСustomerUserID({ customerUserID });
  }
  /**
   * End User Opt-Out (Optional)
   * @description AppsFlyer provides you a method to opt‐out specific users from AppsFlyer analytics. This method complies with the latest privacy requirements and complies with Facebook data and privacy policies. Default is FALSE, meaning tracking is enabled by default.
   * @param {boolean} [value=false]
   * @returns
   * @example appsFlyer.anonymizeUser(true)
   */
  anonymizeUser(value: boolean) {
    return this.plugin.anonymizeUser({ value });
  }
  /**
   * @description In some extreme cases you might want to shut down all SDK tracking due to legal and privacy compliance. This can be achieved with the isStopTracking API. Once this API is invoked, our SDK will no longer communicate with our servers and stop functioning.
   * @param {boolean} value
   * @returns
   * @example appsFlyer.setIsStopped(true)
   */
  setIsStopped(value: boolean) {
    return this.plugin.setIsStopped({ value });
  }
  /**
   * @description Get AppsFlyer’s proprietary Device ID. The AppsFlyer Device ID is the main ID used by AppsFlyer in Reports and APIs.
   * @returns
   * @example
   * const appsFlyerUID = await appsFlyer.getAppsFlyerUID()
   */
  getAppsFlyerUID() {
    return this.plugin
      .getAppsFlyerUID()
      .then(({ appsFlyerUID }) => appsFlyerUID);
  }
  // TODO prettier
  /**
   * @description These in-app events help you track how loyal users discover your app, and attribute them to specific campaigns/media-sources. Please take the time define the event/s you want to measure to allow you to track ROI (Return on Investment) and LTV (Lifetime Value). The `logEvent` method allows you to send in-app events to AppsFlyer analytics. This method allows you to add events dynamically by adding them directly to the application code.
   * @param {string} name custom event name, is presented in your dashboard. See the Event list [here](https://support.appsflyer.com/hc/en-us/articles/115005544169#event-types-recommended-inapp-events-structures)
   * @param {object} values event details
   * @returns
   */
  logEvent(name: string, values: object) {
    return this.plugin.logEvent({ name, values });
  }
  // TODO docs
  getSdkVersion() {
    return this.plugin.getSdkVersion().then(({ version }) => version);
  }
  setAppInviteOneLinkID(appInviteOneLinkID: string) {
    return this.plugin.setAppInviteOneLinkID({ appInviteOneLinkID });
  }
  setSharingFilter(partners: string[]) {
    return this.plugin.setSharingFilter({ partners });
  }
  setSharingFilterForAllPartners = this.plugin.setSharingFilterForAllPartners;
  disableCollectASA(value: boolean) {
    return this.plugin.disableCollectASA({ value });
  }
  setDisableAdvertisingIdentifier(value: boolean) {
    return this.plugin.setDisableAdvertisingIdentifier({ value });
  }
  setOneLinkCustomDomains(domains: string[]) {
    return this.plugin.setOneLinkCustomDomains({ domains });
  }
  enableFacebookDeferredApplinks(value: boolean) {
    return this.plugin.enableFacebookDeferredApplinks({ value });
  }
  setPhoneNumber(phoneNumber: string) {
    return this.plugin.setPhoneNumber({ phoneNumber });
  }
  setUserEmails(emails: string[]) {
    return this.plugin.setUserEmails({ emails });
  }
  setUseReceiptValidationSandbox(value: boolean) {
    return this.plugin.setUseReceiptValidationSandbox({ value });
  }
  setHost(prefix: string, host: string) {
    return this.plugin.setHost({ prefix, host });
  }
  addPushNotificationDeepLinkPath(path: string[]) {
    return this.plugin.addPushNotificationDeepLinkPath({ path });
  }
  setResolveDeepLinkURLs(urls: string[]) {
    return this.plugin.setResolveDeepLinkURLs({ urls });
  }
  disableSKAD(value: boolean) {
    return this.plugin.disableSKAD({ value });
  }

  generateInviteLink() {
    throw new NotImplementedError();
  }
  logCrossPromotionImpression() {
    throw new NotImplementedError();
  }
  logCrossPromotionAndOpenStore() {
    throw new NotImplementedError();
  }
  validateAndLogInAppPurchase() {
    throw new NotImplementedError();
  }
}

export * from './definitions';
