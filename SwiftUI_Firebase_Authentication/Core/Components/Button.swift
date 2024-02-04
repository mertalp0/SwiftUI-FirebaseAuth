//
//  Button.swift
//  SwiftUI_Firebase_Authentication
//
//  Created by mert alp on 28.12.2023.
//

import SwiftUI

struct CustomButton: View {
    var title: String
    var buttonColor: Color
    var size : CustomButtonSize?
    var textColor : Color?
    var action: () -> Void
    var body: some View {
        Button(action: {
            action()
        }, label: {
            Text(title)
                .padding()
                .frame(width: size?.width ?? Const.width * 0.6 , height: size?.height ?? Const.height * 0.04 )
                .background(buttonColor)
                .foregroundColor(textColor ?? .white)
                .cornerRadius(4)
            
        }).shadow(color: Color.black.opacity(0.5), radius: 5, x: 2, y: 2)

    }
}

#Preview {
    CustomButton(title: "button", buttonColor: .black, action: {})
}

enum CustomButtonSize{
    case xxxsmall
    case xxsmall
    case xsmall
    case small
    case medium
    case lage
    case xlage
    case xxlage
    var width : CGFloat{
        switch self {
        case .xxxsmall:
            return Const.width * 0.3
        case .xxsmall:
            return Const.width * 0.4
        case .xsmall:
            return Const.width * 0.5
        case .small:
            return Const.width * 0.6
        case .medium:
            return Const.width * 0.7
        case .lage:
            return Const.width * 0.8
        case .xlage:
            return Const.width * 0.9
        case .xxlage:
            return Const.width * 0.95
        }
    }
    var height : CGFloat{
        switch self {
        case .xxxsmall:
            return Const.height * 0.04
        case .xxsmall:
            return Const.height * 0.04
        case .xsmall:
            return Const.height * 0.04
        case .small:
            return Const.height * 0.04
        case .medium:
            return Const.height * 0.05
        case .lage:
            return Const.height * 0.06
        case .xlage:
            return Const.height * 0.06
        case .xxlage:
            return Const.height * 0.07
        }
    }
}
