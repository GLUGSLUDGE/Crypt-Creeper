//
//  TextFields.swift
//  Crypt Creeper
//
//  Created by Diego Moreno on 16/2/23.
//

import SwiftUI

struct TextFields: View {
    @State var fieldTF : String = ""
    var body: some View {
        ZStack {
            Color.accentColor
                .ignoresSafeArea()
            VStack {
                TextFieldLabel(field: fieldTF)
                SecureFieldLabel(field: fieldTF)
            }
        }
    }
}

struct TextFieldLabel: View {
    @State var field : String = ""
    var body: some View {
        VStack {
            TextField("", text: $field)
                .background(Color.white)
                .font(.custom("m5x7", fixedSize: 30))
                .padding(.horizontal)
        }
    }
}

struct SecureFieldLabel: View {
    @State var field: String = ""
    var body: some View {
        VStack {
            SecureField("", text: $field)
                .background(Color.white)
                .padding(.horizontal)
        }
    }
}

struct TextFields_Previews: PreviewProvider {
    static var previews: some View {
        TextFields()
    }
}
