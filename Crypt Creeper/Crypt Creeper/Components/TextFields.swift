//
//  TextFields.swift
//  Crypt Creeper
//
//  Created by Diego Moreno on 16/2/23.
//

import SwiftUI
import Combine

struct TextFields: View {
    @State var field : String = ""
    @State var censored: String = ""
    var body: some View {
        ZStack {
            Color.ui.popUpColor
                .ignoresSafeArea()
            VStack {
                TextFieldLabel(field: $field)
                PasswordField(field: $field)
                SecureFieldLabel(field: field)
            }
        }
    }
}

struct TextFieldLabel: View {
    @Binding var field : String
    let textLimit = 15
    var body: some View {
        TextField("", text: $field)
            .background(Color.accentColor)
            .foregroundColor(.black)
            .font(.custom("m5x7", fixedSize: 30))
            .autocorrectionDisabled(true)
            .textInputAutocapitalization(.never)
            .onReceive(Just(field)) { _ in limitText(textLimit) }
    }
    func limitText(_ upper: Int) {
        if field.count > upper {
            field = String(field.prefix(upper))
        }
    }
}

struct PasswordField : View {
    @Binding var field: String
    let textLimit = 8
    var body: some View {
        SecureField("", text: $field)
            .background(Color.white)
            .font(.system(size: 23))
            .autocorrectionDisabled(true)
            .textInputAutocapitalization(.never)
            .onReceive(Just(field)) { _ in limitText(textLimit) }
    }
    
    func limitText(_ upper: Int) {
        if field.count > upper {
            field = String(field.prefix(upper))
        }
    }
}

struct SecureFieldLabel: View {
    @State var field: String = ""
    @State var secureText: String = ""
    let textLimit = 8
    var body: some View {
        ZStack {
            TextField("", text: $field)
                .background(Color.white)
                .foregroundColor(.clear)
                .font(.custom("m5x7", fixedSize: 30))
                .autocorrectionDisabled(true)
                .textInputAutocapitalization(.never)
                //.multilineTextAlignment(.center)
                .onReceive(Just(field)) { value in
                    secureText = value
                    secureText = String(value.map { _ in "*"})
                }
                .onReceive(Just(field)) { _ in limitText(textLimit) }
            
            HStack {
                Text(secureText)
                    .frame(height: 30)
                    .font(.custom("m5x7", size: 40))
                    .tracking(1)
                    .multilineTextAlignment(.trailing)
                Spacer()
            }
        }
    }
    
    func limitText(_ upper: Int) {
        if field.count > upper {
            field = String(field.prefix(upper))
        }
    }
}

struct TextFields_Previews: PreviewProvider {
    static var previews: some View {
        TextFields()
    }
}
