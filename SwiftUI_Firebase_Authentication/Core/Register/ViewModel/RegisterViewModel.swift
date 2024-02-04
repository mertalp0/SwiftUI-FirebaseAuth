//
//  RegisterViewModel.swift
//  SwiftUI_Firebase_Authentication
//
//  Created by mert alp on 28.12.2023.
//

import Foundation

class RegisterViewModel : ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var passwordAgain = ""
    @Published var userName = ""
    @Published var showAlert = false
    @Published var alertTitle = ""
    @Published var alertMessage = ""
    @Published var successRegister = false
    @Published var  goLogin = false 
    
    
    private var authService: AuthService
    init(authService: AuthService) {
        self.authService = authService
    }
    
    //TODO: REGISTER METHOD
    func register()async->Bool{
        guard !email.isEmpty, !password.isEmpty, !passwordAgain.isEmpty , !userName.isEmpty else {
            if let errorMessage = ErrorMessage(rawValue: 1) {
                self.showAlert = true
                self.alertTitle = "Hata!!"
                self.alertMessage = errorMessage.description
                print(errorMessage.description)
            }
            return false
        }
        guard email.isValidEmail else {
            if let errorMessage = ErrorMessage(rawValue: 2) {
                print(errorMessage.description)
                self.showAlert = true
                self.alertTitle = "Hata!!"
                self.alertMessage = errorMessage.description
            }
            return false
        }
        
        guard password.count >= 6 else {
            if let errorMessage = ErrorMessage(rawValue: 3) {
                self.showAlert = true
                self.alertTitle = "Hata!!"
                self.alertMessage = errorMessage.description
                print(errorMessage.description)
            }
            
            return false
        }
        guard password == passwordAgain else {
            if let errorMessage = ErrorMessage(rawValue: 4) {
                self.showAlert = true
                self.alertTitle = "Hata!!"
                self.alertMessage = errorMessage.description
                print(errorMessage.description)
            }
            
            return false
        }
     
        do {
            try await authService.createUser(email: email, password: password, username: userName)
            self.showAlert = true
            self.alertTitle = "Başarılı."
            self.alertMessage = "Hesabınız oluşturuşdu mailinizi onaylayarak giriş yapabilirsiniz.."
            print("Kayıt başarılı mail adresi onaylanmalı")
            self.successRegister = true 
            return true
        } catch let error as NSError {
                if let errorMessage = ErrorMessage(rawValue: error.code) {
                    self.showAlert = true
                    self.alertTitle = "Hata!!"
                    self.alertMessage = errorMessage.description
                    print(errorMessage.description)
                    return false
                }
            self.showAlert = true
            self.alertTitle = "Hata!!"
            self.alertMessage = "Beklenmedik bir hata oluştu"
            print("Beklenmedik bir hata oluştu")
            return false
          
        }
    }
}
