//
//  Base64.swift
//  Crypt Creeper
//
//  Created by Osasu sanchez on 25/2/23.
//

import Foundation
import UIKit
class Base64 {
    
    static let shared = Base64()
     func convertImageToBase64(image: UIImage) -> String {
        let compressedImage = compressImage(image: image, quality: 0.5) // Calidad deseada
        let base64String = compressedImage?.base64EncodedString() ?? ""
        return base64String
    }
  
    private func compressImage(image: UIImage, quality: CGFloat) -> Data? {
        return image.jpegData(compressionQuality: quality)
    }
}
