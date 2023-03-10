//
//  MainView.swift
//  Crypt Creeper
//
//  Created by Abby Dominguez on 17/1/23.
//

import SwiftUI

struct HomeView: View {
    @State var showHowToPlay = false
    var body: some View {
        GeometryReader { geo in
            ZStack{
                VStack{
                    Color.ui.colorBGPinkDark
                        .padding(-10)
                    Color.ui.colorBGBlack
                }
                Image("ImageBGWin03")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geo.size.width)
                Image("ImageBGTitle02")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geo.size.width)
                VStack{
                    Spacer()
                    Image("ImageBGTitle01")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width)
                        .padding(-10)
                    Rectangle()
                        .foregroundColor(Color.ui.colorBGBlack)
                        .frame(width: geo.size.width, height: geo.size.width/4)
                }
                
                Image("ImageKeyHero")
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(contentMode: .fit)
                VStack{
                    VStack(alignment: .center){
                       
                        Image("ImageCryptCreeperLogo")
                            .resizable()
                            .scaledToFit()
                            .padding(.horizontal, 10)
                            .padding(.top,50)
                        Spacer()
                            
                    }
                   
                   Spacer()
                    NavigationLink(destination: ContentView()) {
                        MenuButtonLabel(title: "PLAY")
                    }
                    
                    Button {
                        showHowToPlay.toggle()
                    } label: {
                        MenuButtonLabel(title: "HOW TO PLAY")
                    }
                    HStack{
                        Button {
                            //Profile
                        } label: {
                            MenuButtonImageLabel(SFSymbolName: "person.fill")
                        }
                        Button {
                            //Leaderboards
                        } label: {
                            MenuButtonImageLabel(SFSymbolName: "trophy.fill")
                        }
                        Button {
                            //Settings
                        } label: {
                            MenuButtonImageLabel(SFSymbolName: "gearshape.fill")
                        }
                        
                    }
                }.padding(.bottom, 30)
                
               HowToPlayView(show: $showHowToPlay)
                    
                
            }
            .ignoresSafeArea()
        }
        .navigationBarBackButtonHidden()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
