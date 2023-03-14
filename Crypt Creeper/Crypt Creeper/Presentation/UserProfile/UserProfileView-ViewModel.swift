//
//  UserProfileView-ViewModel.swift
//  Crypt Creeper
//
//  Created by Diego Moreno on 7/3/23.
//

import SwiftUI

extension UserProfileView {
    
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
    
    struct TopUserScore: Decodable {
        var score: [ScoreResponseModel]
    }
    
    struct ScoreResponseModel: Decodable {
        var points: Int?
    }
    
    class ViewModel: ObservableObject {
        
        @Published var profile: UserPresentationModel = .init()
        
        @Published var facTitle: String = ""
        @Published var facImage: String = ""
        @Published var userPoints: [Int] = []
        
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
                    self.factionName()
                } catch {
                   print("error")
                }
            }
        }
        
        func getUserPoints() {
            
            let url = "http://127.0.0.1:8000/api/user/getTop8"
            
            NetworkHelper.shared.requestProvider(url: url, type: .GET) { data, response, error in
                if let error = error {
                    self.onError(error: error.localizedDescription)
                }
                
                // Verificar si se recibió una respuesta válida
                guard let data = data, let httpResponse = response as? HTTPURLResponse, (200..<299).contains(httpResponse.statusCode) else {
                    return
                }
                
                do {
                    let scoreResponse = try JSONDecoder().decode(TopUserScore.self, from: data)
                    self.userPoints = scoreResponse.score.compactMap({ $0.points }).sorted(by: { $0 > $1 })
                    
                } catch {
                   print("error")
                }
            }
        }
        
        func factionName() {
            switch self.profile.factionId {
            case 1:
                facTitle = "Ghost"
                facImage = "Ghost"
            case 2:
                facTitle = "Hans"
                facImage = "Hans"
            case 3:
                facTitle = "Mosca"
                facImage = "Mosca"
            case 4:
                facTitle = "Double2"
                facImage = "Double_double"
            case 5:
                facTitle = "Uzzi"
                facImage = "Uzzi"
            case 6:
                facTitle = "Tia"
                facImage = "Tía"
            case 7:
                facTitle = "KingEyes"
                facImage = "Kingeyes"
            case 8:
                facTitle = "Big Mud"
                facImage = "Big_mud"
            default:
                facTitle = "WTF"
            }
        }
        
        func onError(error: String) {
            print(error)
        }
    }
}
