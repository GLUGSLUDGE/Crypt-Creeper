//
//  Buttons.swift
//  Crypt Creeper
//
//  Created by Abby Dominguez on 19/1/23.
//

import SwiftUI

struct Buttons: View {
    var body: some View {
        VStack{
            Button {
                //
            } label: {
                buttonLabel(title: "CORRECTO")
            }
            HStack{
                Button {
                    //
                } label: {
                    buttonImageLabel(SFSymbolName: "person.fill")
                }
                Button {
                    //
                } label: {
                    buttonImageLabel(SFSymbolName: "trophy.fill")
                }
                Button {
                    //
                } label: {
                    buttonImageLabel(SFSymbolName: "gearshape.fill")
                }

            }
            Rectangle()
                .foregroundColor(Color.red)
            
        }
        
        
    }
}

struct buttonLabel: View {
    @State var title:String
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: UIScreen.main.bounds.size.width/1.1, height: UIScreen.main.bounds.size.height/11.1)
                .foregroundColor(Color.ui.textYellow)
            Rectangle()
                .frame(width: UIScreen.main.bounds.size.width/1.1-10, height: UIScreen.main.bounds.height/11.1-10)
                .foregroundColor(Color.ui.colorBGBlack)
            
            Text(title)
                .foregroundColor(Color.ui.textYellow)
                .font(.system(size: 30))
                .fontWeight(.black)
        }
    }
}

struct buttonImageLabel: View {
    @State var SFSymbolName:String
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width: UIScreen.main.bounds.size.width/3.45, height: UIScreen.main.bounds.height/11.1)
                .foregroundColor(Color.ui.textYellow)
            Rectangle()
                .frame(width: UIScreen.main.bounds.size.width/3.45-10, height: UIScreen.main.bounds.height/11.1-10)
                .foregroundColor(Color.ui.colorBGBlack)
           
            Image(systemName: SFSymbolName)
                .foregroundColor(Color.ui.textYellow)
                .font(Font.system(.largeTitle).bold())
        }
    }
}



struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        Buttons()
    }
}
