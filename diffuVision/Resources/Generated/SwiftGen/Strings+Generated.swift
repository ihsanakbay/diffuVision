// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum LocalizationStrings {
  /// Localizable.strings
  ///   diffuVision
  /// 
  ///   Created by İhsan Akbay on 23.05.2023.
  internal static let appTitle = LocalizationStrings.tr("Localizable", "appTitle", fallback: "diffuVision")
  /// You haven't generated an image yet.
  /// Enter your prompt and turn your ideas into images.
  internal static let dashboardTitle = LocalizationStrings.tr("Localizable", "dashboardTitle", fallback: "You haven't generated an image yet.\nEnter your prompt and turn your ideas into images.")
  /// An unexpected error has occurred
  internal static let error = LocalizationStrings.tr("Localizable", "error", fallback: "An unexpected error has occurred")
  /// Generating image. Please wait.
  internal static let generateImage = LocalizationStrings.tr("Localizable", "generateImage", fallback: "Generating image. Please wait.")
  /// Enter your prompt here
  internal static let prompt = LocalizationStrings.tr("Localizable", "prompt", fallback: "Enter your prompt here")
  /// Regenerate
  internal static let regenerate = LocalizationStrings.tr("Localizable", "regenerate", fallback: "Regenerate")
  /// Save
  internal static let save = LocalizationStrings.tr("Localizable", "save", fallback: "Save")
  /// Engine
  internal static let selectEngine = LocalizationStrings.tr("Localizable", "selectEngine", fallback: "Engine")
  /// Size
  internal static let selectSize = LocalizationStrings.tr("Localizable", "selectSize", fallback: "Size")
  /// Share
  internal static let share = LocalizationStrings.tr("Localizable", "share", fallback: "Share")
  /// Settings
  internal static let tabSettings = LocalizationStrings.tr("Localizable", "tabSettings", fallback: "Settings")
  /// Check your network connection
  internal static let unreachableError = LocalizationStrings.tr("Localizable", "unreachableError", fallback: "Check your network connection")
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
