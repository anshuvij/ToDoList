//
//  LoginView.swift
//  ToDoList
//
//  Created by Anshu Vij on 14/08/23.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                //Header
                HeaderView(title: "To Do List", subTitle: "Get things done", angle: 15, backgroundColor: .pink)
                
                // Login Form
                
                Form {
                    
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(.automatic)
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    
                    SecureField("Password", text: $viewModel.pwd)
                        .textFieldStyle(.automatic)
                  
                    TLButton(title: "Log In", bgColor: .blue, action: {
                        
                        viewModel.login()
                    })
                    .padding()
                    
                }.offset(y:-50)
                // Create Account
                
                VStack {
                    
                    Text("New around here?")
                   NavigationLink("Create An Account", destination: RegisterView())
                    
                }
                .padding(.bottom,50)
                
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
