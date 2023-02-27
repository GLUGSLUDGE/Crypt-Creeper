//
//  UIPill.swift
//  Crypt Creeper
//
//  Created by Abby Dominguez on 26/2/23.
//

import SwiftUI

struct PillComponent: View {
    var image:Image
    var info:String
    var textcolor:Color
    var body: some View {
        image
            .resizable()
            .scaledToFit()
            .frame(width: 30)
        Text(info)
            .font(.system(size: 24, weight: .heavy, design: .rounded))
            .foregroundColor(textcolor)
    }
}
enum ShopStyle{
    case Shop
    case Temple
}

struct UIPill: View {
    @ObservedObject var scene:GameScene
    var style:ShopStyle
    var body: some View {
        HStack{
            if style == ShopStyle.Shop {
                PillComponent(image: Image("ICON_UI_COIN"), info: "\(scene.coins)", textcolor: Color.ui.textYellow)
            }
            if style == ShopStyle.Temple {
                PillComponent(image: Image("ICON_UI_XP"), info: "\(scene.coins)", textcolor: Color.ui.textGreen)
            }
            Rectangle()
                .frame(width: 9, height: 32)
                .foregroundColor(Color.ui.colorBGPinkDark)
                .cornerRadius(10)
            PillComponent(image: Image("ICON_UI_HEALTH"), info: "\(scene.coins)", textcolor: Color.ui.text)
            Rectangle()
                .frame(width: 9, height: 32)
                .foregroundColor(Color.ui.colorBGPinkDark)
                .cornerRadius(10)
            PillComponent(image: Image("ICON_UI_SWORD"), info: "\(scene.coins)", textcolor: Color.ui.text)
            Rectangle()
                .frame(width: 9, height: 32)
                .foregroundColor(Color.ui.colorBGPinkDark)
                .cornerRadius(10)
            PillComponent(image: Image("ICON_UI_SHIELD"), info: "\(scene.shieldPower)", textcolor: Color.ui.text)
        }
        .padding()
        .background(Color.ui.colorBGPurple)
        .cornerRadius(20)
        .padding(.top, 35)
    }
}
