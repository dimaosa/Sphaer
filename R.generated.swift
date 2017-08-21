//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap(Locale.init) ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)
  
  static func validate() throws {
    try font.validate()
    try intern.validate()
  }
  
  /// This `R.color` struct is generated, and contains static references to 0 color palettes.
  struct color {
    fileprivate init() {}
  }
  
  /// This `R.file` struct is generated, and contains static references to 21 files.
  struct file {
    /// Resource file `SanFranciscoDisplay-Black.otf`.
    static let sanFranciscoDisplayBlackOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "SanFranciscoDisplay-Black", pathExtension: "otf")
    /// Resource file `SanFranciscoDisplay-Bold.otf`.
    static let sanFranciscoDisplayBoldOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "SanFranciscoDisplay-Bold", pathExtension: "otf")
    /// Resource file `SanFranciscoDisplay-Heavy.otf`.
    static let sanFranciscoDisplayHeavyOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "SanFranciscoDisplay-Heavy", pathExtension: "otf")
    /// Resource file `SanFranciscoDisplay-Light.otf`.
    static let sanFranciscoDisplayLightOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "SanFranciscoDisplay-Light", pathExtension: "otf")
    /// Resource file `SanFranciscoDisplay-Medium.otf`.
    static let sanFranciscoDisplayMediumOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "SanFranciscoDisplay-Medium", pathExtension: "otf")
    /// Resource file `SanFranciscoDisplay-Regular.otf`.
    static let sanFranciscoDisplayRegularOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "SanFranciscoDisplay-Regular", pathExtension: "otf")
    /// Resource file `SanFranciscoDisplay-Semibold.otf`.
    static let sanFranciscoDisplaySemiboldOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "SanFranciscoDisplay-Semibold", pathExtension: "otf")
    /// Resource file `SanFranciscoDisplay-Thin.otf`.
    static let sanFranciscoDisplayThinOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "SanFranciscoDisplay-Thin", pathExtension: "otf")
    /// Resource file `SanFranciscoDisplay-Ultralight.otf`.
    static let sanFranciscoDisplayUltralightOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "SanFranciscoDisplay-Ultralight", pathExtension: "otf")
    /// Resource file `SanFranciscoText-Bold.otf`.
    static let sanFranciscoTextBoldOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "SanFranciscoText-Bold", pathExtension: "otf")
    /// Resource file `SanFranciscoText-BoldItalic.otf`.
    static let sanFranciscoTextBoldItalicOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "SanFranciscoText-BoldItalic", pathExtension: "otf")
    /// Resource file `SanFranciscoText-Heavy.otf`.
    static let sanFranciscoTextHeavyOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "SanFranciscoText-Heavy", pathExtension: "otf")
    /// Resource file `SanFranciscoText-HeavyItalic.otf`.
    static let sanFranciscoTextHeavyItalicOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "SanFranciscoText-HeavyItalic", pathExtension: "otf")
    /// Resource file `SanFranciscoText-Light.otf`.
    static let sanFranciscoTextLightOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "SanFranciscoText-Light", pathExtension: "otf")
    /// Resource file `SanFranciscoText-LightItalic.otf`.
    static let sanFranciscoTextLightItalicOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "SanFranciscoText-LightItalic", pathExtension: "otf")
    /// Resource file `SanFranciscoText-Medium.otf`.
    static let sanFranciscoTextMediumOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "SanFranciscoText-Medium", pathExtension: "otf")
    /// Resource file `SanFranciscoText-MediumItalic.otf`.
    static let sanFranciscoTextMediumItalicOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "SanFranciscoText-MediumItalic", pathExtension: "otf")
    /// Resource file `SanFranciscoText-Regular.otf`.
    static let sanFranciscoTextRegularOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "SanFranciscoText-Regular", pathExtension: "otf")
    /// Resource file `SanFranciscoText-RegularItalic.otf`.
    static let sanFranciscoTextRegularItalicOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "SanFranciscoText-RegularItalic", pathExtension: "otf")
    /// Resource file `SanFranciscoText-Semibold.otf`.
    static let sanFranciscoTextSemiboldOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "SanFranciscoText-Semibold", pathExtension: "otf")
    /// Resource file `SanFranciscoText-SemiboldItalic.otf`.
    static let sanFranciscoTextSemiboldItalicOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "SanFranciscoText-SemiboldItalic", pathExtension: "otf")
    
    /// `bundle.url(forResource: "SanFranciscoDisplay-Black", withExtension: "otf")`
    static func sanFranciscoDisplayBlackOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.sanFranciscoDisplayBlackOtf
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "SanFranciscoDisplay-Bold", withExtension: "otf")`
    static func sanFranciscoDisplayBoldOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.sanFranciscoDisplayBoldOtf
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "SanFranciscoDisplay-Heavy", withExtension: "otf")`
    static func sanFranciscoDisplayHeavyOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.sanFranciscoDisplayHeavyOtf
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "SanFranciscoDisplay-Light", withExtension: "otf")`
    static func sanFranciscoDisplayLightOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.sanFranciscoDisplayLightOtf
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "SanFranciscoDisplay-Medium", withExtension: "otf")`
    static func sanFranciscoDisplayMediumOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.sanFranciscoDisplayMediumOtf
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "SanFranciscoDisplay-Regular", withExtension: "otf")`
    static func sanFranciscoDisplayRegularOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.sanFranciscoDisplayRegularOtf
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "SanFranciscoDisplay-Semibold", withExtension: "otf")`
    static func sanFranciscoDisplaySemiboldOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.sanFranciscoDisplaySemiboldOtf
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "SanFranciscoDisplay-Thin", withExtension: "otf")`
    static func sanFranciscoDisplayThinOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.sanFranciscoDisplayThinOtf
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "SanFranciscoDisplay-Ultralight", withExtension: "otf")`
    static func sanFranciscoDisplayUltralightOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.sanFranciscoDisplayUltralightOtf
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "SanFranciscoText-Bold", withExtension: "otf")`
    static func sanFranciscoTextBoldOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.sanFranciscoTextBoldOtf
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "SanFranciscoText-BoldItalic", withExtension: "otf")`
    static func sanFranciscoTextBoldItalicOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.sanFranciscoTextBoldItalicOtf
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "SanFranciscoText-Heavy", withExtension: "otf")`
    static func sanFranciscoTextHeavyOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.sanFranciscoTextHeavyOtf
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "SanFranciscoText-HeavyItalic", withExtension: "otf")`
    static func sanFranciscoTextHeavyItalicOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.sanFranciscoTextHeavyItalicOtf
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "SanFranciscoText-Light", withExtension: "otf")`
    static func sanFranciscoTextLightOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.sanFranciscoTextLightOtf
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "SanFranciscoText-LightItalic", withExtension: "otf")`
    static func sanFranciscoTextLightItalicOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.sanFranciscoTextLightItalicOtf
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "SanFranciscoText-Medium", withExtension: "otf")`
    static func sanFranciscoTextMediumOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.sanFranciscoTextMediumOtf
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "SanFranciscoText-MediumItalic", withExtension: "otf")`
    static func sanFranciscoTextMediumItalicOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.sanFranciscoTextMediumItalicOtf
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "SanFranciscoText-Regular", withExtension: "otf")`
    static func sanFranciscoTextRegularOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.sanFranciscoTextRegularOtf
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "SanFranciscoText-RegularItalic", withExtension: "otf")`
    static func sanFranciscoTextRegularItalicOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.sanFranciscoTextRegularItalicOtf
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "SanFranciscoText-Semibold", withExtension: "otf")`
    static func sanFranciscoTextSemiboldOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.sanFranciscoTextSemiboldOtf
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "SanFranciscoText-SemiboldItalic", withExtension: "otf")`
    static func sanFranciscoTextSemiboldItalicOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.sanFranciscoTextSemiboldItalicOtf
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.font` struct is generated, and contains static references to 21 fonts.
  struct font: Rswift.Validatable {
    /// Font `SanFranciscoDisplay-Black`.
    static let sanFranciscoDisplayBlack = Rswift.FontResource(fontName: "SanFranciscoDisplay-Black")
    /// Font `SanFranciscoDisplay-Bold`.
    static let sanFranciscoDisplayBold = Rswift.FontResource(fontName: "SanFranciscoDisplay-Bold")
    /// Font `SanFranciscoDisplay-Heavy`.
    static let sanFranciscoDisplayHeavy = Rswift.FontResource(fontName: "SanFranciscoDisplay-Heavy")
    /// Font `SanFranciscoDisplay-Light`.
    static let sanFranciscoDisplayLight = Rswift.FontResource(fontName: "SanFranciscoDisplay-Light")
    /// Font `SanFranciscoDisplay-Medium`.
    static let sanFranciscoDisplayMedium = Rswift.FontResource(fontName: "SanFranciscoDisplay-Medium")
    /// Font `SanFranciscoDisplay-Regular`.
    static let sanFranciscoDisplayRegular = Rswift.FontResource(fontName: "SanFranciscoDisplay-Regular")
    /// Font `SanFranciscoDisplay-Semibold`.
    static let sanFranciscoDisplaySemibold = Rswift.FontResource(fontName: "SanFranciscoDisplay-Semibold")
    /// Font `SanFranciscoDisplay-Thin`.
    static let sanFranciscoDisplayThin = Rswift.FontResource(fontName: "SanFranciscoDisplay-Thin")
    /// Font `SanFranciscoDisplay-Ultralight`.
    static let sanFranciscoDisplayUltralight = Rswift.FontResource(fontName: "SanFranciscoDisplay-Ultralight")
    /// Font `SanFranciscoText-BoldItalic`.
    static let sanFranciscoTextBoldItalic = Rswift.FontResource(fontName: "SanFranciscoText-BoldItalic")
    /// Font `SanFranciscoText-Bold`.
    static let sanFranciscoTextBold = Rswift.FontResource(fontName: "SanFranciscoText-Bold")
    /// Font `SanFranciscoText-HeavyItalic`.
    static let sanFranciscoTextHeavyItalic = Rswift.FontResource(fontName: "SanFranciscoText-HeavyItalic")
    /// Font `SanFranciscoText-Heavy`.
    static let sanFranciscoTextHeavy = Rswift.FontResource(fontName: "SanFranciscoText-Heavy")
    /// Font `SanFranciscoText-Italic`.
    static let sanFranciscoTextItalic = Rswift.FontResource(fontName: "SanFranciscoText-Italic")
    /// Font `SanFranciscoText-LightItalic`.
    static let sanFranciscoTextLightItalic = Rswift.FontResource(fontName: "SanFranciscoText-LightItalic")
    /// Font `SanFranciscoText-Light`.
    static let sanFranciscoTextLight = Rswift.FontResource(fontName: "SanFranciscoText-Light")
    /// Font `SanFranciscoText-MediumItalic`.
    static let sanFranciscoTextMediumItalic = Rswift.FontResource(fontName: "SanFranciscoText-MediumItalic")
    /// Font `SanFranciscoText-Medium`.
    static let sanFranciscoTextMedium = Rswift.FontResource(fontName: "SanFranciscoText-Medium")
    /// Font `SanFranciscoText-Regular`.
    static let sanFranciscoTextRegular = Rswift.FontResource(fontName: "SanFranciscoText-Regular")
    /// Font `SanFranciscoText-SemiboldItalic`.
    static let sanFranciscoTextSemiboldItalic = Rswift.FontResource(fontName: "SanFranciscoText-SemiboldItalic")
    /// Font `SanFranciscoText-Semibold`.
    static let sanFranciscoTextSemibold = Rswift.FontResource(fontName: "SanFranciscoText-Semibold")
    
    /// `UIFont(name: "SanFranciscoDisplay-Black", size: ...)`
    static func sanFranciscoDisplayBlack(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: sanFranciscoDisplayBlack, size: size)
    }
    
    /// `UIFont(name: "SanFranciscoDisplay-Bold", size: ...)`
    static func sanFranciscoDisplayBold(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: sanFranciscoDisplayBold, size: size)
    }
    
    /// `UIFont(name: "SanFranciscoDisplay-Heavy", size: ...)`
    static func sanFranciscoDisplayHeavy(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: sanFranciscoDisplayHeavy, size: size)
    }
    
    /// `UIFont(name: "SanFranciscoDisplay-Light", size: ...)`
    static func sanFranciscoDisplayLight(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: sanFranciscoDisplayLight, size: size)
    }
    
    /// `UIFont(name: "SanFranciscoDisplay-Medium", size: ...)`
    static func sanFranciscoDisplayMedium(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: sanFranciscoDisplayMedium, size: size)
    }
    
    /// `UIFont(name: "SanFranciscoDisplay-Regular", size: ...)`
    static func sanFranciscoDisplayRegular(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: sanFranciscoDisplayRegular, size: size)
    }
    
    /// `UIFont(name: "SanFranciscoDisplay-Semibold", size: ...)`
    static func sanFranciscoDisplaySemibold(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: sanFranciscoDisplaySemibold, size: size)
    }
    
    /// `UIFont(name: "SanFranciscoDisplay-Thin", size: ...)`
    static func sanFranciscoDisplayThin(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: sanFranciscoDisplayThin, size: size)
    }
    
    /// `UIFont(name: "SanFranciscoDisplay-Ultralight", size: ...)`
    static func sanFranciscoDisplayUltralight(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: sanFranciscoDisplayUltralight, size: size)
    }
    
    /// `UIFont(name: "SanFranciscoText-Bold", size: ...)`
    static func sanFranciscoTextBold(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: sanFranciscoTextBold, size: size)
    }
    
    /// `UIFont(name: "SanFranciscoText-BoldItalic", size: ...)`
    static func sanFranciscoTextBoldItalic(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: sanFranciscoTextBoldItalic, size: size)
    }
    
    /// `UIFont(name: "SanFranciscoText-Heavy", size: ...)`
    static func sanFranciscoTextHeavy(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: sanFranciscoTextHeavy, size: size)
    }
    
    /// `UIFont(name: "SanFranciscoText-HeavyItalic", size: ...)`
    static func sanFranciscoTextHeavyItalic(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: sanFranciscoTextHeavyItalic, size: size)
    }
    
    /// `UIFont(name: "SanFranciscoText-Italic", size: ...)`
    static func sanFranciscoTextItalic(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: sanFranciscoTextItalic, size: size)
    }
    
    /// `UIFont(name: "SanFranciscoText-Light", size: ...)`
    static func sanFranciscoTextLight(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: sanFranciscoTextLight, size: size)
    }
    
    /// `UIFont(name: "SanFranciscoText-LightItalic", size: ...)`
    static func sanFranciscoTextLightItalic(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: sanFranciscoTextLightItalic, size: size)
    }
    
    /// `UIFont(name: "SanFranciscoText-Medium", size: ...)`
    static func sanFranciscoTextMedium(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: sanFranciscoTextMedium, size: size)
    }
    
    /// `UIFont(name: "SanFranciscoText-MediumItalic", size: ...)`
    static func sanFranciscoTextMediumItalic(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: sanFranciscoTextMediumItalic, size: size)
    }
    
    /// `UIFont(name: "SanFranciscoText-Regular", size: ...)`
    static func sanFranciscoTextRegular(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: sanFranciscoTextRegular, size: size)
    }
    
    /// `UIFont(name: "SanFranciscoText-Semibold", size: ...)`
    static func sanFranciscoTextSemibold(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: sanFranciscoTextSemibold, size: size)
    }
    
    /// `UIFont(name: "SanFranciscoText-SemiboldItalic", size: ...)`
    static func sanFranciscoTextSemiboldItalic(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: sanFranciscoTextSemiboldItalic, size: size)
    }
    
    static func validate() throws {
      if R.font.sanFranciscoTextBoldItalic(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'SanFranciscoText-BoldItalic' could not be loaded, is 'SanFranciscoText-BoldItalic.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.sanFranciscoTextHeavyItalic(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'SanFranciscoText-HeavyItalic' could not be loaded, is 'SanFranciscoText-HeavyItalic.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.sanFranciscoDisplayLight(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'SanFranciscoDisplay-Light' could not be loaded, is 'SanFranciscoDisplay-Light.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.sanFranciscoDisplayThin(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'SanFranciscoDisplay-Thin' could not be loaded, is 'SanFranciscoDisplay-Thin.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.sanFranciscoDisplayBlack(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'SanFranciscoDisplay-Black' could not be loaded, is 'SanFranciscoDisplay-Black.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.sanFranciscoTextItalic(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'SanFranciscoText-Italic' could not be loaded, is 'SanFranciscoText-RegularItalic.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.sanFranciscoTextHeavy(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'SanFranciscoText-Heavy' could not be loaded, is 'SanFranciscoText-Heavy.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.sanFranciscoDisplayBold(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'SanFranciscoDisplay-Bold' could not be loaded, is 'SanFranciscoDisplay-Bold.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.sanFranciscoTextLight(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'SanFranciscoText-Light' could not be loaded, is 'SanFranciscoText-Light.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.sanFranciscoTextMediumItalic(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'SanFranciscoText-MediumItalic' could not be loaded, is 'SanFranciscoText-MediumItalic.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.sanFranciscoTextMedium(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'SanFranciscoText-Medium' could not be loaded, is 'SanFranciscoText-Medium.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.sanFranciscoTextSemiboldItalic(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'SanFranciscoText-SemiboldItalic' could not be loaded, is 'SanFranciscoText-SemiboldItalic.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.sanFranciscoDisplayMedium(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'SanFranciscoDisplay-Medium' could not be loaded, is 'SanFranciscoDisplay-Medium.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.sanFranciscoTextBold(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'SanFranciscoText-Bold' could not be loaded, is 'SanFranciscoText-Bold.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.sanFranciscoDisplayRegular(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'SanFranciscoDisplay-Regular' could not be loaded, is 'SanFranciscoDisplay-Regular.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.sanFranciscoTextRegular(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'SanFranciscoText-Regular' could not be loaded, is 'SanFranciscoText-Regular.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.sanFranciscoDisplayHeavy(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'SanFranciscoDisplay-Heavy' could not be loaded, is 'SanFranciscoDisplay-Heavy.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.sanFranciscoTextSemibold(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'SanFranciscoText-Semibold' could not be loaded, is 'SanFranciscoText-Semibold.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.sanFranciscoDisplayUltralight(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'SanFranciscoDisplay-Ultralight' could not be loaded, is 'SanFranciscoDisplay-Ultralight.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.sanFranciscoTextLightItalic(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'SanFranciscoText-LightItalic' could not be loaded, is 'SanFranciscoText-LightItalic.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.sanFranciscoDisplaySemibold(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'SanFranciscoDisplay-Semibold' could not be loaded, is 'SanFranciscoDisplay-Semibold.otf' added to the UIAppFonts array in this targets Info.plist?") }
    }
    
    fileprivate init() {}
  }
  
  /// This `R.image` struct is generated, and contains static references to 4 images.
  struct image {
    /// Image `icArrowBack`.
    static let icArrowBack = Rswift.ImageResource(bundle: R.hostingBundle, name: "icArrowBack")
    /// Image `icDropdown`.
    static let icDropdown = Rswift.ImageResource(bundle: R.hostingBundle, name: "icDropdown")
    /// Image `icLogo`.
    static let icLogo = Rswift.ImageResource(bundle: R.hostingBundle, name: "icLogo")
    /// Image `icPattern`.
    static let icPattern = Rswift.ImageResource(bundle: R.hostingBundle, name: "icPattern")
    
    /// `UIImage(named: "icArrowBack", bundle: ..., traitCollection: ...)`
    static func icArrowBack(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.icArrowBack, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "icDropdown", bundle: ..., traitCollection: ...)`
    static func icDropdown(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.icDropdown, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "icLogo", bundle: ..., traitCollection: ...)`
    static func icLogo(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.icLogo, compatibleWith: traitCollection)
    }
    
    /// `UIImage(named: "icPattern", bundle: ..., traitCollection: ...)`
    static func icPattern(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.icPattern, compatibleWith: traitCollection)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.nib` struct is generated, and contains static references to 0 nibs.
  struct nib {
    fileprivate init() {}
  }
  
  /// This `R.reuseIdentifier` struct is generated, and contains static references to 0 reuse identifiers.
  struct reuseIdentifier {
    fileprivate init() {}
  }
  
  /// This `R.segue` struct is generated, and contains static references to 0 view controllers.
  struct segue {
    fileprivate init() {}
  }
  
  /// This `R.storyboard` struct is generated, and contains static references to 2 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    /// Storyboard `Main`.
    static let main = _R.storyboard.main()
    
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    
    /// `UIStoryboard(name: "Main", bundle: ...)`
    static func main(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.main)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.string` struct is generated, and contains static references to 0 localization tables.
  struct string {
    fileprivate init() {}
  }
  
  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }
    
    fileprivate init() {}
  }
  
  fileprivate class Class {}
  
  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    try storyboard.validate()
  }
  
  struct nib {
    fileprivate init() {}
  }
  
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      try main.validate()
      try launchScreen.validate()
    }
    
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController
      
      let bundle = R.hostingBundle
      let name = "LaunchScreen"
      
      static func validate() throws {
        if UIKit.UIImage(named: "icLogo") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'icLogo' is used in storyboard 'LaunchScreen', but couldn't be loaded.") }
        if UIKit.UIImage(named: "icPattern") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'icPattern' is used in storyboard 'LaunchScreen', but couldn't be loaded.") }
      }
      
      fileprivate init() {}
    }
    
    struct main: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = GetStartedViewController
      
      let bundle = R.hostingBundle
      let getStartedViewController = StoryboardViewControllerResource<GetStartedViewController>(identifier: "GetStartedViewController")
      let loginViewController = StoryboardViewControllerResource<LoginViewController>(identifier: "LoginViewController")
      let name = "Main"
      
      func getStartedViewController(_: Void = ()) -> GetStartedViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: getStartedViewController)
      }
      
      func loginViewController(_: Void = ()) -> LoginViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: loginViewController)
      }
      
      static func validate() throws {
        if UIKit.UIImage(named: "icDropdown") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'icDropdown' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "icLogo") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'icLogo' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "icPattern") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'icPattern' is used in storyboard 'Main', but couldn't be loaded.") }
        if _R.storyboard.main().getStartedViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'getStartedViewController' could not be loaded from storyboard 'Main' as 'GetStartedViewController'.") }
        if _R.storyboard.main().loginViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'loginViewController' could not be loaded from storyboard 'Main' as 'LoginViewController'.") }
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  fileprivate init() {}
}
