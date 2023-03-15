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
                                ForEach(Array(viewModel.topFactionScores.enumerated()) ,id: \.offset) { index ,factionScore in
                                    LeaderBoardFactionItem(top: index+1,
                                        faction_name: factionScore.name,
                                        faction_icon: factionScore.faction_id,
                                        faction_points: factionScore.points
                                    )
                                }
                            }.padding(.bottom, 8)
                        }
                    }.onAppear{
                        viewModel.getTopFactions { result, error in
                            if let score = result{
                                viewModel.topFactionScores = score
                            }
                            if let error = error{
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
