//
//  LeaderBoardItems.swift
//  Crypt Creeper
//
//  Created by Abby Dominguez on 9/3/23.
//


import SwiftUI

struct LeaderBoardFactionItem : View {
    var faction_name:String?
    var faction_icon:String?
    var faction_points:String?
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.ui.popUpColor)
                .border(Color.ui.text)
            VStack{
                Text(faction_name ?? "Faction")
                    .foregroundColor(Color.ui.text)
                    .font(.custom("m6x11", fixedSize: 24))
                    .padding(7)
                Image(faction_icon ?? "Ghost")
                    .resizable()
                    .frame(width: 75, height: 75)
                Text(faction_points ?? "0")
                    .foregroundColor(Color.ui.text)
                    .font(.custom("m6x11", fixedSize: 24))
                    .padding(7)
            }
        }
        .frame(width: 150, height: 150)
        .padding(6)
    }

}

struct LeaderBoardItem:View{
    var player_name:String?
    var player_photo:Image?
    var player_points:String?
    var player_fation:String?
    var body: some View {
        HStack{
            Image("Ghost")
                .resizable()
                .frame(width: 75, height: 75)
                .padding(4)
                .border(Color.ui.text)
                .padding(.leading, 1)
            VStack(spacing: 6){
                HStack{
                    Text("1- \(player_name ?? "Player")")
                    Spacer()
                }
                HStack{
                    Text("\(player_points ?? "999999999999")p")
                    Spacer()
                }
                HStack{
                    Text("FACTION - \(player_fation ?? "DoubleDouble") ")
                    Spacer()
                }
            }
            .multilineTextAlignment(.leading)
            .foregroundColor(Color.ui.text)
            .font(.custom("m6x11", size: 20))
            .padding(7)
            .lineLimit(1)
            Spacer()
        }
        .padding(3)
        .border(Color.ui.text, width: 2)
        .padding(.horizontal, 8)
        
    }
}
