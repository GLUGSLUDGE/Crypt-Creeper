//
//  Alert.swift
//  Crypt Creeper
//
//  Created by Diego Moreno on 25/2/23.
//

import SwiftUI

struct AlertCustom: ViewModifier {
    var title: String
    var message: String
    
    @Binding var show: Bool
    
    func body(content: Content) -> some View {
        content
            .alert(isPresented: $show) {
                Alert(
                    title: Text(title),
                    message: Text(message)
                )
            }
//        PopUpsView(bodyContent: {
//            VStack {
//                BoldText(title: title)
//                    .foregroundColor(Color.ui.text)
//                    .padding()
//                ThinText(title: message)
//                    .multilineTextAlignment(.center)
//                    .foregroundColor(Color.ui.text)
//                    .padding(.bottom)
//                HStack {
//                    Button {
//
//                    } label: {
//                        TrueButton(title: "Yes")
//                    }
//
//                    TrueButton(title: "No")
//                }
//            }
//        }, title: "ERROR", show: show)
    }
}

extension View {
    func alertCustom(title: String, message: String, show: Binding<Bool>) -> some View {
        modifier(AlertCustom(title: title, message: message, show: show))
    }
}
