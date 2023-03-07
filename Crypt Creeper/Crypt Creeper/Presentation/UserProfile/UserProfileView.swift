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
    
    
    // MARK: - Body
    
    var body: some View {
        if show {
            ZStack {
                PopUpsView(title: "(USERNAME) Profile",bodyContent:{
                    VStack(spacing: 0) {
                        HStack(spacing: 0) {
                            profilePicture
                            factionImage
                        }
                        PopUpsView(title: "Top Plays") {
                            topPlaysScroll
                        }
                        .frame(height: 230)
                        PopUpsView(title: "Achievements") {
                            achievementsScroll
                        }
                    }
                }).overlay(content: {
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
    
    
    // MARK: - Accesory Views
    
    var profilePicture: some View {
        PopUpsView(title: "PFP") {
            // TODO: - Cuando esté el backend poner la foto del usuario
            ImageFromAssets(image: "Ghost")
        }
    }
    
    var factionImage: some View {
        PopUpsView(title: "Tia") {
            ImageFromAssets(image: "Tía")
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
