//
//  PopUps.swift
//  Crypt Creeper
//
//  Created by Diego Moreno on 16/2/23.
//

import SwiftUI

struct PopUps : View {
    var body: some View {
        //@State var username: String
        ZStack {
            Color.ui.popUpColor
                .ignoresSafeArea()
            VStack {
                PopUpsView(title: "", canHide: true) {
                    Text("hola")
                }
            }
            .padding()
        }
    }
}

struct PopUpsView<BodyContent: View>: View {
    @State var title:String
    @State private var show:Bool = true
    @State var canHide = false
    let bodyContent : () -> BodyContent

    var body: some View {
        if show{
            VStack {
                HStack{
                    Text(title)
                        .foregroundColor(Color.ui.popUpColor)
                        .font(.custom("m6x11", fixedSize: 30))
                        .padding(7)
                    Spacer()
                    Image("cross")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .onTapGesture {
                            if canHide{
                                show = false
                            }
                        }
                }
                .background(.white)
                bodyContent()
            }
            .border(.white, width: 1)
            .background(Color.ui.popUpColor)
            .padding()
        }
    }
}

struct PopUps_Preview: PreviewProvider {
    static var previews: some View {
        PopUps()
    }
}
