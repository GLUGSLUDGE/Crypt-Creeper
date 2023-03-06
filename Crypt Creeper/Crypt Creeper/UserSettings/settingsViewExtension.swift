//
//  settingsViewExtension.swift
//  Crypt Creeper
//
//  Created by Osasu sanchez on 5/3/23.
//


import SwiftUI

extension SettingsView{
    
    
    func changeName(shows: Binding<Bool>) -> some View {
        VStack{
            if shows.wrappedValue{
                PopUpsView(title: "CHANGE NAME",canHide:true,bodyContent: {
                    VStack {
                        HStack {
                            ThinText(title: "Username:",fontSize: 30)
                                .foregroundColor(Color.ui.text)
                                .padding(.bottom, 10)
                                .padding(.leading, 20)
                            Spacer()
                        }
                        HStack {
                            TextFieldLabel(field: $viewModel.userName)
                                .padding(.bottom,20)
                                .padding(.horizontal, 20)
                            Spacer()
                        }
                        Button {
                            
                            shows.wrappedValue.toggle()
                           
                            self.viewModel.ChangeName { result in
                                switch result {
                                case .success(let message):
                                    print(message)
                                    self.viewModel.message = message
                                    self.viewModel.showAlet1.toggle()
                                    self.viewModel.userName = ""
                                   
                                case .failure(let error):
                                    self.viewModel.message = error.localizedDescription
                                    self.viewModel.showAlet1.toggle()
                                    self.viewModel.userName = ""
                                    print(error)
                                }
                            }
                        } label: {
                            MiniButtonLabel(title: "COMFIRM", fontSize: 20, widthSize: 3,heightSize: 20)
                                .padding(.bottom,20)
                                .padding(.leading,85)
                        }
                    }
                })
                .frame(width: 300, height: 300)
            }
        }
    }
    func changePass(shows: Binding<Bool>) -> some View {
        VStack{
            if shows.wrappedValue{
                PopUpsView(title: "CHANGE PASSWORD",bodyContent: {
                    VStack(alignment: .leading, spacing: 0){
                        ThinText(title: "OLD PASSWORD:", fontSize: 20)
                            .foregroundColor(Color.white)
                            .padding(.leading,20)
                        PasswordField(field: $viewModel.pass)
                            .textContentType(.password)
                            .padding(.horizontal, 20)
                        ThinText(title: "NEW PASSWORD:", fontSize: 20)
                            .foregroundColor(Color.white)
                            .padding(.leading,20)
                        PasswordField(field: $viewModel.newPass)
                            .padding(.horizontal, 20)
                        
                        ThinText(title: "REPIT NEW PASSWORD:", fontSize: 20)
                            .foregroundColor(Color.white)
                            .padding(.leading,20)
                        PasswordField(field: $viewModel.repitNewPass)
                            .padding(.horizontal, 20)
                        Button {
                            shows.wrappedValue.toggle()
                            self.viewModel.changePassword() { result in
                                switch result {
                                case .success(let message):
                                    self.viewModel.message = message
                                    self.viewModel.showAlet1.toggle()
                                    self.viewModel.pass = ""
                                    self.viewModel.newPass = ""
                                    self.viewModel.repitNewPass = ""
                                case .failure(let error):
                                    self.viewModel.message = error.localizedDescription
                                    self.viewModel.showAlet1.toggle()
                                    self.viewModel.pass = ""
                                    self.viewModel.newPass = ""
                                    self.viewModel.repitNewPass = ""
                                }
                            }
                        } label: {
                            HStack{
                                Spacer()
                                MiniButtonLabel(title: "COMFIRM", fontSize: 20, widthSize: 3, heightSize: 20)
                                    .padding(.trailing,20)
                                    .padding(.top,20)
                                    .padding(.bottom,10)
                            }
                        }
                    }
                }).overlay(content: {
                    VStack{
                        HStack{
                            Spacer()
                            Button {
                                shows.wrappedValue.toggle()
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
                .frame(width: 300, height: 300)
            }
        }
    }
    func changePic(shows: Binding<Bool>) -> some View {
        VStack{
            if shows.wrappedValue{
                PopUpsView(title: "CHANGE PHOTO",bodyContent: {
                    VStack{
                        HStack {
                            VStack {
                                galleryImage {
                                    self.sourceType = .photoLibrary
                                    self.shouldShowImagePicker.toggle()
                                        // Abrir galería
                                    }
                                ThinText(title: "Gallery",fontSize: 30)
                                    .foregroundColor(Color.white)
                            }
                            VStack {
                                cameraImage {
                                    self.shouldShowImagePicker.toggle()
                                    self.sourceType = .camera
                                }
                                ThinText(title: "Camera",fontSize: 30)
                                    .foregroundColor(Color.white)
                            }
                        }
                        if let image = viewModel.profile_pic {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 143, height: 143)
                                .cornerRadius(20)
                        } else {
                            
                            Image(systemName: "photo.artframe")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(Color.white)
                                .padding(.horizontal, 10)
                        }
                        Button {
                            shows.wrappedValue.toggle()
                            viewModel.changePhoto { result in
                                switch result {
                                case .success(let message):
                                    self.viewModel.message = message
                                    self.viewModel.showAlet1.toggle()
                                    print(message)
                                case .failure(let error):
                                    self.viewModel.message = error.localizedDescription
                                    self.viewModel.showAlet1.toggle()
                                }
                            }
                        } label: {
                            MiniButtonLabel(title: "COMFIRM", fontSize: 20, widthSize: 3, heightSize: 20)
                        }
                    }
                }).overlay(content: {
                    VStack{
                        HStack{
                            Spacer()
                            Button {
                                shows.wrappedValue.toggle()
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
                .frame(width: 300)
            }
        }
    }
    func logOut() {
        
        viewModel.logOut {result in
            switch result {
            case .success(let message):
                self.viewModel.message = message
                self.viewModel.showAlet1.toggle()
                if message == "closed session"{
                    UserDefaults.standard.removeObject(forKey: "savedToken")
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        withAnimation {
                            if let window = UIApplication.shared.windows.first {
                                window.rootViewController = UIHostingController(rootView: SplashView())
                                window.makeKeyAndVisible()
                            }
                        }
                    }}
                print(message)
            case .failure(let error):
                viewModel.message = error.localizedDescription
            }
        }
    }
    func destryAccount(shows: Binding<Bool>) -> some View {
        VStack{
            if shows.wrappedValue{
                PopUpsView(title: "DESTROY COCOUNT",bodyContent: {
                    VStack {
                        HStack {
                            ThinText(title: "Password:",fontSize: 30)
                                .foregroundColor(Color.ui.text)
                                .padding(.bottom, 10)
                                .padding(.leading, 20)
                            Spacer()
                        }
                        HStack {
                            PasswordField(field: $viewModel.pass)
                                .textContentType(.password)
                                .padding(.horizontal, 20)
                            Spacer()
                        }
                        Button {
                            shows.wrappedValue.toggle()
                            self.viewModel.destryAccount { result in
                                switch result {
                                case .success(let message):
                                    self.viewModel.message = message
                                    self.viewModel.showAlet1.toggle()
                                    self.viewModel.pass = ""
                                    if message == "User Delete"{
                                        UserDefaults.standard.removeObject(forKey: "savedToken")
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                            withAnimation {
                                                if let window = UIApplication.shared.windows.first {
                                                    window.rootViewController = UIHostingController(rootView: SplashView())
                                                    window.makeKeyAndVisible()
                                                }
                                            }
                                        }}
                                case .failure(let error):
                                    self.viewModel.message = error.localizedDescription
                                    self.viewModel.showAlet1.toggle()
                                }
                            }
                        } label: {
                            MiniButtonLabel(title: "DESTROY", fontSize: 20, widthSize: 3,heightSize: 20)
                                .padding(.bottom,20)
                                .padding(.leading,85)
                        }
                    }
                }).overlay(content: {
                    VStack{
                        HStack{
                            Spacer()
                            Button {
                                shows.wrappedValue.toggle()
                            } label: {
                                Image("")
                                    .resizable()
                                    .frame(width: 30,height:30)
                                    .padding(.trailing,15)
                                    .padding(.top,20)
                            }
                        }
                        Spacer()
                    }})
                .frame(width: 300, height: 300)
            }
        }
    }
    
      @ViewBuilder func galleryImage(completion: @escaping () -> ()) -> some View {
          ImageSysName(image: "photo.on.rectangle.angled") {
              completion()
          }
          .foregroundColor(Color.white)
          .rotationEffect(.degrees(-25))
          .padding(.horizontal, 10)
      }
      
      @ViewBuilder func cameraImage(completion: @escaping () -> ()) -> some View {
          ImageSysName(image: "camera") {
              completion()
          }
          .foregroundColor(Color.white)
          .rotationEffect(.degrees(25))
          .padding(.horizontal, 10)
      }



}
