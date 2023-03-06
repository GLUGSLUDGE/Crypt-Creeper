//
//  Texts.swift
//  Crypt Creeper
//
//  Created by Diego Moreno on 16/2/23.
//

import SwiftUI

struct Texts: View {
    var body: some View {
        ZStack {
            Color.ui.popUpColor
                .ignoresSafeArea()
            VStack {
                ThinText(title: "Prueba",fontSize: 36)
                BoldText(title: "Prueba 2",fontSize: 30)
            }
        }
    }
}

struct ThinText: View {
    @State var title: String
    @State var fontSize: CGFloat
    var body: some View {
        VStack {
            Text(title)
                .font(.custom("m5x7", fixedSize: fontSize))
        }
    }
}

struct BoldText: View {
    @State var title: String
    @State var fontSize: CGFloat
    var body: some View {
        VStack {
            Text(title)
                .font(.custom("m6x11", fixedSize: fontSize))
        }
    }
}

struct Texts_Previews: PreviewProvider {
    static var previews: some View {
        Texts()
    }
}
