//
//  SignUpView-ViewModel.swift
//  Crypt Creeper
//
//  Created by Diego Moreno on 28/2/23.
//

// Pasar los datos del signup al faction view
// Elegir facción en el faction view a través del id

import Foundation
import UIKit

class SignUpViewModel: ObservableObject {
    
    @Published var username: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var repeatPassword: String = ""
    @Published var profilePic: UIImage?
    @Published var factionId: Int = 0
    
    @Published var alertTitle: String = ""
    @Published var alertMessage: String = ""
    @Published var message: String = ""
    @Published var showAlert: Bool = false
    @Published var isRegistered: Bool = false
    @Published var isLoged: Bool = false
    
    var userModel: UserModel = .init()
    
    let userDefaults = UserDefaults.standard
    private var token: String = ""
    
    struct User: Codable {
        var name: String
        var email: String
        var password: String
        var profile_pic: String
        var faction_id: Int
    }
    
    enum NetworkError: Error {
        case invalidUrl
        case invalidResponse
        case invalidData
        case requestFailed
        case authenticationError
        case badRequest
        case outdated
        case failed
        case unknown
        
        var localizedDescription: String {
            switch self {
            case .invalidUrl:
                return "The URL is not valid"
            case .invalidResponse:
                return "The response received from the server is not valid"
            case .invalidData:
                return "The data received from the server is not valid"
            case .requestFailed:
                return "The request failed"
            case .authenticationError:
                return "There was an authentication error"
            case .badRequest:
                return "The request is not valid"
            case .outdated:
                return "The request is outdated"
            case .failed:
                return "The request failed for an unknown reason"
            case .unknown:
                return "An unknown error occurred"
            }
        }
    }
    
    func signUp( _ userModel: UserModel, completion: @escaping (Result<String, Error>) -> Void) {
        let url = "http://127.0.0.1:8000/api/user/create"
        let dictionary: [String: Any] = [
            "name" : username,
            "email" : email,
            "password" : password,
            "faction_id" : factionId,
            "profile_pic" : convertImageToBase64(image: profilePic ?? UIImage())
        ]
        
        NetworkHelper.shared.requestProvider(url: url, type: .PUT, params: dictionary) { data, response, error in
            // Verificar si hay un error
            if let error = error {
                self.onError(error: error.localizedDescription)
            }
            
            // Verificar si se recibió una respuesta válida
            guard let data = data, let httpResponse = response as? HTTPURLResponse, (200..<599).contains(httpResponse.statusCode) else {
                completion(.failure(NetworkError.invalidResponse))
                return
            }
            
            // Procesar la respuesta
            do {
               let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let responseJson = json as? [String: Any], let message = responseJson["Token"] as? String {
                   completion(.success(message))
               } else {
                   print(dictionary)
                   completion(.failure(NetworkError.invalidData))
               }
           } catch {
               completion(.failure(NetworkError.invalidData))
           }
        }
    }
    
    func onSuccess(message: String) {
        isLoged = true
        self.token = message
        print(token)
        userDefaults.set(token, forKey: "savedToken")
        NetworkHelper.shared.setToken(tokens: token)
    }
    
    func onError(error: String) {
        print(error)
        alertTitle = "Something went wrong"
        alertMessage = "Make sure you write it all correctly"
        showAlert = true
    }
    
    func convertImageToBase64(image: UIImage) -> String {
        let compressedImage = compressImage(image: image, quality: 0.5) // Calidad deseada
        let base64String = compressedImage?.base64EncodedString() ?? ""
        return base64String
    }
    
    private func compressImage(image: UIImage, quality: CGFloat) -> Data? {
        return image.jpegData(compressionQuality: quality)
    }
}
