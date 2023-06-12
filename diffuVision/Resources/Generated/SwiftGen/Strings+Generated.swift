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
  /// You haven't generated an image yet.
  /// Enter your prompt and turn your ideas into images.
  internal static let dashboardTitle = LocalizationStrings.tr("Localizable", "dashboardTitle", fallback: "You haven't generated an image yet.\nEnter your prompt and turn your ideas into images.")
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
  /// Save
  internal static let save = LocalizationStrings.tr("Localizable", "save", fallback: "Save")
  /// Select Engine
  internal static let selectEngine = LocalizationStrings.tr("Localizable", "selectEngine", fallback: "Select Engine")
  /// Select Size
  internal static let selectSize = LocalizationStrings.tr("Localizable", "selectSize", fallback: "Select Size")
  /// Share
  internal static let share = LocalizationStrings.tr("Localizable", "share", fallback: "Share")
  /// Settings
  internal static let tabSettings = LocalizationStrings.tr("Localizable", "tabSettings", fallback: "Settings")
  /// Check your network connection and try again
  internal static let unreachableError = LocalizationStrings.tr("Localizable", "unreachableError", fallback: "Check your network connection and try again")
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