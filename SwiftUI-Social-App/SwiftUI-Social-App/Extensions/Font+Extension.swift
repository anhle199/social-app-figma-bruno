//
//  Font+Extension.swift
//  SwiftUI-Social-App
//
//  Created by Le Hoang Anh on 23/03/2022.
//

import SwiftUI

extension Font {

    fileprivate static let _fontName = "CircularStd"
    
    enum CustomFontType {
        case heading
        case title1, title2, title3, title4
        case bodySemibold, body1, body2, body3, body4
        case caption
        
        fileprivate var fontName: String {
            switch self {
            case .heading, .title1, .title2, .title4, .bodySemibold:
               return "\(_fontName)-Bold"
            case .title3, .body1, .body2, .body3, .body4, .caption:
                return "\(_fontName)-Book"
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
    
    static func primary(_ fontType: CustomFontType) -> Font {
        .custom(fontType.fontName, size: fontType.fontSize)
    }
    
}
