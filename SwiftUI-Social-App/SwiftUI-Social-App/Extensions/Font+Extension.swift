//
//  Font+Extension.swift
//  SwiftUI-Social-App
//
//  Created by Le Hoang Anh on 23/03/2022.
//

import SwiftUI

// MARK: - Custom Font Family
extension Font {
    
    enum CircularStdStyle: String {
        case bold, black, book
        
        fileprivate static let fontFamilyName = "CircularStd"
        fileprivate var fontName: String {
            return "\(CircularStdStyle.fontFamilyName)-\(rawValue.capitalized)"
        }
    }
    
    enum ProximaNoveStyle: String {
        case bold
        
        fileprivate static let fontFamilyName = "ProximaNova"
        fileprivate var fontName: String {
            return "\(CircularStdStyle.fontFamilyName)-\(rawValue.capitalized)"
        }
    }
    
    enum CustomFontFamily {
        case circularStd(style: CircularStdStyle)
        case proximaNova(style: ProximaNoveStyle)
        
        fileprivate var fontName: String {
            switch self {
            case .circularStd(let style):
                return style.fontName
            case .proximaNova(let style):
                return style.fontName
            }
        }
    }
    
    static func primaryFontFamily(
        _ fontFamily: CustomFontFamily,
        withSize size: CGFloat = 14
    ) -> Font {
        return .custom(fontFamily.fontName, size: size)
    }
    
}


// MARK: - Custom Font Style
extension Font {
    
    enum CustomFontStyle {
        case heading
        case title1, title2, title3, title4
        case bodySemibold, body1, body2, body3, body4
        case caption
        
        fileprivate var fontName: String {
            switch self {
            case .heading, .title1, .title2, .title4, .bodySemibold:
                return "CircularStd-Bold"
            case .title3, .body1, .body2, .body3, .body4, .caption:
                return "CircularStd-Book"
            }
        }
        
        fileprivate var fontSize: CGFloat {
            switch self {
            case .heading:
                return 24
            case .title1:
                return 20
            case .body1:
                return 18
            case .title2, .title3, .bodySemibold, .body2:
                return 16
            case .title4, .body3, .caption:
                return 14
            case .body4:
                return 12
            }
        }
    }
    
    static func primaryStyle(_ style: CustomFontStyle) -> Font {
        .custom(style.fontName, size: style.fontSize)
    }
    
}
