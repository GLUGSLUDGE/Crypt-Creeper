//
//  HowToPlay.swift
//  Crypt Creeper
//
//  Created by Osasu sanchez on 23/2/23.
//

import SwiftUI

struct HowToPlayView: View {
    var body: some View {
        
        ZStack{
            Color.ui.popUpColor
                .ignoresSafeArea()
            PopUpsView(bodyContent: {
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
                
            }, title: "How to play ", show: true)
            
        }
    }
}
struct HowToPlay_Previews: PreviewProvider {
    
    static var previews: some View {
        HowToPlayView()
    }
}


