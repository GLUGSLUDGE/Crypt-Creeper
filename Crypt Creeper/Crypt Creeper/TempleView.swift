//
//  TempleView.swift
//  Crypt Creeper
//
//  Created by Abby Dominguez on 23/2/23.
//

import SwiftUI

struct TempleView: View {
    @ObservedObject var scene:GameScene
    var body: some View {
        ZStack{
            Color.ui.colorBGBlack
            .ignoresSafeArea()
            ZStack{
                Image("ImageBGTemple")
                    .resizable()
                    .scaledToFit()
                Image("ImageKeyTemple")
                    .resizable()
                    .scaledToFit()
            }
            .background(Color.ui.colorBGRed)
            VStack{
                UIPill(scene: scene, style: ShopStyle.Temple)
                Spacer()
                Spacer()
                HStack{
                    Image("ICON_ENTITY_EMPTY")
                        .resizable()
                        .scaledToFit()
                    Image("ICON_ENTITY_EMPTY")
                        .resizable()
                        .scaledToFit()
                    Image("ICON_ENTITY_EMPTY")
                        .resizable()
                        .scaledToFit()
                }
                Spacer()
            }
        }
    }
}

struct TempleView_Previews: PreviewProvider {
    static var previews: some View {
        TempleView(scene: GameScene())
    }
}
