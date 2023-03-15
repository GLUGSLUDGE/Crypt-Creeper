//
//  FactionView-ViewModel.swift
//  Crypt Creeper
//
//  Created by Diego Moreno on 4/3/23.
//

import Foundation
import UIKit
import SwiftUI

extension FactionsView {
    class ViewModel: ObservableObject{
        
        
        // MARK: - Properties
        
        @Published var isLoged: Bool = false
        @Published var formError: Bool = false
        
        let userDefaults = UserDefaults.standard
        private var token: String = ""
        
        
        // MARK: - Methods
        
        func signUp(user: UserModel, completion: @escaping (Result<String, Error>) -> Void) {
            let url = "http://127.0.0.1:8000/api/user/create"
            let dictionary: [String: Any] = [
                "name" : user.username,
                "email" : user.email,
                "password" : user.password,
                "faction_id" : user.factionId,
                "profile_pic" : Base64.shared.convertImageToBase64(image: user.profilePic)
            ]
            
            NetworkHelper.shared.requestProvider(url: url, type: .PUT, params: dictionary) { data, response, error in
                // Verificar si hay un error
                if let error = error {
                    self.onError(error: error.localizedDescription)
                }
                
                // Verificar si se recibió una respuesta válida
                guard let data = data, let httpResponse = response as? HTTPURLResponse, (200..<599).contains(httpResponse.statusCode) else {
                    completion(.failure(NetworkError.networkErrorEnum.invalidResponse))
                    return
                }
                
                // Procesar la respuesta
                do {
                   let json = try JSONSerialization.jsonObject(with: data, options: [])
                    if let responseJson = json as? [String: Any], let message = responseJson["Token"] as? String {
                       completion(.success(message))
                   } else {
                       completion(.failure(NetworkError.networkErrorEnum.invalidData))
                   }
               } catch {
                   completion(.failure(NetworkError.networkErrorEnum.invalidData))
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
            formError = true
        }
        
    }
}
