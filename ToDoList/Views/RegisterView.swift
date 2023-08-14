//
//  RegisterView.swift
//  ToDoList
//
//  Created by Anshu Vij on 14/08/23.
//

import SwiftUI

struct RegisterView: View {
  
    @StateObject var viewModel = RegisterViewViewModel()
    var body: some View {
        VStack {
            
            //Header
            HeaderView(title: "Register", subTitle: "Start Organising todos", angle: -15, backgroundColor: .orange)
            
            Form {
                
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                TextField("Enter Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                SecureField("Password", text: $viewModel.pwd)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TLButton(title: "Create Account", bgColor: .green, action: {
                    //attempt registartion
                    viewModel.register()
                })
                .padding()
                
            }.offset(y:-50)
            
           
            
            Spacer()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
