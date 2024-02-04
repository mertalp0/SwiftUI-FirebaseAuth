//
//  TextField.swift
//  SwiftUI_Firebase_Authentication
//
//  Created by mert alp on 28.12.2023.
//

import SwiftUI


@ViewBuilder
func CustomTextField ( text: Binding<String> , placeHolder : String)->some View {
    VStack {
        VStack {
        TextField(placeHolder, text: text)
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
   
        }
        .padding(.horizontal , 30)
    }
}
