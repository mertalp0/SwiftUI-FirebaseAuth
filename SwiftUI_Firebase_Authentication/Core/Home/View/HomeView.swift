//
//  HomeView.swift
//  SwiftUI_Firebase_Authentication
//
//  Created by mert alp on 28.12.2023.
//

import SwiftUI

struct HomeView: View {
    @State private var isActiveDestination: Bool = false
    @State var activeDestinaiton : AnyView?
    var body: some View {
            ZStack {
                VStack {
                    VStack{
                        CustomButton(title: "Hesabı Sil", buttonColor: .blue, textColor: .white) {
                            activeDestinaiton = AnyView(InfoView())
                            isActiveDestination = true
                        }
                        CustomButton(title: "Çıkış Yap", buttonColor: .black , textColor: .white ) {
                            activeDestinaiton = AnyView(InfoView())
                            isActiveDestination = true
                        }
                    }
                }
                .frame(width: Const.width , height: Const.height)
                .navigationDestination(isPresented: $isActiveDestination, destination: {
                    activeDestinaiton
                })
            }.navigationTitle("Home View")
            .navigationBarBackButtonHidden(true)
             .background(.white)
        
       
    
        
    }
}

#Preview {
    HomeView()
}
