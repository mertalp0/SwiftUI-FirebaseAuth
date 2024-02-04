//
//  LoginView.swift
//  SwiftUI_Firebase_Authentication
//
//  Created by mert alp on 28.12.2023.
//

import SwiftUI

struct LoginView: View {
    @State var email  = ""
    @State var password  = ""
    @State private var isActiveDestination: Bool = false
    @State var activeDestinaiton : AnyView?
    var body: some View {
        VStack{
               CustomTextField(text: $email, placeHolder: "email")
               CustomTextField(text: $password, placeHolder: "password")
                CustomButton(title: "SignIn", buttonColor: .blue, textColor: .white) {
                    activeDestinaiton = AnyView(HomeView())
                    isActiveDestination = true
                }
        }.navigationTitle("Login View")
        .navigationDestination(isPresented: $isActiveDestination, destination: {
            activeDestinaiton
        })                
    }
}

#Preview {
    LoginView()
}
