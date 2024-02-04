//
//  User.swift
//  SwiftUI_Firebase_Authentication
//
//  Created by mert alp on 28.12.2023.
//

import Foundation

struct User : Hashable , Codable ,Identifiable {
    let id : String
    let email : String
    let username : String
}
