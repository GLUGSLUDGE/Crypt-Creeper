//
//  SignUpExtensions.swift
//  Crypt Creeper
//
//  Created by Diego Moreno on 25/2/23.
//

import SwiftUI

extension SignUpView {   
    
    @ViewBuilder func galleryImage(completion: @escaping () -> ()) -> some View {
        ImageSysName(image: "photo.on.rectangle.angled") {
            completion()
        }
        .foregroundColor(Color.white)
        .rotationEffect(.degrees(-25))
        .padding(.horizontal, 10)
    }
    
    @ViewBuilder func cameraImage(completion: @escaping () -> ()) -> some View {
        ImageSysName(image: "camera") {
            completion()
        }
        .foregroundColor(Color.white)
        .rotationEffect(.degrees(25))
        .padding(.horizontal, 10)
    }
}
