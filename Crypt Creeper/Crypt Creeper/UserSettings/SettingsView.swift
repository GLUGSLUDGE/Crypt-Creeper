//
//  SettingsView.swift
//  Crypt Creeper
//
//  Created by Osasu sanchez on 17/2/23.
//

import SwiftUI

struct Settings: View{
    @State var ver = true
    var body: some View{
        SettingsView(show: $ver)
    }
}

struct SettingsView: View {
    @ObservedObject var viewModel = SettingsViewModel()
    @State var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State var shouldShowImagePicker = false
    @State var image: UIImage?
    @Binding var show : Bool
    
    var body: some View {
        if show{
            ZStack{
                VStack{
                    PopUpsView(title: "User Settings",canHide: true) {
                        VStack(spacing: 10){
                            HStack{
                                BoldText(title: "USER OPTIONS", fontSize: 30)
                                    .foregroundColor(Color.white)
                                    .multilineTextAlignment(.leading)
                                    .padding(.leading,15)
                                    .padding(.top,10)
                                Spacer()
                            }
                            Button {
                                //Cambiar NOMBRE
                                viewModel.showCN.toggle()
                            } label: {
                                
                                MiniButtonLabel(title: "CHANGE NAME", fontSize: 30, widthSize: 1.2,heightSize: 11.5)
                            }
                            Button {
                                viewModel.showCP.toggle()
                            } label: {
                                
                                MiniButtonLabel(title: "CHANGE PASSWORD", fontSize: 30, widthSize: 1.2,heightSize: 11.5)
                            }
                            Button {
                                viewModel.showCPic.toggle()
                                
                            } label: {
                                
                                MiniButtonLabel(title: "CHANGE PERFIL PICTURE", fontSize: 30, widthSize: 1.2,heightSize: 11.5)
                            }
                            HStack(spacing:10){
                                Button {
                                    viewModel.showDestry.toggle()
                                } label: {
                                    MiniButtonLabel(title: "DESTRY\nACCOUNT?", fontSize: 30, widthSize: 2.5,heightSize: 11.5)
                                        .multilineTextAlignment(.leading)
                                        .padding(.bottom,20)
                                }
                                Button {
                                    //  CERRAR SEION
                                    logOut()
                                } label: {
                                    MiniButtonLabel(title: "LOG OUT", fontSize: 30, widthSize: 2.5, heightSize: 11.5)
                                        .padding(.bottom,20)
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                    soundView()
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
                changeName(shows: $viewModel.showCN)
                changePass(shows: $viewModel.showCP)
                changePic(shows: $viewModel.showCPic)
                destryAccount(shows:$viewModel.showDestry)
            }
            .sheet(isPresented: $shouldShowImagePicker) {
                ImagePickerView(selectedImage: $viewModel.profile_pic, sourceType: self.sourceType)
            }
            .alertCustom(title: "", message: viewModel.message, show: $viewModel.showAlet1)
            .padding(.vertical,50)
            .padding(.bottom,20)
        }
        
    }
    
}



func soundView()->some View {
    
    ZStack{
        VStack{
            PopUpsView(title:"Sound Settings",canHide: false,bodyContent: {
                VStack(alignment: .leading,spacing:5){
                    BoldText(title: "SOUND", fontSize: 30)
                        .foregroundColor(Color.white)
                        .padding(.leading,20)
                        .padding(.vertical,5)
                    HStack{
                        VStack(alignment: .leading){
                            BoldText(title: "SFX:", fontSize: 30)
                                .foregroundColor(Color.white)
                            
                            Button {
                                //speaker.slash.fillCambiar NOMBRE
                            } label: {
                                Rectangle()
                                    .frame(width:110,height: 70)
                                    .padding(.bottom)
                                    .foregroundColor(Color.white)
                                    .overlay {
                                        Image(systemName: "speaker.wave.3")
                                            .resizable()
                                            .foregroundColor(Color.ui.popUpColor)
                                            .frame(width: 70,height: 50)
                                            .padding(.bottom,15)
                                    }
                            }
                        }
                        Spacer()
                        VStack(alignment: .leading){
                            BoldText(title: "MUSIC:", fontSize: 30)
                                .foregroundColor(Color.white)
                            
                            Button {
                                //
                            } label: {
                                Rectangle()
                                    .frame(width:110,height: 70)
                                    .padding(.bottom)
                                    .foregroundColor(Color.white)
                                    .overlay {
                                        Image(systemName: "speaker.slash.fill")
                                            .resizable()
                                            .foregroundColor(Color.ui.popUpColor)
                                            .frame(width: 70,height: 50)
                                            .padding(.bottom,15)
                                    }
                            }
                        }
                    }
                    .padding(.horizontal,20)
                }
            })
            .padding(.horizontal)
        }
    }
}
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.ui.popUpColor
                .ignoresSafeArea()
            Settings()
        }
        
    }
}

