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
    
    @ObservedObject var viewModel: SignUpViewModel = SignUpViewModel()
    
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
                    signUpButton()
                }
            }
        }
        .alertCustom(title: viewModel.alertTitle, message: viewModel.alertMessage, show: $viewModel.showAlert)
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
                    BoldText(title: "CLICK HERE IF YOU ARE NOT NEW!!!")
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
        .onAppear {
            
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

//class Base64 {
//    static let shared = Base64()
//    func convertImageToBase64(image: UIImage) -> String {
//        let compressedImage = compressImage(image: image, quality: 0.5) // Calidad deseada
//        let base64String = compressedImage?.base64EncodedString() ?? ""
//        return base64String
//    }
//
//    private func compressImage(image: UIImage, quality: CGFloat) -> Data? {
//        return image.jpegData(compressionQuality: quality)
//    }
//}
