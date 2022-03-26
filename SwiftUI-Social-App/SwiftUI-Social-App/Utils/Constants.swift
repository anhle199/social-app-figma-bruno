//
//  Constants.swift
//  SwiftUI-Social-App
//
//  Created by Le Hoang Anh on 23/03/2022.
//

import Foundation

struct Constants {
    struct Image {
        static let splashTitle = "iclick"
        static let splash = "splash"
        static let darkBackground = "background.dark"
        static let headerBackground = "background.header"
        
        static let authHeaderDefault = "auth.header"
        static let authHeaderWithWelcome = "auth.header.welcome"
        
        enum Category: String, CaseIterable {
            private static let prefix = "category"
            static let overlay = "\(Constants.Image.Category.prefix).overlay"
            
            case photographer
            case videoCreator = "video-creator"
            case illustrator, designer
            
            var imageName: String {
                "\(Constants.Image.Category.prefix).\(rawValue)"
            }
            
            var title: String {
                switch self {
                case .photographer, .illustrator, .designer:
                    return rawValue.capitalized
                case .videoCreator:
                    return "Video Creator"
                }
            }
        }
    }
    
    struct Icon {
        static let show = "ic.show"
        static let hide = "ic.hide"
        
        static let google = "ic.google"
        static let facebookFill = "ic.facebook.fill"
    }
}
