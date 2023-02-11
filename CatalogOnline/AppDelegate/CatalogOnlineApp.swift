//
//  CatalogOnlineApp.swift
//  CatalogOnline
//
//  Created by Mihai Cerneanu on 29.01.2023.
//

import FirebaseCore
import Firebase
import SwiftUI


@main
struct CatalogOnlineApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        
        WindowGroup {
            let logInManager = LogInManager()
            WelcomeView()
                .environmentObject(logInManager)
        }
    }
}
