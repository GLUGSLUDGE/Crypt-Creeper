//
//  UserProfileView-ViewModel.swift
//  Crypt Creeper
//
//  Created by Diego Moreno on 7/3/23.
//

import SwiftUI

extension UserProfileView {
    
    struct UserProfileResponseModel: Decodable {
        var user: [UserResponseModel]
    }
    
    struct UserResponseModel: Decodable {
        var name: String?
        var faction_id: Int?
        var profile_pic: String?
    }
    
    struct UserPresentationModel {
        var name: String
        var factionId: Int
        var image: String
        
        init() {
            self.name = ""
            self.factionId = 1
            self.image = ""
        }
        
        init(userResponseModel: UserResponseModel) {
            self.name = userResponseModel.name ?? ""
            self.factionId = userResponseModel.faction_id ?? 1
            self.image = userResponseModel.profile_pic ?? ""
        }
    }
    
    class ViewModel: ObservableObject {
        
        @Published var profile: UserPresentationModel = .init()
        
        func getUser() {
            
            let url = "http://127.0.0.1:8000/api/user/getUserData"
            
            NetworkHelper.shared.requestProvider(url: url, type: .GET) { data, response, error in
                if let error = error {
                    self.onError(error: error.localizedDescription)
                }
                
                // Verificar si se recibió una respuesta válida
                guard let data = data, let httpResponse = response as? HTTPURLResponse, (200..<299).contains(httpResponse.statusCode) else {
                    return
                }
                
                do {
                    let userResponse = try JSONDecoder().decode(UserResponseModel.self, from: data)
                    self.profile = UserPresentationModel(userResponseModel: userResponse)
                    
                    
                    //                    let username = userResponse.user.first?.name ?? ""
                    //                    let faction = userResponse.user.first?.faction ?? ""
                    //                    print(username)
                    //                    print(faction)
                    //                    completion([username, faction], nil)
                } catch {
                   print("error")
                }
            }
            
        }
        
        func onSuccess(message: Any) {
            
        }
        
        func onError(error: String) {
            
        }
    }
}
