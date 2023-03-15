//
//  LeaderboardViewModel.swift
//  Crypt Creeper
//
//  Created by Osasu sanchez on 14/3/23.
//

import Foundation
import UIKit


struct FactionScoreTopLevelResponseModel: Decodable {
    var LEADERBOARD: [FactionScoreResponseModel]
}

struct FactionScoreResponseModel: Decodable,Identifiable {
    let id: UUID
    var faction_id: Int
    var points: Int
    var name: String
}


class LeaderboardViewModel : ObservableObject {
    
    @Published var topFactionScores: [FactionScoreResponseModel] = []
    
    func getTopFactions(completion: @escaping (_ result:[FactionScoreResponseModel]?,_ error :NetworkError.networkErrorEnum?) ->()) {
        let url = "http://127.0.0.1:8000/api/factions/leaderboard"
        
        NetworkHelper.shared.requestProvider(url: url, type: .GET) { data, response, error in
            
            // Verificar si se recibió una respuesta válida
            guard let data = data, let httpResponse = response as? HTTPURLResponse, (200..<599).contains(httpResponse.statusCode) else {
                completion(nil, NetworkError.networkErrorEnum.invalidResponse)
                return
            }
            do {
                let scoreResponse = try JSONDecoder().decode(FactionScoreTopLevelResponseModel.self, from: data)
                let factionScores = scoreResponse.LEADERBOARD
                completion(factionScores, nil)
            } catch {
                completion(nil, NetworkError.networkErrorEnum.requestFailed)
            }
            
        }
    }
}




