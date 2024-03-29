//
//  ErrorMessage.swift
//  SwiftUI_Firebase_Authentication
//
//  Created by mert alp on 1.01.2024.
//

import Foundation

enum ErrorMessage: Int  {
    case emptyFields = 1
    case invalidEmail = 2
    case shortPassword = 3
    case passwordsNotMatch = 4
    case wrongPassword = 17004
    case confidentialityAgreement = 5
    case registeredMail = 17007
    case verifiedError = 10
    
    
    var description: String {
        switch self {
        case .emptyFields:
            return "Lütfen tüm alanları doldurunuz. "
        case .invalidEmail:
            return "Geçersiz e-posta adresi. Mail adresinizin edu.tr uzantılı mailiniz olduğundan emin olun."
        case .shortPassword:
             return "Şifre en az 6 karakterli olmalı "
        case .wrongPassword:
            return "Yanlış şifre. Lütfen doğru şifreyi girin."
        case .passwordsNotMatch:
            return "Şifreler Eşleşmiyor"
        case .confidentialityAgreement:
            return "Gizlilik sözleşmesini onaylanıyız"
        case .registeredMail:
            return "Mail adresi zaten kayıtlı"
        case.verifiedError:
            return "Giriş yapmak için önce mailinizi doğrulayınız."
        }
    }
}
