//
//  LoginView.swift
//  YourPlanner
//
//  Created by Raeyoung Kim on 2023-09-12.
//

import SwiftUI

struct LoginView: View {
    
//    @State var email = ""
//    @State var password = ""
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                
                HeaderView(title: "Your Plans", subtitle: "Get things done", angle: 15, background: .blue)
                
//                if let message = viewModel.errorMessage {
//                    Text(message)
//                        .foregroundColor(.red)
//                }
                
                
                // Login Form
                
                Form {
                    
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    
                    
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    YPButton(
                        title: "Log in",
                        backgroundColor: .blue
                    ) {
                        // Attempt log in
                        viewModel.login()
                    }
                    .padding()
                    
                }
                .offset(y:-50)
                
                // Create Account
                VStack {
                    Text("New around here?")
                        // Show registration
                        NavigationLink("Create an account", destination: RegisterView())
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
