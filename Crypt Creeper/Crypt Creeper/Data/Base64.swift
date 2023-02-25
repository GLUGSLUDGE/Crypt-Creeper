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
        let maxSize = CGSize(width: 800, height: 800) // Tamaño máximo permitido
        let resizedImage = resizeImage(image: image, toFit: maxSize)
        let compressedImage = compressImage(image: resizedImage, quality: 0.5) // Calidad deseada
        let base64String = compressedImage?.base64EncodedString() ?? ""
        return base64String
    }
    private func resizeImage(image: UIImage, toFit size: CGSize) -> UIImage {
        let originalSize = image.size
        let widthRatio = size.width / originalSize.width
        let heightRatio = size.height / originalSize.height
        let scaleFactor = min(widthRatio, heightRatio)
        
        let newSize = CGSize(width: originalSize.width * scaleFactor, height: originalSize.height * scaleFactor)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        image.draw(in: CGRect(origin: CGPoint.zero, size: newSize))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage ?? image
    }
    
    private func compressImage(image: UIImage, quality: CGFloat) -> Data? {
        return image.jpegData(compressionQuality: quality)
    }
}
