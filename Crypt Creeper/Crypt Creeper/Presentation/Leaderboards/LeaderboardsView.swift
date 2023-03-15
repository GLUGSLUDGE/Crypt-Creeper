//
//  LeaderboardsView.swift
//  Crypt Creeper
//
//  Created by Abby Dominguez on 9/3/23.
//

import SwiftUI


struct LeaderboardsView: View {
    @ObservedObject var viewModel = LeaderboardViewModel()
    @Binding var show:Bool
    
    var body: some View {
        if show {
            ZStack{
                Color.ui.UIBackground
                    .ignoresSafeArea()
                PopUpsView(title: "LEADERBOARDS") {
                    Spacer()
                }
                .padding(.horizontal, 8)
                VStack{
                    PopUpsView(title: "FACTION LEADERBOARDS") {
                        ScrollView(.horizontal){
                            HStack{
                                ForEach(viewModel.factionLeaderboard ,id: \.points) { faction in
                                    LeaderBoardFactionItem(faction_name: faction.name, faction_icon: faction.faction_id, faction_points: faction.points)
                                }
                            }.padding(.bottom, 8)
                        }
                    }.onAppear{
                        viewModel.getTopFactions { result, error in
                            if let leaderboard = result {
                                DispatchQueue.main.async {
                                    viewModel.factionLeaderboard = leaderboard.compactMap { factionDict in
                                        do {
                                            let data = try JSONSerialization.data(withJSONObject: factionDict, options: [])
                                            let faction = try JSONDecoder().decode(FactionScoreResponseModel.self, from: data)
                                            return faction
                                        } catch {
                                            print("Error decoding faction: \(error)")
                                            return nil
                                        }
                                    }
                                }
                            }
                            if let error = error {
                                print(error)
                            }
                        
                        }
                    }
                    PopUpsView(title: "PLAYER LEADERBOARDS") {
                        ScrollView(){
                            VStack{
                                LeaderBoardItem()
                                LeaderBoardItem()
                                LeaderBoardItem()
                                LeaderBoardItem()
                                LeaderBoardItem()
                                LeaderBoardItem()
                                LeaderBoardItem()
                                LeaderBoardItem()
                                
                            }
                        }
                    }
                }
                .padding(.top, 32)
                
            }
            .overlay(content: {
                VStack{
                    HStack{
                        Spacer()
                        Button {
                            show.toggle()
                        } label: {
                            Image("")
                                .resizable()
                                .frame(width: 30,height:30)
                                .padding(.trailing,15)
                                .padding(.top,20)
                                .foregroundColor(Color.clear)
                        }
                    }
                    Spacer()
                }})
        }
        
    }
}

struct LeaderboardsView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardsView(show: .constant(true))
    }
}
