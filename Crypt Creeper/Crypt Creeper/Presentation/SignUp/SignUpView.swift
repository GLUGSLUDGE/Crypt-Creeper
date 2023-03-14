//
//  SignUpView.swift
//  Crypt Creeper
//
//  Created by Diego Moreno on 22/2/23.
//

import SwiftUI
import UIKit

struct SignUpView: View {
    
    
    // MARK: - Properties
    
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State var selectedImage: UIImage?
    @State var isImagePickerDisplay = false
    
    @ObservedObject var viewModel: ViewModel = ViewModel()
    
    @Environment(\.dismiss) var dismiss
    
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            Color.ui.popUpColor
                .ignoresSafeArea()
            VStack {
                HStack {
                    Spacer()
                    loginButtonView
                }
                ZStack {
                    // MARK: - Sign Up Form Stack
                    VStack {
                        HStack {
                            signUpPopUp()
                            Spacer()
                        }
                        Spacer()
                    }
                    // MARK: - Profile Pic Stack
                    VStack {
                        Spacer()
                        HStack {
                            profilePic
                            Spacer()
                            selectImage
                        }
                    }
                }
                // MARK: - Button Stack
                HStack {
                    Spacer()
                    signUpButton
                }
            }
        }
        .sheet(isPresented: $isImagePickerDisplay) {
            ImagePickerView(selectedImage: self.$viewModel.profilePic, sourceType: self.sourceType)
        }
        .navigationBarBackButtonHidden()
    }
    
    
    // MARK: - Accessory Views
    
    var loginButtonView: some View {
        PopUpsView(title: "Login") {
            HStack {
                Button {
                    dismiss.callAsFunction()
                } label: {
                    Image("Hans")
                        .resizable()
                        .scaledToFit()
                        .padding(.bottom, 5)
                    BoldText(title: "CLICK HERE IF YOU ARE NOT NEW!!!", fontSize: 30)
                        .foregroundColor(Color.ui.text)
                        .multilineTextAlignment(.leading)
                }
            }
        }
        .frame(width: 300, height: 170)
    }
    
    var profilePic: some View {
        PopUpsView(title: "Pic") {
            ImageFromUi(image: viewModel.profilePic) {
            }
        }
        .padding(.top, 50)
    }
    
    var selectImage : some View {
        PopUpsView(title: "Profile Pic") {
            HStack {
                VStack {
                    galleryImage {
                        self.sourceType = .photoLibrary
                        self.isImagePickerDisplay.toggle()
                    }
                    ThinText(title: "Gallery", fontSize: 30)
                        .foregroundColor(Color.white)
                }
                VStack {
                    cameraImage {
                        self.sourceType = .camera
                        self.isImagePickerDisplay.toggle()
                    }
                    ThinText(title: "Camera", fontSize: 30)
                        .foregroundColor(Color.white)
                }
            }
        }
        .frame(width: 250)
    }
    
    var signUpButton: some View {
        Button {
            
            viewModel.userModel = .init(username: viewModel.username,
                                        email: viewModel.email,
                                        password: viewModel.password,
                                        factionId: viewModel.factionId,
                                        profilePic: viewModel.profilePic ?? UIImage())
            viewModel.isRegistered = true
            
        } label: {
            MiniButtonLabel(title: "Continue", fontSize: 30, widthSize: 2.5, heightSize: 11.5)
        }
        .padding(.bottom, 5)
        .padding(.trailing, 35)
        .background {
            NavigationLink("", destination: FactionsView(userModel: viewModel.userModel), isActive: $viewModel.isRegistered)
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
