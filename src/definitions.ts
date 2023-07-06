import type { PluginListenerHandle } from '@capacitor/core';

export type ConversionDataSuccessListener = (data: {
  installData: any;
}) => void;
export type ConversionDataFailListener = (data: { error: any }) => void;
export type AppOpenAttributionListener = (data: {
  attributionData: any;
}) => void;
export type AppOpenAttributionFailureListener = (data: { error: any }) => void;

export interface AppsflyerPlugin {
  initSdk(options: {
    devKey: string;
    appId: string;
    isDebug?: boolean;
    waitForATTUserAuthorization?: number;
    useUninstallSandbox?: boolean;
  }): Promise<void>;
  setCurrencyCode(options: { currencyCode: string }): Promise<void>;
  setСustomerUserID(options: { customerUserID: string }): Promise<void>;
  anonymizeUser(options: { value: boolean }): Promise<void>;
  setIsStopped(options: { value: boolean }): Promise<void>;
  getAppsFlyerUID(): Promise<{ appsFlyerUID: string }>;
  logEvent(options: {
    name: string;
    values: object;
  }): Promise<{ response: any }>; // TODO response type
  getSdkVersion(): Promise<{ version: string }>;
  setAppInviteOneLinkID(options: { appInviteOneLinkID: string }): Promise<void>;
  setSharingFilter(options: { partners: string[] }): Promise<void>;
  setSharingFilterForAllPartners(): Promise<void>;
  disableCollectASA(options: { value: boolean }): Promise<void>;
  setDisableAdvertisingIdentifier(options: { value: boolean }): Promise<void>;
  setOneLinkCustomDomains(options: { domains: string[] }): Promise<void>;
  enableFacebookDeferredApplinks(options: { value: boolean }): Promise<void>;
  setPhoneNumber(options: { phoneNumber: string }): Promise<void>;
  setUserEmails(options: { emails: string[] }): Promise<void>;
  setUseReceiptValidationSandbox(options: { value: boolean }): Promise<void>;
  setHost(options: { prefix: string; host: string }): Promise<void>;
  addPushNotificationDeepLinkPath(options: { path: string[] }): Promise<void>;
  setResolveDeepLinkURLs(options: { urls: string[] }): Promise<void>;
  disableSKAD(options: { value: boolean }): Promise<void>;

  /**
   * Not implemented for now
   */
  generateInviteLink(): Promise<void>;
  /**
   * Not implemented for now
   */
  logCrossPromotionImpression(): Promise<void>;
  /**
   * Not implemented for now
   */
  logCrossPromotionAndOpenStore(): Promise<void>;
  /**
   * Not implemented for now
   */
  validateAndLogInAppPurchase(): Promise<void>;

  addListener(
    eventName: 'onConversionDataSuccess',
    listenerFunc: ConversionDataSuccessListener,
  ): Promise<PluginListenerHandle> & PluginListenerHandle;

  addListener(
    eventName: 'onConversionDataFail',
    listenerFunc: ConversionDataFailListener,
  ): Promise<PluginListenerHandle> & PluginListenerHandle;

  addListener(
    eventName: 'onAppOpenAttribution',
    listenerFunc: AppOpenAttributionListener,
  ): Promise<PluginListenerHandle> & PluginListenerHandle;

  addListener(
    eventName: 'onAppOpenAttributionFailure',
    listenerFunc: AppOpenAttributionFailureListener,
  ): Promise<PluginListenerHandle> & PluginListenerHandle;
}
