//
//  Extencion.swift
//  SwiftUI_Firebase_Authentication
//
//  Created by mert alp on 1.01.2024.
//

import Foundation

extension String {
    var isValidEmail: Bool {
        let emailRegex = #"^.*@.*$"#
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: self)
    }
}
