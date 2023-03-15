//
//  UserProfileView.swift
//  Crypt Creeper
//
//  Created by Diego Moreno on 6/3/23.
//

import SwiftUI

struct UserProfileView: View {
    
    
    // MARK: - Properties
    
    @Binding var show: Bool
    
    @ObservedObject var viewModel: ViewModel = ViewModel()
    
    
    // MARK: - Body
    
    var body: some View {
        if show {
            ZStack {
                PopUpsView(title: "\(viewModel.profile.name)'s Profile", bodyContent:{
                    Spacer()
                })
                .padding(.horizontal, 8)
                VStack {
                    HStack(spacing: 0) {
                        PopUpsView(title: "PFP") {
                            AsyncImage(url: URL(string: "\(viewModel.profile.image)")) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                case .success(let image):
                                    image.resizable()
                                        .aspectRatio(contentMode: .fit)
                                case .failure:
                                    Image(systemName: "photo")
                                default:
                                    EmptyView()
                                }
                            }
                        }
                        .padding(.top, 40)
                        PopUpsView(title: viewModel.facTitle) {
                            ImageFromAssets(image: viewModel.facImage)
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
                viewModel.getUser()
                viewModel.getUserPoints()
            }
        }
    }
    
    
    // MARK: - Accesory Views
    
    var topPlaysScroll: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(Array(viewModel.userPoints.enumerated()), id: \.offset) { index, userPoints in
                    printTopPlays(topPlay: index+1, points: userPoints)
                }
            }
        }
    }
    
    var achievementsScroll: some View {
        ScrollView {
            LazyVStack {
                achievements(image: "ICON_ENTITY_PLAYER", title: "Hi-Score", desc: "Obtain a 6 digit score")
                achievements(image: "ICON_ENEMY_8", title: "Almost get it", desc: "Be defeated by the boss")
                achievements(image: "ICON_C_SLOT", title: "Deep pockets", desc: "Reach three inventory slots")
                achievements(image: "ICON_ENTITY_SHOP", title: "Pension plan", desc: "Get 100 coins")
                achievements(image: "ICON_ENTITY_PORTAL", title: "Cleaner", desc: "Leave an empty floor")
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
