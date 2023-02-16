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
                        MainMenuButtonImageLabel(SFSymbolName: "person.fill")
                    }
                    Button {
                        //
                    } label: {
                        MainMenuButtonImageLabel(SFSymbolName: "trophy.fill")
                    }
                    Button {
                        //
                    } label: {
                        MainMenuButtonImageLabel(SFSymbolName: "gearshape.fill")
                    }
                    

                }
                Button {
                    //
                } label: {
                    ButtonLabel(title: "Hola")
                }
                Button {
                    //
                } label: {
                    MiniButtonLabel(title: "Sign Up")
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

struct MainMenuButtonImageLabel: View {
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
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: UIScreen.main.bounds.size.width/3.45, height: UIScreen.main.bounds.height/12)
                .foregroundColor(Color.white)
            BoldText(title: title)
                .foregroundColor(.accentColor)
            
        }
    }
}

struct ButtonLabel: View {
    @State var title: String
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: UIScreen.main.bounds.size.width/1.1, height: UIScreen.main.bounds.height/11.1)
                .foregroundColor(Color.white)
            BoldText(title: title)
        }
    }
}

struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        Buttons()
    }
}
