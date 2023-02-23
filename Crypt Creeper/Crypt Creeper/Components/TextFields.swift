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
                PasswordField(field: field)
                SecureFieldLabel(field: field)
                SectionTextFields(spacing: 20)
//                HStack(spacing: 10) {
//                    SecureFieldLabel(field: field)
//                    SecureFieldLabel(field: field)
//                    SecureFieldLabel(field: field)
//                    SecureFieldLabel(field: field)
//                    SecureFieldLabel(field: field)
//                    SecureFieldLabel(field: field)
//                    SecureFieldLabel(field: field)
//                    SecureFieldLabel(field: field)
//                }
//                .padding(.trailing, 150)
            }
        }
    }
}

struct TextFieldLabel: View {
    @State var field : String = ""
    let textLimit = 10
    var body: some View {
        TextField("", text: $field)
            .background(Color.white)
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

struct SectionTextFields: View {
    enum FocusField : Hashable {
        case field1
        case field2
        case field3
        case field4
        case field5
        case field6
        case field7
        case field8
    }
    
    @FocusState private var focusedField: FocusField?
    @State var field: String = ""
    @State var array: [String] = []
    @State var spacing: CGFloat

    var body: some View {
        ZStack {
            HStack(spacing: spacing) {
                SecureFieldLabel(field: field)
                    .focused($focusedField, equals: .field1)
                    .onChange(of: Just(field), perform: { value in
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {  /// Anything over 0.5 seems to work
                            self.focusedField = .field2
                        }
                    })
                SecureFieldLabel(field: field)
                    .focused($focusedField, equals: .field2)
                SecureFieldLabel(field: field)
                SecureFieldLabel(field: field)
                SecureFieldLabel(field: field)
                SecureFieldLabel(field: field)
                SecureFieldLabel(field: field)
                SecureFieldLabel(field: field)
            }
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

extension String {
    var asterisked: String {
        var asteriskedString: String = ""
        for _ in 0...self.count {
            asteriskedString.append("*")
        }
        return asteriskedString
    }
}
