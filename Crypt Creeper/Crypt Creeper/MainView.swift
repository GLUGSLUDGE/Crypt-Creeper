//
//  MainView.swift
//  Crypt Creeper
//
//  Created by Abby Dominguez on 17/1/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        GeometryReader { geo in
            ZStack{
                Color.ui.colorBGPinkDark
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
                        .frame(width: geo.size.width, height: geo.size.width/4)
                }
                

                Image(uiImage: UIImage(named: "ImageKeyHero")!)
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(contentMode: .fit)
                
            }
            .ignoresSafeArea()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
