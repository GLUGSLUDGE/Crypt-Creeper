//
//  GameOverView.swift
//  Crypt Creeper
//
//  Created by Abby Dominguez on 23/2/23.
//

import SwiftUI

struct GameOverView: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        ZStack{
            Color.ui.colorBGBlack
                .ignoresSafeArea()
            VStack{
                ZStack{
                    VStack{
                        Spacer()
                        Text("NEW HIGHSCORE!")
                            .font(.system(size: 24, weight: .heavy, design: .rounded))
                            .foregroundColor(Color.ui.textYellow)
                        Text("SCORE: 003249")
                            .font(.system(size: 36, weight: .heavy, design: .rounded))
                            .foregroundColor(Color.ui.text)
                    }
                }
                ZStack{
                    Color.ui.colorBGPurple
                        .padding(20)
                    Image("ImageBGGameOver01")
                        .resizable()
                        .scaledToFill()
                    Image("ImageKeyHeroGameOver")
                        .resizable()
                        .scaledToFit()
                        .padding(40)
                    Image("ImageBGGameOver02")
                        .resizable()
                        .scaledToFill()
                        .padding(.top, -40)
                        .padding(20)
                    VStack{
                        HStack{
                            Image("ImageGameOverLogo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: UIScreen.main.bounds.width/1.5)
                            Spacer()
                        }
                        Spacer()
                    }
                }
                ZStack{
                   
                    VStack{
                        Spacer()
                        Button {
                            
                        } label: {
                            MenuButtonLabel(title: "PLAY AGAIN")
                        }
                        Button {
                            
                        } label: {
                            MenuButtonLabel(title: "GO BACK")
                        }
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct GameOverView_Previews: PreviewProvider {
    static var previews: some View {
        GameOverView()
    }
}
