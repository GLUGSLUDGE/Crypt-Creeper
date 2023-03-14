//
//  LoginView-ViewModel.swift
//  Crypt Creeper
//
//  Created by Diego Moreno on 25/2/23.
//

import Foundation
import CryptoKit

extension LoginView {
    
    class ViewModel: ObservableObject {
        
        @Published var name: String = ""
        @Published var password: String = ""
        @Published var alertTitle: String = ""
        @Published var alertMessage: String = ""
        @Published var message: String = ""
        @Published var showAlert: Bool = false
        @Published var isLoged: Bool = false
        
        let userDefaults = UserDefaults.standard
        private var token: String = ""
        
        struct User: Codable {
            var name: String
            var password: String
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
            case validationError(String)
            
            var customLocalizedDescription: String {
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
                case .validationError(let messageErrors):
                    return messageErrors
                }
            }
        }
        
        func login(completion: @escaping (_ result: String? , _ error: NetworkError?) -> Void) {
            let url = "http://127.0.0.1:8000/api/user/login"
            let dictionary: [String: Any] = [
                "name" : name,
                "password" : password
            ]
            
            NetworkHelper.shared.requestProvider(url: url, params: dictionary) { data, response, error in
                // Verificar si hay un error
                if let error = error {
                    self.onError(error: error.localizedDescription)
                }
                
                // Verificar si se recibió una respuesta válida
                guard let data = data, let httpResponse = response as? HTTPURLResponse, (200..<599).contains(httpResponse.statusCode) else {
                    completion(nil,NetworkError.invalidResponse)
                    return
                }
                
                // Procesar la respuesta
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    if let responseJson = json as? [String: Any], let succesResponse = responseJson["Token"] as? String {
                        self.token = succesResponse
                        completion(succesResponse, nil)
                       
                    } else if let response = json as? [String: Any], let message = response["message"] as? String{
                        completion(message, nil)
                        
                    }else if let response = json as? [String: Any], let validationErrors = response["Errors"] as? [String:Any]{
                        let errorMessage = validationErrors.map { _, value in
                            "\(value)"
                        }.joined(separator: "\n")
                        completion(nil, NetworkError.validationError(errorMessage))
                    }
                } catch {
                    completion(nil, NetworkError.invalidData)
                }
            }
        }
        
        func onSuccess(message: String) {
            
            if !self.token.isEmpty{
                isLoged = true
                print(self.token)
                userDefaults.set(token, forKey: "savedToken")
                NetworkHelper.shared.setToken(tokens: self.token)
            }else{
                alertTitle = "Something has gone wrong"
                alertMessage = message
                showAlert = true
            }
        }
        
        func onError(error: String) {
            print(error)
            alertTitle = "User or password incorrect"
            alertMessage = error
            showAlert = true
        }
    }
}
