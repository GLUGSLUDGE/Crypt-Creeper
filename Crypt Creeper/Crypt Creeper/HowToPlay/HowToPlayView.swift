//
//  HowToPlay.swift
//  Crypt Creeper
//
//  Created by Osasu sanchez on 23/2/23.
//

import SwiftUI
struct HowToPlay: View {
    @State var ver = true
    var body: some View {
        HowToPlayView(show: $ver )
    }
}

struct HowToPlayView: View {
    @Binding var show :Bool
    var body: some View {
        if show{
            PopUpsView(title: "How to play", bodyContent: {
                ScrollView{
                    vPlayer()
                    
                    vMovements()
                    
                    vPICKUPS()
                    
                    vMonsters()
                    
                    vTemple()
                    
                    vShop()
                    
                    vLevels()
                    
                    vGoal()
                    
                    vScore()
                    
                }
                
            }).overlay(content: {
                VStack{
                    HStack{
                        Spacer()
                        Button {
                            show.toggle()
                        } label: {
                            Image("")
                                .resizable()
                                .frame(width: 30,height:30)
                                .padding(.trailing,15)
                                .padding(.top,20)
                                .foregroundColor(Color.clear)
                        }
                    }
                    Spacer()
                }})
            .padding(.vertical,50)
            .padding(.horizontal)
        }
    }
}

struct HowToPlay_Previews: PreviewProvider {
    
    static var previews: some View {
        ZStack{
            Color.ui.popUpColor
                .ignoresSafeArea()
            HowToPlay()
        }
    }
}


