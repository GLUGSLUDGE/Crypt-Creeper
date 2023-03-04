//
//  WinView.swift
//  Crypt Creeper
//
//  Created by Abby Dominguez on 23/2/23.
//

import SwiftUI

struct WinView: View {
    @Environment(\.dismiss) private var dismiss
    @State var score:Int
    @ObservedObject var scene:GameScene
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
                        Text("SCORE: \(score)")
                            .font(.system(size: 36, weight: .heavy, design: .rounded))
                            .foregroundColor(Color.ui.text)
                    }
                }
                ZStack{
                    Color.ui.colorBGPinkDark
                    Image("ImageBGWin01")
                        .resizable()
                        .scaledToFit()
                    Image("ImageBGWin03")
                        .resizable()
                        .scaledToFit()
                        .padding(.top, -40)
                        .padding(20)
                    Image("ImageKeyHeroWin")
                        .resizable()
                        .scaledToFit()
                    Image("ImageBGWin02")
                        .resizable()
                        .scaledToFill()
                    VStack{
                        HStack{
                            Image("ImageWinLogo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: UIScreen.main.bounds.width/2)
                            Spacer()
                        }
                        
                        Spacer()
                    }
                        
                }
                ZStack{
                    VStack{
                        Spacer()
                        Button {
                            scene.reset()
                            dismiss()
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

struct WinView_Previews: PreviewProvider {
    static var previews: some View {
        WinView(score: 32249, scene: GameScene())
    }
}
