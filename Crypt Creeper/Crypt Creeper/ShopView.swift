//
//  ShopView.swift
//  Crypt Creeper
//
//  Created by Abby Dominguez on 23/2/23.
//

import SwiftUI

struct ShopView: View {
    var body: some View {
        ZStack{
            Color.ui.colorBGBlack
            .ignoresSafeArea()
            ZStack{
                Image("ImageBGShop01")
                    .resizable()
                    .scaledToFit()
                Image("ImageBGShop02")
                    .resizable()
                    .scaledToFit()
                Image("ImageKeyShop")
                    .resizable()
                    .scaledToFit()
            }
            .background(Color.ui.colorBGRed)
            VStack{
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

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView()
    }
}
