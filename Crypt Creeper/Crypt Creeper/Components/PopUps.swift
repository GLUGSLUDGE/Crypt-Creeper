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
            Color.accentColor
                .ignoresSafeArea()
            VStack {
                PopUpsView(bodyContent: {
                    VStack {
                    }
                }, title: "LOGIN", show: true)
            }
            .padding()
        }
    }
}

struct PopUpsView<BodyContent: View>: View {
    let bodyContent : () -> BodyContent
    @State var title:String
    @State var show:Bool
    var body: some View {
        if show{
            VStack {
                HStack{
                    Text(title)
                        .foregroundColor(.accentColor)
                        .font(.custom("m6x11", fixedSize: 30))
                        .padding(7)
                    Spacer()
                    Image("cross")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                }
                
                .background(.white)
                bodyContent()
            }
            .border(.white)
            .background(Color.accentColor)
            .padding()
        }
        
    }
    
}
//            Rectangle()
//                .frame(width: UIScreen.main.bounds.size.width/1.1, height: UIScreen.main.bounds.size.height/11.1)
//                .foregroundColor(Color.ui.textYellow)

//            Text(title)
//                .foregroundColor(Color.ui.textYellow)
//                .font(.system(size: 30))
//                .fontWeight(.black)

struct PopUps_Preview: PreviewProvider {
    static var previews: some View {
        PopUps()
    }
}
