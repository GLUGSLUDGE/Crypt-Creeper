//
//  LeaderboardsView.swift
//  Crypt Creeper
//
//  Created by Abby Dominguez on 9/3/23.
//

import SwiftUI

struct LeaderboardsView: View {
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
                                LeaderBoardFactionItem()
                                LeaderBoardFactionItem()
                                LeaderBoardFactionItem()
                                LeaderBoardFactionItem()
                                LeaderBoardFactionItem()
                                LeaderBoardFactionItem()
                                LeaderBoardFactionItem()
                                LeaderBoardFactionItem()
                            }.padding(.bottom, 8)
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
