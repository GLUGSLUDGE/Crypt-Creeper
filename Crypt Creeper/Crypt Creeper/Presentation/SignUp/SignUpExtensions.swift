//
//  SignUpExtensions.swift
//  Crypt Creeper
//
//  Created by Diego Moreno on 25/2/23.
//

import SwiftUI

struct GalleryImageView: View {
    var completion: () -> ()
    var body: some View {
        ImageSysName(image: "photo.on.rectangle.angled") {
            completion()
        }
        .foregroundColor(Color.white)
        .rotationEffect(.degrees(-25))
        .padding(.horizontal, 10)
    }
}

struct CameraImageView: View {
    var completion: () -> ()
    var body: some View {
        ImageSysName(image: "camera") {
            completion()
        }
        .foregroundColor(Color.white)
        .rotationEffect(.degrees(25))
        .padding(.horizontal, 10)
    }
}

extension SignUpView {
    
    func signUpPopUp() -> some View {
        PopUpsView(title: "SIGN UP") {
            textfieldsViews
        }
        .frame(width: 300)
    }
    
    var textfieldsViews: some View {
        VStack(spacing: 10) {
            VStack(alignment: .leading, spacing: 0) {
                ThinText(title: "Username:")
                    .foregroundColor(Color.ui.text)
                    .padding(.leading, 20)
                
                TextFieldLabel(field: $viewModel.username)
                    .padding(.horizontal, 20)
            }
            VStack(alignment: .leading, spacing: 0) {
                ThinText(title: "Email:")
                    .foregroundColor(Color.ui.text)
                    .padding(.leading, 20)
                
                TextFieldLabel(field: $viewModel.email)
                    .padding(.horizontal, 20)
            }
            VStack(alignment: .leading, spacing: 0) {
                ThinText(title: "Password:")
                    .foregroundColor(Color.ui.text)
                    .padding(.leading, 20)
                
                PasswordField(field: $viewModel.password)
                    .padding(.leading, 20)
                    .padding(.trailing, 120)
            }
            
            VStack(alignment: .leading, spacing: 0) {
                ThinText(title: "Repeat password:")
                    .foregroundColor(Color.ui.text)
                    .padding(.leading, 20)
                
                PasswordField(field: $viewModel.repeatPassword)
                    .padding(.leading, 20)
                    .padding(.trailing, 120)
                    .padding(.bottom, 30)
            }
        }
    }
    
    func signUpForm(titleText: String, paddingTextEdge: Edge.Set, paddingFieldEdge: Edge.Set, paddingTextSize: CGFloat, paddingFieldSize: CGFloat, feidl: Binding<String>) -> some View {
        VStack(alignment: .leading, spacing: 0) {
            ThinText(title: titleText)
                .foregroundColor(Color.ui.text)
                .padding(paddingTextEdge, paddingTextSize)
            
            TextFieldLabel(field: feidl)
                .padding(paddingFieldEdge, paddingFieldSize)
        }
    }
    
    var selectImage : some View {
        PopUpsView(title: "Profile Pic") {
            HStack {
                VStack {
                    GalleryImageView {
                        self.sourceType = .photoLibrary
                        self.isImagePickerDisplay.toggle()
                    }
                    ThinText(title: "Gallery")
                        .foregroundColor(Color.white)
                }
                VStack {
                    CameraImageView {
                        self.sourceType = .photoLibrary
                        self.isImagePickerDisplay.toggle()
                    }
                    ThinText(title: "Camera")
                        .foregroundColor(Color.white)
                }
            }
        }
        .frame(width: 250)
    }
    
    func signUpButton() -> some View {
        Button {
            if viewModel.username.isEmpty || viewModel.email.isEmpty || viewModel.password.isEmpty || viewModel.repeatPassword.isEmpty {
                viewModel.alertTitle = "There are empty fields"
                viewModel.showAlert = true
            } else if viewModel.profilePic == nil {
                viewModel.alertTitle = "Empty pic"
                viewModel.alertMessage = "Select an image to continue"
                viewModel.showAlert = true
            } else {
                viewModel.userModel = .init(username: viewModel.username,
                                            email: viewModel.email,
                                            password: viewModel.password,
                                            factionId: viewModel.factionId,
                                            profilePic: viewModel.profilePic ?? UIImage())
                viewModel.isRegistered = true
            }
        } label: {
            MiniButtonLabel(title: "Sign Up")
        }
        .padding(.bottom, 5)
        .padding(.trailing, 35)
        .background {
            NavigationLink("", destination: FactionsView(userModel: viewModel.userModel), isActive: $viewModel.isRegistered)
        }
    }
}
