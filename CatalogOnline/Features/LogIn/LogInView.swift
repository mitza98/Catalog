//
//  LogInView.swift
//  CatalogOnline
//
//  Created by Mihai Cerneanu on 10.02.2023.
//

import SwiftUI

struct LogInView: View {
    @State private var email = ""
    @State private var password = ""
    
    @EnvironmentObject var loginViewModel: LogInManager
    
    var body: some View {
        ZStack {
            Color.black
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .foregroundStyle(.linearGradient(colors: [.red, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
            VStack(spacing: 20) {
                Text("Welcome!")
                    .foregroundColor(.white)
                    .font(.system(size: 40, weight: .bold))
                    .offset(y: -100)
                
                TextField("Email", text: $email)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .bold()
                    .padding()
                    .autocapitalization(.none)
                
                Rectangle()
                    .frame(width: 350, height: 1)
                    .foregroundColor(.white)
                
                SecureField("Password", text: $password)
                    .foregroundColor(.white)
                    .bold()
                    .padding()
                    .autocapitalization(.none)
                
                Rectangle()
                    .frame(width: 350, height: 1)
                    .foregroundColor(.white)
                
                
                Button {
                    loginViewModel.login(withEmail: email, withPassword: password)
                } label: {
                    Text("Log in!")
                        .bold()
                        .foregroundColor(.white)
                        .frame(width: 200, height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                        )
                        .foregroundColor(.black)
                }
                
                .padding(.top)
            }
            .frame(width: 300)
            
        }
        .ignoresSafeArea()
    }
}


