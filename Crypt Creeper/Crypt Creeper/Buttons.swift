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
                .foregroundColor(Color.black)
            
            Text(title)
                .foregroundColor(Color.ui.textYellow)
                .font(.system(size: 30))
                .fontWeight(.black)
        }
    }
}



struct Buttons_Previews: PreviewProvider {
    static var previews: some View {
        Buttons()
    }
}
