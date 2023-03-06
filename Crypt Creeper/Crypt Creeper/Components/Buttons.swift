//
//  Buttons.swift
//  Crypt Creeper
//
//  Created by Abby Dominguez on 19/1/23.
//

import SwiftUI

struct Buttons: View {
    var body: some View {
        ZStack{
            Color.blue
                .ignoresSafeArea()
            VStack{
               
                Button {
                    //
                } label: {
                    MenuButtonLabel(title: "CORRECTO")
                }
                HStack{
                    Button {
                        //
                    } label: {
                        MenuButtonImageLabel(SFSymbolName: "person.fill")
                    }
                    Button {
                        //
                    } label: {
                        MenuButtonImageLabel(SFSymbolName: "trophy.fill")
                    }
                    Button {
                        //
                    } label: {
                        MenuButtonImageLabel(SFSymbolName: "gearshape.fill")
                    }
                }
                Button {
                    //
                } label: {
                    ButtonLabel(title: "Hola",fontSize: 30)
                }
                Button {
                    //
                } label: {
                    MiniButtonLabel(title: "Sign Up", fontSize: 36, widthSize: 43 , heightSize:40)
                }
                Button {
                    //
                } label: {
                    TrueButton(title: "Hola",fontSize: 30)
                }

                Rectangle()
                    .foregroundColor(Color.red)
                
            }
        }
       
        
        
    }
}

struct MenuButtonLabel: View {
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

struct MenuButtonImageLabel: View {
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

struct MiniButtonLabel: View {
    @State var title: String
    @State var fontSize: CGFloat
    @State var widthSize: CGFloat
    @State var heightSize: CGFloat
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: UIScreen.main.bounds.size.width/widthSize, height: UIScreen.main.bounds.height/heightSize)
                .foregroundColor(Color.accentColor)
            BoldText(title: title, fontSize:fontSize)
                .foregroundColor(Color.ui.popUpColor)
            
        }
    }
}

struct ButtonLabel: View {
    @State var title: String
    @State var fontSize: CGFloat
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: UIScreen.main.bounds.size.width/1.1, height: UIScreen.main.bounds.height/12)
                .foregroundColor(Color.white)
            BoldText(title: title, fontSize: fontSize)
                .foregroundColor(Color.ui.popUpColor)
        }
    }
}

struct TrueButton: View {
    @State var title: String
    @State var fontSize: CGFloat
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.accentColor)
                .frame(height: UIScreen.main.bounds.height/12)
            BoldText(title: title,fontSize: fontSize)
                .foregroundColor(Color.ui.popUpColor)
        }
    }
}

struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        Buttons()
    }
}
