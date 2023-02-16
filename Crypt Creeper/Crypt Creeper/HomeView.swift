//
//  MainView.swift
//  Crypt Creeper
//
//  Created by Abby Dominguez on 17/1/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                ZStack{
                    VStack{
                        Color.ui.colorBGPinkDark
                            .padding(-10)
                        Color.ui.colorBGBlack
                    }
                    
                    Image(uiImage: UIImage(named: "ImageBGTitle03")!)
                        .resizable()
                        .scaledToFill()
                        .frame(width: geo.size.width)
                    Image(uiImage: UIImage(named: "ImageBGTitle02")!)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width)
                    VStack{
                        Spacer()
                        Image(uiImage: UIImage(named: "ImageBGTitle01")!)
                            .resizable()
                            .scaledToFit()
                            .frame(width: geo.size.width)
                            .padding(-10)
                        Rectangle()
                            .foregroundColor(Color.ui.colorBGBlack)
                            .frame(width: geo.size.width, height: geo.size.width/4)
                    }
                    
                    Image(uiImage: UIImage(named: "ImageKeyHero")!)
                        .resizable()
                        .scaledToFit()
                        .aspectRatio(contentMode: .fit)
                    VStack{
                        Spacer()
                        Image("ImageCryptCreeperLogo")
                            .resizable()
                            .scaledToFit()
                            .padding(.horizontal, 10)
                        Spacer()
                        Spacer()
                        Spacer()
                        NavigationLink(destination: ContentView()) {
                            MenuButtonLabel(title: "PLAY")
                        }
                        
                        Button {
                            //How to Play
                        } label: {
                            MenuButtonLabel(title: "HOW TO PLAY")
                        }
                        HStack{
                            Button {
                                //Profile
                            } label: {
                                MainMenuButtonImageLabel(SFSymbolName: "person.fill")
                            }
                            Button {
                                //Leaderboards
                            } label: {
                                MainMenuButtonImageLabel(SFSymbolName: "trophy.fill")
                            }
                            Button {
                                //Settings
                            } label: {
                                MainMenuButtonImageLabel(SFSymbolName: "gearshape.fill")
                            }
                            
                        }
                    }.padding(.bottom, 30)
                    
                    
                    
                }
                .ignoresSafeArea()
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
