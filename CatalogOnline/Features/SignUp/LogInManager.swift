//
//  HomeViewModel.swift
//  CatalogOnline
//
//  Created by Mihai Cerneanu on 29.01.2023.
//

import Foundation
import FirebaseAuth

class LogInManager: ObservableObject {
    
    let auth = Auth.auth()
    
    @Published var signedIn = false
    
    var isUserLoggedIn: Bool {
        return auth.currentUser != nil
    }


    
    func login (withEmail email: String, withPassword password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            guard result != nil, error == nil else {
                print(error!.localizedDescription)
                return
            }
            DispatchQueue.main.async {
                self.signedIn = true
            }
        }
    }
    
    func register(withEmail email: String, withPassword password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if (error != nil) {
                print (error!.localizedDescription)
                return
            }
            DispatchQueue.main.async {
                self.signedIn = true
            }
            
        }
        
    }
    
    func signOut() {
        try? auth.signOut()
        self.signedIn = false
    }
    

}
