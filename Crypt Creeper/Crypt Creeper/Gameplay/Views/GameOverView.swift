//
//  GameOverView.swift
//  Crypt Creeper
//
//  Created by Abby Dominguez on 23/2/23.
//

import SwiftUI

struct GameOverView: View {
    @Environment(\.dismiss) private var dismiss
    @State var currentScore:Int
    @ObservedObject var scene:GameScene
    @ObservedObject var vm = GameOverViewModel()
    @State private var showHighscorelabel = false
    var body: some View {
        ZStack{
            Color.ui.colorBGBlack
                .ignoresSafeArea()
            VStack{
                ZStack{
                    VStack{
                        Spacer()
                        if showHighscorelabel {
                            Text("NEW HIGHSCORE!")
                                .font(.system(size: 24, weight: .heavy, design: .rounded))
                                .foregroundColor(Color.ui.textYellow)
                        }
                        Text("SCORE: \(currentScore)")
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
        .onAppear {
            vm.getScoreFromPlayer { score, error  in
                if let score = score {
                    if currentScore > score {
                        vm.showHighscoreLabel = true
                    }
                } else if let error = error {
                    print(error)
                }
            }
        }
    }
}

struct GameOverView_Previews: PreviewProvider {
    static var previews: some View {
        GameOverView(currentScore: 99999, scene: GameScene())
    }
}
