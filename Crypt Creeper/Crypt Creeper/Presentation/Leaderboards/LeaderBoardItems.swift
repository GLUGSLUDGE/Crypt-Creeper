//
//  LeaderBoardItems.swift
//  Crypt Creeper
//
//  Created by Abby Dominguez on 9/3/23.
//


import SwiftUI

struct LeaderBoardFactionItem : View {
    
    var faction_name:String?
    var faction_icon:Int?
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
                Image(factionIcon(iconNumber: faction_icon ?? 1))
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
    func factionIcon(iconNumber: Int) -> String {
        let iconFaction = [
            1: "Ghost",
            2: "Hans",
            3: "Mosca",
            4: "Double_double",
            5: "Uzzi",
            6: "Tía",
            7: "Kingeyes",
            8: "Big_mud",
        ]
        return iconFaction[iconNumber] ?? "Ghost"
    }
}

struct LeaderBoardItem:View{
    var top :Int = 0
    var player_name:String?
    var player_photo:String = "https://picsum.photos/200/300"
    var player_points:Int?
    var player_fation:String?
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: "\( player_photo ?? "")" )) { phase in
                switch phase {
                case .empty:
                    Image(systemName: "photo")
                        .resizable()
                        .frame(width: 75, height: 75)
                        .padding(4)
                        .border(Color.ui.text)
                        .padding(.leading, 1)
                case .success(let image):
                    image.resizable()
                        .frame(width: 75, height: 75)
                        .padding(4)
                        .border(Color.ui.text)
                        .padding(.leading, 1)
                    
                case .failure:
                    Image(systemName: "photo")
                        .resizable()
                        .frame(width: 75, height: 75)
                        .padding(4)
                        .border(Color.ui.text)
                        .padding(.leading, 1)
                default:
                    EmptyView()
                }
            }
            VStack(spacing: 6){
                HStack{
                    Text("\(top)-\(player_name ?? "Player")")
                    Spacer()
                }
                HStack{
                    Text("\(player_points ?? 999999999999)")
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
    func getImage(from url: String) -> UIImage {
        if let url = URL(string: url), let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
            return image
        } else {
            return UIImage(named: "default") ?? UIImage()
        }
    }
}

