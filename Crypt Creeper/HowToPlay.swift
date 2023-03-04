//
//  HowToPlay.swift
//  Crypt Creeper
//
//  Created by Osasu sanchez on 23/2/23.
//

import SwiftUI

struct HowToPlay: View {
    var body: some View {
        
        ZStack{
            Color.accentColor
                .ignoresSafeArea()
            PopUpsView(bodyContent: {
                VStack{
                    ZStack{
                        Divider()
                            .frame(width: 360 ,height:9)
                            .background(Color.white)
                            .padding(.horizontal,10)
                            .padding(.top, 75)
                        HStack{
                            Image("ICON_ENTITY_PLAYER")
                                .resizable()
                                .frame(width: 110 ,height:110)
                                .scaledToFit()
                            Text("Player")
                                .font(.system(size: 35))
                                .foregroundColor(.white)
                                .padding(40)
                            Spacer()
                        }

                    }
                    
                    
                }
                
                /*
                 ZStack(alignment: .center){
                 Divider()
                 
                 .frame(width: 360,height:9)
                 .background(Color.white)
                 
                 HStack{
                 Image("ICON_ENTITY_PLAYER")
                 .resizable()
                 .frame(width: 110 ,height:110)
                 .scaledToFit()
                 
                 Text("PLAYER")
                 .font(.system(size: 35))
                 .foregroundColor(.white)
                 .padding(20)
                 Spacer()
                 
                 }
                 
                 
                 }*/
                
            }, title: "How to play ", show: true)
            
        }
    }
}

struct HowToPlay_Previews: PreviewProvider {
    static var previews: some View {
        HowToPlay()
    }
}


