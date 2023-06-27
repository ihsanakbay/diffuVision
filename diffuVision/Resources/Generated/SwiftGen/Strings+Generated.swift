// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum LocalizationStrings {
  /// AI Image Generator
  internal static let appDescription = LocalizationStrings.tr("Localizable", "appDescription", fallback: "AI Image Generator")
  /// Localizable.strings
  ///   diffuVision
  /// 
  ///   Created by İhsan Akbay on 23.05.2023.
  internal static let appTitle = LocalizationStrings.tr("Localizable", "appTitle", fallback: "diffuVision")
  /// Cancel
  internal static let cancel = LocalizationStrings.tr("Localizable", "cancel", fallback: "Cancel")
  /// Continue
  internal static let `continue` = LocalizationStrings.tr("Localizable", "continue", fallback: "Continue")
  /// You haven't generated an image yet.
  /// Enter your prompt and turn your ideas into images.
  internal static let dashboardTitle = LocalizationStrings.tr("Localizable", "dashboardTitle", fallback: "You haven't generated an image yet.\nEnter your prompt and turn your ideas into images.")
  /// Delete your account
  internal static let deleteAccount = LocalizationStrings.tr("Localizable", "deleteAccount", fallback: "Delete your account")
  /// Your account will be permanently deleted.
  /// Do you confirm?
  internal static let deleteAccountConfirmationMessage = LocalizationStrings.tr("Localizable", "deleteAccountConfirmationMessage", fallback: "Your account will be permanently deleted.\nDo you confirm?")
  /// Done
  internal static let doneButton = LocalizationStrings.tr("Localizable", "doneButton", fallback: "Done")
  /// An unexpected error has occurred
  internal static let error = LocalizationStrings.tr("Localizable", "error", fallback: "An unexpected error has occurred")
  /// Give us feedback
  internal static let feedback = LocalizationStrings.tr("Localizable", "feedback", fallback: "Give us feedback")
  /// Generating image. Please wait.
  internal static let generateImage = LocalizationStrings.tr("Localizable", "generateImage", fallback: "Generating image. Please wait.")
  /// Get Started
  internal static let getStarted = LocalizationStrings.tr("Localizable", "getStarted", fallback: "Get Started")
  /// Logout
  internal static let logout = LocalizationStrings.tr("Localizable", "logout", fallback: "Logout")
  /// Are you sure you want to logout?
  internal static let logoutConfirmationMessage = LocalizationStrings.tr("Localizable", "logoutConfirmationMessage", fallback: "Are you sure you want to logout?")
  /// My Subscription
  internal static let mySubscription = LocalizationStrings.tr("Localizable", "mySubscription", fallback: "My Subscription")
  /// None
  internal static let `none` = LocalizationStrings.tr("Localizable", "none", fallback: "None")
  /// OK
  internal static let ok = LocalizationStrings.tr("Localizable", "ok", fallback: "OK")
  /// Transform your creative ideas into stunning images
  internal static let onboardMessage = LocalizationStrings.tr("Localizable", "onboardMessage", fallback: "Transform your creative ideas into stunning images")
  /// Privacy Policy & Terms of Use
  internal static let policy = LocalizationStrings.tr("Localizable", "policy", fallback: "Privacy Policy & Terms of Use")
  /// Premium
  internal static let premium = LocalizationStrings.tr("Localizable", "premium", fallback: "Premium")
  /// Enter your prompt here
  internal static let prompt = LocalizationStrings.tr("Localizable", "prompt", fallback: "Enter your prompt here")
  /// Regenerate
  internal static let regenerate = LocalizationStrings.tr("Localizable", "regenerate", fallback: "Regenerate")
  /// Restore purchase
  internal static let restore = LocalizationStrings.tr("Localizable", "restore", fallback: "Restore purchase")
  /// Save
  internal static let save = LocalizationStrings.tr("Localizable", "save", fallback: "Save")
  /// AI Engine
  internal static let selectEngine = LocalizationStrings.tr("Localizable", "selectEngine", fallback: "AI Engine")
  /// Size
  internal static let selectSize = LocalizationStrings.tr("Localizable", "selectSize", fallback: "Size")
  /// Style
  internal static let selectStyle = LocalizationStrings.tr("Localizable", "selectStyle", fallback: "Style")
  /// Share
  internal static let share = LocalizationStrings.tr("Localizable", "share", fallback: "Share")
  /// Buy Subscription
  internal static let subscriptions = LocalizationStrings.tr("Localizable", "subscriptions", fallback: "Buy Subscription")
  /// Payment will be charged to your AppStore account upon confirmation of purchase. The subscription will automatically renew and be charged 24 hours before the end of the current period unless turned off by the user in the user's account settings. Any unused portion of the trial will be forfeited.
  internal static let subscriptionToC = LocalizationStrings.tr("Localizable", "subscriptionToC", fallback: "Payment will be charged to your AppStore account upon confirmation of purchase. The subscription will automatically renew and be charged 24 hours before the end of the current period unless turned off by the user in the user's account settings. Any unused portion of the trial will be forfeited.")
  /// Settings
  internal static let tabSettings = LocalizationStrings.tr("Localizable", "tabSettings", fallback: "Settings")
  /// Check your network connection and try again
  internal static let unreachableError = LocalizationStrings.tr("Localizable", "unreachableError", fallback: "Check your network connection and try again")
  /// User
  internal static let user = LocalizationStrings.tr("Localizable", "user", fallback: "User")
  /// Yes
  internal static let yes = LocalizationStrings.tr("Localizable", "yes", fallback: "Yes")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension LocalizationStrings {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
