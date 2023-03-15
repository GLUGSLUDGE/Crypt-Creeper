//
//  SettigsViewModel.swift
//  Crypt Creeper
//
//  Created by Osasu sanchez on 13/2/23.
//

import Foundation
import UIKit

class SettingsViewModel : ObservableObject {
    
    @Published var userName = ""
    @Published var pass = ""
    @Published var newPass = ""
    @Published var repitNewPass = ""
    @Published var email = ""
    @Published var showAlet1 = false
    @Published var showCN = false
    @Published var showCP = false
    @Published var showCPic = false
    @Published var showLog = false
    @Published var showLogOut = false
    @Published var showDestry = false
    
    @Published var profile_pic : UIImage?
    @Published var message = ""
    //b @Published var data : [user] = []
    
    
    
    func ChangeName(completion: @escaping (_ result: String? , _ error: NetworkError.networkErrorEnum?) -> Void) {
       
        let url =  "http://127.0.0.1:8000/api/user/change-name"

        let parametros : [String:Any] = ["name": userName]
        
        NetworkHelper.shared.requestProvider(url: url, type:.POST, params: parametros) { data, response, error in
            
            // Verificar si hay un error
            if let error = error {
                completion(nil ,NetworkError.networkErrorEnum.badRequest)
                return
            }
            // Verificar si se recibió una respuesta válida
            guard let data = data, let httpResponse = response as? HTTPURLResponse, (200..<599).contains(httpResponse.statusCode) else {
                completion(nil,NetworkError.networkErrorEnum.invalidResponse)
                return
            }
            
            // Procesar la respuesta
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let responseJson = json as? [String: Any], let message = responseJson["message"] as? String {
                    completion(message, nil)
                } else if let response = json as? [String: Any], let errors = response["Errors"] as? [String:Any]{
                    let errorMessage = errors.map { _, value in
                        "\(value)"
                    }.joined(separator: "")
                    completion(nil, NetworkError.networkErrorEnum.validationError(errorMessage))
                }
            } catch {
                completion(nil, NetworkError.networkErrorEnum.invalidData)
            }
        }
    }
    func changePassword(completion: @escaping (_ result: String? , _ error: NetworkError.networkErrorEnum?) -> ())  {
        let url =  "http://127.0.0.1:8000/api/user/change-password"
        let parametros : [String:Any] = [
            "password": pass,
            "new_password" : newPass,
            "repit_new_password" : repitNewPass]
        
        NetworkHelper.shared.requestProvider(url: url, type: .POST , params: parametros) { data, response, error in
            // Verificar si hay un error
            if let error = error {
                completion(nil, NetworkError.networkErrorEnum.badRequest)
                return
            }
            // Verificar si se recibió una respuesta válida
            guard let data = data, let httpResponse = response as? HTTPURLResponse, (200..<599).contains(httpResponse.statusCode) else {
                completion(nil, NetworkError.networkErrorEnum.invalidResponse)
                return
            }
            // Procesar la respuesta
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let responseJson = json as? [String: Any], let message = responseJson["message"] as? String {
                    completion(message, nil)
                } else if let response = json as? [String: Any], let errors = response["Errors"] as? [String:Any]{
                    let errorMessage = errors.map { _, value in
                        "\(value)"
                    }.joined(separator: "")
                    completion(nil, NetworkError.networkErrorEnum.validationError(errorMessage))
                }
            } catch {
                completion(nil, NetworkError.networkErrorEnum.invalidData)
            }
        }
    }
    
    func changePhoto(completion: @escaping (_ result: String? , _ error: NetworkError.networkErrorEnum?) -> Void){
        
      
        let  url =  "http://127.0.0.1:8000/api/user/change-photo"
       
        let parametros : [String: Any] = [
            "profile_pic": Base64.shared.convertImageToBase64(image: profile_pic ?? UIImage())]
        
        NetworkHelper.shared.requestProvider(url: url, type: .POST, params: parametros) { data, response, error in
            
            if let error = error {
                completion(nil,NetworkError.networkErrorEnum.badRequest)
                return
            }
            // Verificar si se recibió una respuesta válida
            guard let data = data, let httpResponse = response as? HTTPURLResponse, (200..<599).contains(httpResponse.statusCode) else {
                completion(nil ,NetworkError.networkErrorEnum.invalidResponse)
                return
            }
            // Procesar la respuesta
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let responseJson = json as? [String: Any], let message = responseJson["message"] as? String {
                    completion(message, nil)
                }  else if let response = json as? [String: Any], let errors = response["Errors"] as? [String:Any]{
                    let errorMessage = errors.map { _, value in
                        "\(value)"
                    }.joined(separator: "")
                    //             self.message = errorMessage
                    completion(nil, NetworkError.networkErrorEnum.validationError(errorMessage))
                }
            } catch {
                completion(nil,NetworkError.networkErrorEnum.invalidData)
            }
        }
    }
    
    
    func logOut(completion:@escaping (_ result: String? , _ error: NetworkError.networkErrorEnum?) -> Void){
        
       
        
        let  url =  "http://127.0.0.1:8000/api/user/logout"
        // Verificar si se recibió una respuesta válida
        NetworkHelper.shared.requestProvider(url: url) { data, response, error in
            guard let data = data, let httpResponse = response as? HTTPURLResponse, (200..<599).contains(httpResponse.statusCode) else {
                completion(nil,NetworkError.networkErrorEnum.invalidResponse)
                return
            }
    
            // Procesar la respuesta
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let responseJson = json as? [String: Any], let message = responseJson["message"] as? String {
                    completion(message,nil)
                } else {
                    completion(nil,NetworkError.networkErrorEnum.invalidData)
                }
            } catch {
                completion(nil,NetworkError.networkErrorEnum.invalidData)
            }
        }
        
    }
    func destryAccount(completion: @escaping (_ result: String? , _ error: NetworkError.networkErrorEnum?) -> Void) {
       
        let url =  "http://127.0.0.1:8000/api/user/delete-user"

        let parametros : [String:Any] = ["password": pass]
        
        NetworkHelper.shared.requestProvider(url: url, type:.DELETE, params: parametros) { data, response, error in
            
            // Verificar si hay un error
            if let error = error {
                completion(nil , NetworkError.networkErrorEnum.badRequest)
                return
            }
            // Verificar si se recibió una respuesta válida
            guard let data = data, let httpResponse = response as? HTTPURLResponse, (200..<599).contains(httpResponse.statusCode) else {
                completion(nil ,NetworkError.networkErrorEnum.invalidResponse)
                return
            }
            
            // Procesar la respuesta
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                if let responseJson = json as? [String: Any], let message = responseJson["message"] as? String {
                    completion(message,nil)
                }  else if let response = json as? [String: Any], let errors = response["Errors"] as? [String:Any]{
                    let errorMessage = errors.map { _, value in
                        "\(value)"
                    }.joined(separator: "")
                    completion(nil, NetworkError.networkErrorEnum.validationError(errorMessage))
                }
            } catch {
                completion(nil,NetworkError.networkErrorEnum.invalidData)
            }
        }
    }

    
}



