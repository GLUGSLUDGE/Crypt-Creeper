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
    @State var shouldShowImagePicker = false
    @State var image: UIImage?
    @Binding var show : Bool
    
    var body: some View {
        if show{
            ZStack{
                VStack{
                    PopUpsView(bodyContent: {
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
                                   
                                    viewModel.showLogOut.toggle()
                                      logOut(bool: viewModel.showLogOut)
                                    
                                } label: {
                                    MiniButtonLabel(title: "LOG OUT", fontSize: 30, widthSize: 2.5, heightSize: 11.5)
                                        .padding(.bottom,20)
                                }
                            }
                        }
                    }, title: "User Settings ", show:true)
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
            .padding(.vertical,50)
            
            //            .navigationViewStyle(StackNavigationViewStyle())
            //            .fullScreenCover(isPresented: $shouldShowImagePicker, onDismiss: nil) {
            //                ImagePicker(image: $viewModel.profile_pic)
            //                    .ignoresSafeArea()
            //            }
        }
            
    }
        
    
}
func soundView()->some View {
    
    ZStack{
        VStack{
            PopUpsView(bodyContent: {
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
            }, title: "Sound Settings", show: true)
        }
    }
}


extension SettingsView{
    
    func changeName(shows: Binding<Bool>) -> some View {
        VStack{
            if shows.wrappedValue{
                PopUpsView(bodyContent: {
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
                                    self.viewModel.message = message
                                    self.viewModel.userName = ""
                                case .failure(let error):
                                    self.viewModel.message = error.localizedDescription
                                }
                            }
                        } label: {
                            MiniButtonLabel(title: "COMFIRM", fontSize: 20, widthSize: 3,heightSize: 20)
                                .padding(.bottom,20)
                                .padding(.leading,85)
                        }
                    }
                }, title: "CHANGE NAME", show: true).overlay(content: {
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
    
    func changePass(shows: Binding<Bool>) -> some View {
        VStack{
            if shows.wrappedValue{
                PopUpsView(bodyContent: {
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
                            self.viewModel.changePassword { result in
                                switch result {
                                case .success(let message):
                                    print(message)
                                case .failure(let error):
                                    print(error.localizedDescription)
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
                }, title: "CHANGE PASSWORD", show: true).overlay(content: {
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
                
                PopUpsView(bodyContent: {
                    VStack{
                        HStack {
                            VStack {
                                Image(systemName: "photo.on.rectangle.angled")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor(Color.white)
                                    .rotationEffect(.degrees(-25))
                                    .padding(.horizontal, 10)
                                    .onTapGesture {
                                        // Abrir galería
                                    }
                                ThinText(title: "Gallery",fontSize: 30)
                                    .foregroundColor(Color.white)
                            }
                            VStack {
                                Button {
                                   shouldShowImagePicker.toggle()
                                } label: {
                                    Image(systemName: "camera")
                                        .resizable()
                                        .scaledToFit()
                                        .foregroundColor(Color.white)
                                        .rotationEffect(.degrees(25))
                                        .padding(.horizontal, 10)
                                    
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
                                .cornerRadius(80)
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
                                    print(message)
                                case .failure(let error):
                                    self.viewModel.message = error.localizedDescription
                                }
                            }
                        } label: {
                            MiniButtonLabel(title: "COMFIRM", fontSize: 20, widthSize: 3, heightSize: 20)
                        }
                    }
                }, title: "CHANGE PHOTO", show: true).overlay(content: {
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
            //                .navigationViewStyle(StackNavigationViewStyle())
            //                .fullScreenCover(isPresented: settingsView.$shouldShowImagePicker, onDismiss: nil) {
            //                    ImagePicker(image: settingsView.$viewModel.profile_pic)
            //                        .ignoresSafeArea()
            //                }
            //
            //        }
        }
        
    }
    func logOut(bool: Bool) {
        
        if bool {
            viewModel.logOut {result in
                switch result {
                case .success(let message):
                    viewModel.message = message
                    NetworkHelper.shared.setToken(tokens: "")
                    print(message)
                case .failure(let error):
                    viewModel.message = error.localizedDescription
                }

            }

        }
    }
    
    func destryAccount(shows: Binding<Bool>) -> some View {
        VStack{
            if shows.wrappedValue{
                PopUpsView(bodyContent: {
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
                            self.viewModel.ChangeName { result in
                                switch result {
                                case .success(let message):
                                    self.viewModel.message = message
                                    self.viewModel.userName = ""
                                case .failure(let error):
                                    self.viewModel.message = error.localizedDescription
                                }
                            }
                        } label: {
                            MiniButtonLabel(title: "DESTROY", fontSize: 20, widthSize: 3,heightSize: 20)
                                .padding(.bottom,20)
                                .padding(.leading,85)
                        }
                    }
                }, title: "DESTROY COCOUNT", show: true).overlay(content: {
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
}



//                TextField ("nombre" , text: $viewModel.userName)
//                    .multilineTextAlignment(.center)
//                    .frame(height: 50)
//                    .background(Color .gray)
//                    .cornerRadius(20)
//                    .padding(.all , 10)
//                Button {
//                    self.viewModel.ChangeName { result in
//                        switch result {
//                        case .success(let message):
//                            self.viewModel.message = message
//                        case .failure(let error):
//                            self.viewModel.message = error.localizedDescription
//                        }
//                    }
//                }label: {
//                    Text("cambiar nombre")
//                }
//                Spacer()
//
//                Text(viewModel.message)
//
//                VStack{
//
//                    Button {
//                        shouldShowImagePicker.toggle()
//                    } label: {
//                        if let image = viewModel.profile_pic {
//                            Image(uiImage: image)
//                                .resizable()
//                                .scaledToFill()
//                                .frame(width: 143, height: 143)
//                                .cornerRadius(80)
//                        } else {
//
//                            Image(systemName:"person.fill")
//                                .resizable()
//                                .clipShape(Circle())
//                                .frame(width: 150, height: 150)
//                                .overlay(Circle().stroke(Color.blue))
//                        }
//                    }
//                    .overlay(RoundedRectangle(cornerRadius: 80)
//                        .stroke(Color.black, lineWidth: 3))
//
//                    Button {
//                        self.viewModel.changePhoto{result in
//                            switch result {
//                            case .success(let message):
//                                self.viewModel.message = message
//                            case .failure(let error):
//                                self.viewModel.message = error.localizedDescription
//                            }
//                        }
//                    } label: {
//                        Text("cambiar foto")
//                    }
//                    Button {
//                        self.viewModel.logOut{result in
//                                switch result {
//                                case .success(let message):
//                                    self.viewModel.message = message
//                                case .failure(let error):
//                                    self.viewModel.message = error.localizedDescription
//                                }
//                        }
//                    } label: {
//                        Text("cerrar sesion")
//                    }
//
//                }
//
//                Spacer()
//
//
//                TextField ("Contraseña antigua " , text: $viewModel.pass)
//                    .multilineTextAlignment(.center)
//                    .frame(height: 50)
//                    .background(Color .gray)
//                    .cornerRadius(20)
//                    .padding(.all , 10)
//                TextField ("nueva contraseña" , text: $viewModel.newPass)
//                    .multilineTextAlignment(.center)
//                    .frame(height: 50)
//                    .background(Color .gray)
//                    .cornerRadius(20)
//                    .padding(.all , 10)
//
//                TextField ("repetir contraseña" , text: $viewModel.repitNewPass)
//                    .multilineTextAlignment(.center)
//                    .frame(height: 50)
//                    .background(Color .gray)
//                    .cornerRadius(20)
//                    .padding(.all , 10)
//
//                Button {
//                    viewModel.changePassword { result in
//                        switch result {
//                        case .success(let message):
//                            self.viewModel.message = message
//                        case .failure(let error):
//                            self.viewModel.message = error.localizedDescription
//                        }
//                    }
//                } label: {
//                    Text("cambiar contraseña")
//                }
//            }
//





struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color.ui.popUpColor
                .ignoresSafeArea()
            Settings()
        }
        
    }
}

struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var image: UIImage?
    
    private let controller = UIImagePickerController()
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        let parent: ImagePicker
        
        init(parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            parent.image = info[.originalImage] as? UIImage
            picker.dismiss(animated: true)
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true)
        }
        
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        controller.delegate = context.coordinator
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

