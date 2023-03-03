//
//  FactionsSelectionView.swift
//  Crypt Creeper
//
//  Created by Diego Moreno on 27/2/23.
//

import SwiftUI

struct UserModel {
    let username: String
    let email: String
    let password: String
    var factionId: Int
    let profilePic: UIImage?
    
    init() {
        self.username = ""
        self.email = ""
        self.profilePic = UIImage()
        self.password = ""
        self.factionId = 1
    }
    
    init(username: String, email: String, password: String, factionId: Int, profilePic: UIImage?) {
        self.username = username
        self.email = email
        self.password = password
        self.factionId = factionId
        self.profilePic = profilePic
    }
}

struct FactionsView: View {
    
    @State var userModel: UserModel = .init()
    
    @ObservedObject var viewModel: SignUpViewModel = SignUpViewModel()

    
    var body: some View {
        ZStack {
            Color.ui.popUpColor
                .ignoresSafeArea()
            // Ghost
            VStack {
                HStack {
                    popUp(image: "Ghost", title: "Ghost", id: 1)
                        .onTapGesture {
                            userModel.factionId = 1
                            viewModel.signUp(userModel) { result in
                                switch result {
                                    case .success(let message):
                                        self.viewModel.message = message
                                        viewModel.onSuccess(message: message)
                                    case .failure(let error):
                                        self.viewModel.message = error.localizedDescription
                                        viewModel.onError(error: error.localizedDescription)
                                    }
                            }
                        }
                    Spacer()
                }
                Spacer()
            }
            // Hans
            VStack {
                HStack {
                    popUp(image: "Hans", title: "Hans", id: 2)
                }
                .padding(.leading, 30)
                Spacer()
            }
            .onTapGesture {
                userModel.factionId = 2
                viewModel.signUp(userModel) { result in
                    switch result {
                        case .success(let message):
                            self.viewModel.message = message
                            viewModel.onSuccess(message: message)
                        case .failure(let error):
                            self.viewModel.message = error.localizedDescription
                            viewModel.onError(error: error.localizedDescription)
                        }
                }
            }
            .padding(.top, 60)
            ZStack {
                // Mosca
                VStack {
                    HStack {
                        popUp(image: "Mosca", title: "Mosca", id: 3)
                        Spacer()
                    }
                }
                .onTapGesture {
                    userModel.factionId = 3
                    //viewModel.postUser(userModel: userModel)
                }
                .padding(.top, 160)
                // Double Double
                VStack {
                    HStack {
                        popUp(image: "Double_double", title: "Double2", id: 4)
                    }
                    Spacer()
                }
                .onTapGesture {
                    userModel.factionId = 4
                    //viewModel.postUser(userModel: userModel)
                }
                .padding(.top, 280)
                // Uzzi
                VStack {
                    HStack {
                        Spacer()
                        popUp(image: "Uzzi", title: "Uzzi", id: 5)
                    }
                    .padding(.leading, 30)
                    Spacer()
                }
                .onTapGesture {
                    userModel.factionId = 5
                    //viewModel.postUser(userModel: userModel)
                }
                .padding(.top, 170)
            }
            ZStack {
                // Tia
                VStack {
                    Spacer()
                    HStack {
                        popUp(image: "Tía", title: "Tia", id: 6)
                        Spacer()
                    }
                    .padding(.leading, -10)
                }
                .onTapGesture {
                    userModel.factionId = 6
                    //viewModel.postUser(userModel: userModel)
                }
                .padding(.bottom, 70)
                // King Eyes
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        popUp(image: "Kingeyes", title: "   KEyes", id: 7)
                        
                    }
                }
                .onTapGesture {
                    userModel.factionId = 7
                    //viewModel.postUser(userModel: userModel)
                }
                // Big Mud
                VStack {
                    Spacer()
                    HStack {
                        popUp(image: "Big_mud", title: "Big Mud", id: 8)
                    }
                    .padding(.trailing, 30)
                }
                .onTapGesture {
                    userModel.factionId = 8
                    //viewModel.postUser(userModel: userModel)
                }
                .padding(.bottom, 20)
            }
        }
        .navigationBarBackButtonHidden()
    }
}

struct FactionsSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        FactionsView()
    }
}
