//
//  SwiftUI_Social_AppApp.swift
//  SwiftUI-Social-App
//
//  Created by Le Hoang Anh on 23/03/2022.
//

import SwiftUI

@main
struct SwiftUI_Social_AppApp: App {
    var body: some Scene {
        WindowGroup {
            // if you have logged in then show HomeView;
            // otherwise show SplashVew
            SplashView()
        }
    }
}
