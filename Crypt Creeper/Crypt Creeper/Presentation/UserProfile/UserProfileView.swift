//
//  UserProfileView.swift
//  Crypt Creeper
//
//  Created by Diego Moreno on 6/3/23.
//

import SwiftUI

struct UserProfileView: View {
    
    
    // MARK: - Properties
    
    let top: [Int] = [1, 2, 3, 4, 5, 6, 7, 8]
    let arrayPoints: [Int] = [400, 500, 200, 100, 600]
    let trophys: [Int] = [1, 2, 3, 4, 5]
    
    @Binding var show: Bool
    
    @State var facTitle: String = ""
    @State var facImage: String = ""
    
    @ObservedObject var viewModel: ViewModel = ViewModel()
    
    
    // MARK: - Body
    
    var body: some View {
        if show {
            ZStack {
                PopUpsView(title: "\(viewModel.profile.name)'s Profile",bodyContent:{
                    Spacer()
                })
                .padding(.horizontal, 8)
                VStack {
                    HStack(spacing: 0) {
                        PopUpsView(title: "PFP") {
                            ImageFromAssets(image: "Ghost")
                        }
                        .padding(.top, 40)
                        PopUpsView(title: facTitle) {
                            ImageFromAssets(image: facImage)
                        }
                        .frame(width: 190, height: 190)
                        .padding(.top, 40)
                    }
                    PopUpsView(title: "Top Plays") {
                        topPlaysScroll
                    }
                    PopUpsView(title: "Achievements") {
                        achievementsScroll
                    }
                    .padding(.bottom)
                }
            }.overlay(content: {
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
            .onAppear {
                factionName()
                viewModel.getUser()
            }
        }
    }
    
    
    // MARK: - Accesory Views
    
    func factionName() {
        switch viewModel.profile.factionId {
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
    
    var topPlaysScroll: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(top, id: \.self) { topPlays in
                    printTopPlays(topPlay: topPlays, points: arrayPoints.randomElement() ?? 0)
                }
            }
        }
    }
    
    var achievementsScroll: some View {
        ScrollView {
            LazyVStack {
                ForEach(trophys, id: \.self) { trophy in
                    printAchievements(numTrophys: trophy)
                }
            }
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.ui.popUpColor
                .ignoresSafeArea()
            UserProfileView(show: .constant(true))
        }
    }
}
