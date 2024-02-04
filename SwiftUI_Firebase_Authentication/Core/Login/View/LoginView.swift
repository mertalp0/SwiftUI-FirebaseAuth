//
//  LoginView.swift
//  SwiftUI_Firebase_Authentication
//
//  Created by mert alp on 28.12.2023.
//

import SwiftUI

struct LoginView: View {
    @StateObject var loginVM : LoginViewModel
    init(){
        self._loginVM = StateObject(wrappedValue: LoginViewModel(authService: AuthService()))
    }
    var body: some View {
        VStack{
            CustomTextField(text: $loginVM.email, placeHolder: "email")
            CustomTextField(text: $loginVM.password, placeHolder: "password")
                CustomButton(title: "SignIn", buttonColor: .blue, textColor: .white) {
                    Task{
                        loginVM.isActiveDestination =   await loginVM.signIn()
                    }
                }
        }.navigationTitle("Login View")
            .navigationDestination(isPresented: $loginVM.isActiveDestination, destination: {
                HomeView().navigationBarBackButtonHidden(true)
            })
            .alert(isPresented: $loginVM.showAlert) {
                Alert(title: Text(loginVM.alertTitle), message: Text( loginVM.alertMessage), dismissButton: .default(Text("Tamam")))
            }
     
    }
}

#Preview {
    LoginView()
}
