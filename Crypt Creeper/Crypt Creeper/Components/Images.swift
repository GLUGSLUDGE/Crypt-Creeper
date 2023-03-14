//
//  Image.swift
//  Crypt Creeper
//
//  Created by Diego Moreno on 2/3/23.
//

import SwiftUI

struct ImageFromUi: View {
    var image: UIImage?
    var completion: () -> ()
    var body: some View {
        if let selectedImage = image {
            Image(uiImage: selectedImage)
                .resizable()
                .scaledToFit()
                .onTapGesture {
                    completion()
                }
        }
    }
}

struct ImageSysName: View {
    var image: String
    var completion: () -> ()
    var body: some View {
        Image(systemName: image)
            .resizable()
            .scaledToFit()
            .onTapGesture {
                completion()
            }
    }
}

struct ImageFromAssets: View {
    var image: String
    var body: some View {
        Image(image)
            .resizable()
            .scaledToFit()
            .padding(.horizontal, 10)
    }
}

struct ImageFromUrl: View {
    var image: String
    var body: some View {
        AsyncImage(url: URL(string: image))
            .scaledToFit()
    }
}
