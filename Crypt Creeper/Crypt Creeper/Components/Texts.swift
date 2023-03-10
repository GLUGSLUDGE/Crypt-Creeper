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
                ThinText(title: "Prueba")
                BoldText(title: "Prueba 2")
            }
        }
    }
}

struct ThinText: View {
    @State var title: String
    var body: some View {
        VStack {
            Text(title)
                .font(.custom("m5x7", fixedSize: 36))
        }
    }
}

struct BoldText: View {
    @State var title: String
    var body: some View {
        VStack {
            Text(title)
                .font(.custom("m6x11", fixedSize: 30))
        }
    }
}

struct Texts_Previews: PreviewProvider {
    static var previews: some View {
        Texts()
    }
}
