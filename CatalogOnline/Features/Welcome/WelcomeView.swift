//
//  HomeView.swift
//  CatalogOnline
//
//  Created by Mihai Cerneanu on 10.02.2023.
//

import SwiftUI

struct WelcomeView: View {
    
    @EnvironmentObject var logInManager: LogInManager
    var body: some View {
        NavigationView {
            if logInManager.isUserLoggedIn {
                Button() {
                    logInManager.signOut()
                } label: {
                    Text("Sign out!")
                }
                Text ("You are logged in!")
                
            } else {
                SignUpView()
            }
        }
        .ignoresSafeArea()
        .onAppear() {
            logInManager.signedIn = logInManager.isUserLoggedIn
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
