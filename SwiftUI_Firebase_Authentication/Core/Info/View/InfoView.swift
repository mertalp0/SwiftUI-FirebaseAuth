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
                Text("Hoşgeldin..")
                    .font(.system(size: 30, weight: .bold)) // Metin boyutunu ve kalınlığını ayarla
                    .foregroundColor(.black) // Metin rengini ayarla
                    .padding(.bottom, Const.height / 1.7)
                        VStack{
                            Image("logo") // "resimAdi" yerine kullanmak istediğin resmin adını yaz
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 200, height: 200)
                            VStack{
                                CustomButton(title: "SignIn", buttonColor: Color(red: 150/255, green: 203/255, blue: 106/255), size:CustomButtonSize.lage, textColor: .white)
                                        {
                                    activeDestinaiton = AnyView(LoginView())
                                    isActiveDestination = true
                                }
                                CustomButton(title: "SignUp", buttonColor: .black , size:CustomButtonSize.lage,textColor: .white ) {
                                    activeDestinaiton = AnyView(RegisterView())
                                    isActiveDestination = true
                                }
                            }     .padding(.top , Const.height/5)
                        }.frame(width: Const.width , height: Const.height)
                        .padding(.top , Const.height/5)
            }.navigationBarBackButtonHidden(true)
            .background(Color(red: 119/255, green: 167/255, blue: 63/255))
            .navigationDestination(isPresented: $isActiveDestination, destination: {
                activeDestinaiton
            })
       
    
        
    }
}
#Preview {
    InfoView()
}
