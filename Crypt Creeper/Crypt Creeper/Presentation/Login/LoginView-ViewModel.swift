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
        
        @Published var title: String = ""
        @Published var message: String = ""
        @Published var showAlert: Bool = false
        
        func login(name: String, password: String) {
            let url = "http://127.0.0.1:8000/api/user/login"
            let dictionary: [String: Any] = [
                "name" : name,
                "password" : password
            ]
            
            NetworkHelper.shared.requestProvider(url: url, params: dictionary) { data, response, error in
                if let error = error {
                    self.onError(error: error.localizedDescription)
                } else if let data = data, let response = response as? HTTPURLResponse {
                    print(data.debugDescription)
                    if response.statusCode == 200 {
                        print(response.statusCode)
                        self.onSuccess()
                    } else {
                        print(response.statusCode)
                        self.onError(error: error?.localizedDescription ?? "")
                    }
                }
            }
        }
        
        func onSuccess() {
//            isLoged = true
            print("Logueado")
            
        }

        func onError(error: String) {
            print("No")
            
            title = "El usuario no existe"
            message = "Asegúrate de haberlo escrito todo correctamente"
            showAlert = true
        }
    }
}
