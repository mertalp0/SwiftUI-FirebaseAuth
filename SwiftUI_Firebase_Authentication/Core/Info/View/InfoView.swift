//
//  InfoView.swift
//  HaBu
//
//  Created by mert alp on 15.11.2023.
//

import SwiftUI

struct InfoView: View {
    @State private var isActiveDestination: Bool = false
    @State var activeDestinaiton : AnyView?
    var body: some View {
            ZStack {
                VStack {
                    VStack{
                        CustomButton(title: "SignIn", buttonColor: .blue, textColor: .white) {
                            activeDestinaiton = AnyView(LoginView())
                            isActiveDestination = true
                        }
                        CustomButton(title: "SignUp", buttonColor: .black , textColor: .white ) {
                            activeDestinaiton = AnyView(RegisterView())
                            isActiveDestination = true
                        }
                    }
                }
                .frame(width: Const.width , height: Const.height)
                .navigationDestination(isPresented: $isActiveDestination, destination: {
                    activeDestinaiton
                })
            }.navigationBarBackButtonHidden(true)
             .navigationTitle("Info View")
             .background(.white)
        
       
    
        
    }
}
#Preview {
    InfoView()
}
