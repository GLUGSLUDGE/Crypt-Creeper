//
//  SettigsViewModel.swift
//  Crypt Creeper
//
//  Created by Osasu sanchez on 13/2/23.
//

import Foundation

struct user : Codable {
    let name : String
    var password : String
    var email : String
    var faction_id : Int
    var profile_pic : String
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



class SettingsViewModel : ObservableObject {
    
    @Published var userName = ""
    @Published var pass = ""
    @Published var email = ""
    @Published var profile_pic = ""
    @Published var message = ""
    //b @Published var data : [user] = []
    
    
    
    
    
    func ChangeName(completion: @escaping (Result<String, Error>) -> Void) {
        let url =  "http://127.0.0.1:8000/api/user/change-name"
        NetworkHelper.shared.setToken(tokens:"Z04g9C6HdeNL57WZqLSUOoajAzmENDncVeNGooNf")
        
        let parametros : [String:Any] = ["name": userName ]
        
        NetworkHelper.shared.requestProvider(url: url, type:.POST, params: parametros) { data, response, error in
            
            // Verificar si hay un error
            if let error = error {
                completion(.failure(error))
                return
            }
            // Verificar si se recibió una respuesta válida
            guard let data = data, let httpResponse = response as? HTTPURLResponse, (200..<300).contains(httpResponse.statusCode) else {
                completion(.failure(NetworkError.invalidResponse))
                return
            }
            
            // Procesar la respuesta
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let responseJson = json as? [String: Any], let message = responseJson["message"] as? String {
                    completion(.success(message))
                } else {
                    completion(.failure(NetworkError.invalidData))
                }
            } catch {
                completion(.failure(NetworkError.invalidData))
            }
        }
    }
    
    
    
    
    
    
    
    
    //            if let data = data {
    //                do {
    //                    let decoder = JSONDecoder()
    //                    let objects = try decoder.decode([user].self, from: data)
    //                    self.data = objects
    //                } catch {
    //                    self.message = ("Error decoding JSON: \(error.localizedDescription)")
    //                }
    //            } else if let error = error {
    //                self.message = ("Error fetching data: \(error.localizedDescription)")
    //            }
    
    
   

    
    
    func changePassword(newPass : String , repitNewPass : String) {
        
        let  url =  "http://127.0.0.1:8000/api/user/change-password"
        
        let parametros : [String:Any] = [
            "password": pass,
            "new_password" : newPass ,
            "repit_new_password" : repitNewPass]
        
        NetworkHelper.shared.requestProvider(url: url, type:.POST , params: parametros) { data, response, error in
            if let error = error {
                self.onError(error: error.localizedDescription)
                return
                
            }
            if let response = response as? HTTPURLResponse {
                self.message = "\(response.statusCode)"
                
            }
            if let data = data {
                let json = try? JSONSerialization.jsonObject(with: data, options: [])
                return self.message = "\(json ?? "")"
                
            }
        }
    }
    
    
    
    
    
    func onSuccess() {
        
    }
    func onError(error: String) {
        //  shouldShowErrorAlert = true
        print ("mal")
    }
    
    
}


extension UserDefaults{
    
}

