//
//  FactionsSelectionView.swift
//  Crypt Creeper
//
//  Created by Diego Moreno on 27/2/23.
//

import SwiftUI

struct FactionsView: View {
    
    
    @State var userModel: UserModel = .init()
    
    @ObservedObject var viewModel: ViewModel = ViewModel()
    
    @Environment(\.dismiss) var dismiss

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
                            
                            viewModel.signUp(user: userModel) { result, error in
                                if let message = result {
                                    viewModel.onSuccess(message: message)
                                }else if let error = error {
                                    //  self.viewModel.message = error.customLocalizedDescription
                                    self.viewModel.onError(error: error.customLocalizedDescription)
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
                        .onTapGesture {
                            userModel.factionId = 2
                            viewModel.signUp(user: userModel) {  result, error in
                                if let message = result {
                                    viewModel.onSuccess(message: message)
                                }else if let error = error {
                                    //  self.viewModel.message = error.customLocalizedDescription
                                    self.viewModel.onError(error: error.customLocalizedDescription)
                                    backToLogin()
                                }
                            }
                        }
                }
                .padding(.leading, 30)
                Spacer()
            }
            
            .padding(.top, 60)
            ZStack {
                // Mosca
                VStack {
                    HStack {
                        popUp(image: "Mosca", title: "Mosca", id: 3)
                            .onTapGesture {
                                userModel.factionId = 3
                                viewModel.signUp(user: userModel) {  result, error in
                                    if let message = result {
                                        viewModel.onSuccess(message: message)
                                    }else if let error = error {
                                        //  self.viewModel.message = error.customLocalizedDescription
                                        self.viewModel.onError(error: error.customLocalizedDescription)
                                        backToLogin()
                                    }
                                }
                            }
                        Spacer()
                    }
                }
                
                .padding(.top, 160)
                // Double Double
                VStack {
                    HStack {
                        popUp(image: "Double_double", title: "Double2", id: 4)
                            .onTapGesture {
                                userModel.factionId = 4
                                viewModel.signUp(user: userModel) {result, error in
                                    if let message = result {
                                        viewModel.onSuccess(message: message)
                                    }else if let error = error {
                                        //  self.viewModel.message = error.customLocalizedDescription
                                        self.viewModel.onError(error: error.customLocalizedDescription)
                                        backToLogin()
                                    }
                                }
                            }
                    }
                    Spacer()
                }
                
                .padding(.top, 280)
                // Uzzi
                VStack {
                    HStack {
                        Spacer()
                        popUp(image: "Uzzi", title: "Uzzi", id: 5)
                            .onTapGesture {
                                userModel.factionId = 5
                                viewModel.signUp(user: userModel) { result, error in
                                    if let message = result {
                                        viewModel.onSuccess(message: message)
                                    }else if let error = error {
                                        //  self.viewModel.message = error.customLocalizedDescription
                                        self.viewModel.onError(error: error.customLocalizedDescription)
                                        backToLogin()
                                    }
                                }
                            }
                    }
                    .padding(.leading, 30)
                    Spacer()
                }
                .padding(.top, 170)
            }
            ZStack {
                // Tia
                VStack {
                    Spacer()
                    HStack {
                        popUp(image: "Tía", title: "Tia", id: 6)
                            .onTapGesture {
                                userModel.factionId = 6
                                viewModel.signUp(user: userModel) { result, error in
                                    if let message = result {
                                        viewModel.onSuccess(message: message)
                                    }else if let error = error {
                                        //  self.viewModel.message = error.customLocalizedDescription
                                        self.viewModel.onError(error: error.customLocalizedDescription)
                                        backToLogin()
                                    }
                                }
                            }
                        Spacer()
                    }
                    .padding(.leading, -10)
                }
                .padding(.bottom, 70)
                // King Eyes
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        popUp(image: "Kingeyes", title: "   KEyes", id: 7)
                            .onTapGesture {
                                userModel.factionId = 7
                                viewModel.signUp(user: userModel) {result, error in
                                    if let message = result {
                                        viewModel.onSuccess(message: message)
                                    }else if let error = error {
                                        //  self.viewModel.message = error.customLocalizedDescription
                                        self.viewModel.onError(error: error.customLocalizedDescription)
                                        backToLogin()
                                    }
                                }
                            }
                    }
                }
                
                // Big Mud
                VStack {
                    Spacer()
                    HStack {
                        popUp(image: "Big_mud", title: "Big Mud", id: 8)
                            .onTapGesture {
                                userModel.factionId = 8
                                viewModel.signUp(user: userModel) {result, error in
                                    if let message = result {
                                        viewModel.onSuccess(message: message)
                                    }else if let error = error {
                                        //  self.viewModel.message = error.customLocalizedDescription
                                        self.viewModel.onError(error: error.customLocalizedDescription)
                                        backToLogin()
                                    }
                                }
                            }
                    }
                    .padding(.trailing, 30)
                }
                .padding(.bottom, 20)
                
            }
            .alertCustom(title: viewModel.alertTitle, message: viewModel.alertMessage, show: $viewModel.formError)
        }
        .navigationBarBackButtonHidden()
    }
}

struct FactionsSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        FactionsView()
    }
}
