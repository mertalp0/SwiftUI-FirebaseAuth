//
//  LoginViewModal.swift
//  HaBu
//
//  Created by mert alp on 19.12.2023.
//

import Foundation
import FirebaseAuth
import SwiftUI


class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var isActiveDestination = false

    
    @Published var showAlert = false
    @Published var alertTitle = ""
    @Published var alertMessage = ""
    
    
    
    private var authService: AuthService
    init(authService: AuthService) {
        self.authService = authService
    }
    
    //TODO: SIGN IN METHOD
    func signIn() async ->Bool {
        guard !email.isEmpty, !password.isEmpty else {
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
                self.showAlert = true
                self.alertTitle = "Hata!!"
                self.alertMessage = errorMessage.description
                print(errorMessage.description)
                
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
        do {
            try await authService.signIn(email: email, password: password)
            print("Başarılı giriş yapılıyor.")
            isActiveDestination = true
            return true
        } catch let error as NSError{
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



