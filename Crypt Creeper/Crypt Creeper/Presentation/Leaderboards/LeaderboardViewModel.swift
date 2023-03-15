//
//  LeaderboardViewModel.swift
//  Crypt Creeper
//
//  Created by Osasu sanchez on 14/3/23.
//

import Foundation


struct FactionScoreResponseModel: Decodable {
    var faction_id: Int
    var points: String
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case faction_id
        case points
        case name
        
    }
}

struct TopPlayerScoreResponseModel: Decodable {
   var user_id: Int
    var points:Int
    var photo:String
    var username :String
    var faction : String
    
    enum CodingKeys: String, CodingKey {
        case user_id
        case points
        case photo
        case username
        case faction
    }
}



class LeaderboardViewModel : ObservableObject {
    
    @Published var factionLeaderboard: [FactionScoreResponseModel] = []
    @Published var playerLeaderboard: [TopPlayerScoreResponseModel] = []
    
    
    func getTopFactions(completion: @escaping ([[String: Any]]? ,Error?) -> Void) {
        let url = "http://127.0.0.1:8000/api/factions/leaderboard"
        
        NetworkHelper.shared.requestProvider(url: url, type: .GET) { data, response, error in
            
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
                
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any], let leaderboard = json["LEADERBOARD"] as? [[String:Any]] {
                    
                    completion(leaderboard, nil)
                    print(leaderboard)
                }
                
            } catch {
                completion(nil, NetworkError.networkErrorEnum.invalidData)
            }
        }
    }
    
    func getTopUsers(completion: @escaping ([[String: Any]]? ,Error?) -> Void){
        let url = "http://127.0.0.1:8000/api/play/leaderboard"
        NetworkHelper.shared.requestProvider(url: url, type: .GET) { data, response, error in
            
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
                
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any], let leaderboard = json["LEADERBOARD"] as? [[String:Any]] {
                    
                    completion(leaderboard, nil)
                    print(leaderboard)
                }
                
            } catch {
                completion(nil, NetworkError.networkErrorEnum.invalidData)
            }
            
        }
        
    }
    
}


