//
//  RegisterView.swift
//  YourPlanner
//
//  Created by Raeyoung Kim on 2023-09-12.
//

import SwiftUI

struct RegisterView: View {
    
    @State var name = ""
    @State var email = ""
    @State var password = ""
    
    
    var body: some View {
        HeaderView(title: "Register", subtitle: "Start organizing todos", angle: -15, background: .green)
        
        Form {
            TextField("Full Name", text: $name)
                .textFieldStyle(DefaultTextFieldStyle())
            
            TextField("Email Address", text: $email)
                .textFieldStyle(DefaultTextFieldStyle())
                .autocapitalization(.none)
                .autocorrectionDisabled()
            
            SecureField("Password", text: $password)
                .textFieldStyle(DefaultTextFieldStyle())
            
            YPButton(
                title: "Create Account",
                backgroundColor: .green
            ) {
                // Attempt registration
            }
            .padding()
            
        }
        .offset(y: -50)
        
        Spacer()
        
        
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
