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
        
        
        func login(completion: @escaping (_ result: String? , _ error: NetworkError.networkErrorEnum?) -> Void) {
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
                    completion(nil,NetworkError.networkErrorEnum.invalidResponse)
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
                        }.joined(separator: "")
                        completion(nil, NetworkError.networkErrorEnum.validationError(errorMessage))
                    }
                } catch {
                    completion(nil, NetworkError.networkErrorEnum.invalidData)
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
