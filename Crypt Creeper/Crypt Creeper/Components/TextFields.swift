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
            Color.accentColor
                .ignoresSafeArea()
            VStack {
                TextFieldLabel(field: field)
                    .background(Color.white)
                PasswordField(field: field)
                SecureFieldLabel(field: field)
                    .background(Color.white)
            }
        }
    }
}

struct TextFieldLabel: View {
    @State var field : String = ""
    var body: some View {
        TextField("", text: $field)
            .background(Color.white)
            .foregroundColor(.black)
            .font(.custom("m5x7", fixedSize: 30))
            .autocorrectionDisabled(true)
            .textInputAutocapitalization(.never)
    }
}

struct PasswordField : View {
    @State var field: String = ""
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
                .onReceive(Just(field)) { value in
                    secureText = value
                    secureText = String(value.map { _ in "*"})
                }
                .onReceive(Just(field)) { _ in limitText(textLimit)  }
            
            HStack {
                Text(secureText)
                    .frame(height: 30)
                    .tracking(3.5)
                    .font(.custom("m5x7", size: 30))
                
                Spacer()
            }
        }
        VStack {
            Text(field)
            Text(secureText)
        }
    }
    
    func limitText(_ upper: Int) {
            if field.count > upper {
                field = String(field.prefix(upper))
            }
        }
}


// TODO: Cambiar tamaño
// TODO: Que se adapten los asteriscos al texto escrito
struct TextFields_Previews: PreviewProvider {
    static var previews: some View {
        TextFields()
    }
}

//
//                  field = field.asterisked
extension String {
    var asterisked: String {
        var asteriskedString: String = ""
        for _ in 0...self.count {
            asteriskedString.append("*")
        }
        return asteriskedString
    }
}
