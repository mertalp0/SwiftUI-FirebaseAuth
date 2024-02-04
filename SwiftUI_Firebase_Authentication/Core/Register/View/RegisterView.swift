//
//  RegisterView.swift
//  SwiftUI_Firebase_Authentication
//
//  Created by mert alp on 28.12.2023.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var registerVM : RegisterViewModel
    init(){
        self._registerVM = StateObject(wrappedValue: RegisterViewModel(authService: AuthService()))
    }
    var body: some View {
        VStack{
            CustomTextField(text: $registerVM.email, placeHolder: "email")
            CustomTextField(text: $registerVM.userName, placeHolder: "username")
            CustomTextField(text: $registerVM.password, placeHolder: "password")
            CustomTextField(text: $registerVM.passwordAgain, placeHolder: "password again")
            CustomButton(title: "SignUp", buttonColor: .blue, textColor: .white) {
                   Task {
                       await registerVM.register()
                   }
                }
        }.navigationTitle("Register View")
            .navigationDestination(isPresented: $registerVM.goLogin, destination: {
                LoginView().navigationBarBackButtonHidden(true)
            })

        .alert(isPresented: $registerVM.showAlert) {
                       Alert(title: Text(registerVM.alertTitle), message: Text( registerVM.alertMessage), dismissButton: .default(
                        Text("Tamam"),
                        action: {
                            // "Tamam" butonuna basıldığında yapılacak işlemi buraya ekleyin
                            if registerVM.successRegister {
                                registerVM.goLogin = true

                                // Başka bir ekran veya işlem başlatabilirsiniz
                            }
                        }
                    ))
                   }

    }
}

#Preview {
    RegisterView()
}
