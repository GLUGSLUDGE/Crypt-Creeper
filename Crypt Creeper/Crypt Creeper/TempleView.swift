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
                    VStack{
                        ZStack{
                            Image("ICON_ENTITY_EMPTY")
                                .resizable()
                                .scaledToFit()
                            Image("ICON_C_MAXHEALTH")
                                .resizable()
                                .scaledToFit()
                        }
                        HStack{
                            Image("ICON_UI_XP")
                                .resizable()
                                .frame(width: 30, height: 30)
                            Text("20")
                                .foregroundColor(Color.ui.textGreen)
                                .font(.system(size: 24, weight: .heavy, design: .rounded))
                        }
                    }
                    VStack{
                        ZStack{
                            Image("ICON_ENTITY_EMPTY")
                                .resizable()
                                .scaledToFit()
                            Image("ICON_C_FULLHEAL")
                                .resizable()
                                .scaledToFit()
                        }
                        HStack{
                            Image("ICON_UI_XP")
                                .resizable()
                                .frame(width: 30, height: 30)
                            Text("20")
                                .foregroundColor(Color.ui.textGreen)
                                .font(.system(size: 24, weight: .heavy, design: .rounded))
                        }
                    }
                    VStack{
                        ZStack{
                            Image("ICON_ENTITY_EMPTY")
                                .resizable()
                                .scaledToFit()
                            Image("ICON_C_SLOT")
                                .resizable()
                                .scaledToFit()
                        }
                        HStack{
                            Image("ICON_UI_XP")
                                .resizable()
                                .frame(width: 30, height: 30)
                            Text("20")
                                .foregroundColor(Color.ui.textGreen)
                                .font(.system(size: 24, weight: .heavy, design: .rounded))
                        }
                    }
                    
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
