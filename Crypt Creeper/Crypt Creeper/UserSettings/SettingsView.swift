//
//  SettingsView.swift
//  Crypt Creeper
//
//  Created by Osasu sanchez on 17/2/23.
//

import SwiftUI


struct SettingsView: View {
    
    @ObservedObject var viewModel = SettingsViewModel()
    @State var shouldShowImagePicker = false
    @State var image: UIImage?
    
    
    var body: some View {
        
        NavigationView{
            ZStack{
                Color.ui.popUpColor
                    .ignoresSafeArea()
                VStack{
                    PopUpsView(bodyContent: {
                        VStack(spacing: 20){
                            BoldText(title: "USER OPTIONS", fontSize: 30)
                                .foregroundColor(Color.white)
                                .padding(.trailing,190)
                                .padding(.top,10)
                            
                            Button {
                                //Cambiar NOMBRE
                                viewModel.showCN.toggle()
                                
                            } label: {
                                ButtonLabel(title: "CHANGE NAME", fontSize: 30)
                            }
                            
                            
                            Button {
                                viewModel.showCP.toggle()
                            } label: {
                                ButtonLabel(title: "CHANGE PASSWORD", fontSize: 30)
                            }
                            
                            Button {
                                viewModel.showCPic.toggle()
                            } label: {
                                ButtonLabel(title: "CHANGE PERFIL PICTURE", fontSize: 30)
                            }
                            HStack(spacing:30){
                                Button {
                                    
                                } label: {
                                    MiniButtonLabel(title: "DESTRY\nACCOUNT?", fontSize: 30, widthSize: 3,heightSize: 11.5)
                                        .multilineTextAlignment(.leading)
                                        .padding(.bottom,20)
                                }
                                
                                Button {
                                    //  CERRAR SEION
                                    viewModel.showLogOut.toggle()
                                    logOut(bool: viewModel.showLogOut)
                                    
                                } label: {
                                    MiniButtonLabel(title: "LOG OUT", fontSize: 30, widthSize: 3, heightSize: 11.5)
                                        .padding(.bottom,20)
                                }
                            }
                        }
                    }, title: "User Settings ", show:true)
                    
                   soundView()
                   
                }
                changeName(show: $viewModel.showCN)
                changePass(show: $viewModel.showCP)
                changePic(show: $viewModel.showCPic)
            }
            
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
        Color.ui.popUpColor
            .ignoresSafeArea()
        VStack{
            PopUpsView(bodyContent: {
                VStack(alignment: .leading,spacing:5){
                    BoldText(title: "SOUND", fontSize: 30)
                        .foregroundColor(Color.white)
                        .padding(.leading,20)
                        .padding(.top,10)
                    HStack{
                        VStack(alignment: .leading){
                            BoldText(title: "SFX:", fontSize: 30)
                                .foregroundColor(Color.white)
                            
                                .padding(.top,10)
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
                                .padding(.top,10)
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
                    .padding(.horizontal,20)
                }
            }, title: "Sound Settings", show: true)
        }
    }
}
        
        

               
struct changeName : View{
    @Binding  var show : Bool
    @State var settingsView = SettingsView()
    var body: some View {
        if show{
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
                        TextFieldLabel(field: settingsView.$viewModel.userName)
                            .padding(.bottom,20)
                            .padding(.horizontal, 20)
                        Spacer()
                    }
                    Button {
                        show.toggle()
                        self.settingsView.viewModel.ChangeName { result in
                            switch result {
                            case .success(let message):
                                self.settingsView.viewModel.message = message
                                self.settingsView.viewModel.userName = ""
                            case .failure(let error):
                                self.settingsView.viewModel.message = error.localizedDescription
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
            .frame(width: 300, height: 300)
            .padding(.bottom, 100)
            
        }
    }
}

struct changePass: View{
    @Binding var show : Bool
    @State var settingsView = SettingsView()
    
    var body: some View{
        if show{
            PopUpsView(bodyContent: {
                VStack(alignment: .leading, spacing: 0){
                    ThinText(title: "OLD PASSWORD:", fontSize: 20)
                        .foregroundColor(Color.white)
                        .padding(.leading,20)
                    PasswordField(field: settingsView.$viewModel.pass)
                        .textContentType(.password)
                        .padding(.horizontal, 20)
                    ThinText(title: "NEW PASSWORD:", fontSize: 20)
                        .foregroundColor(Color.white)
                        .padding(.leading,20)
                    PasswordField(field: settingsView.$viewModel.newPass)
                    
                        .padding(.horizontal, 20)
                    
                    ThinText(title: "REPIT NEW PASSWORD:", fontSize: 20)
                        .foregroundColor(Color.white)
                        .padding(.leading,20)
                    PasswordField(field: settingsView.$viewModel.repitNewPass)
                    
                    
                        .padding(.horizontal, 20)
                    
                    
                    Button {
                        show.toggle()
                        self.settingsView.viewModel.changePassword { result in
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
            .frame(width: 300, height: 300)
        }
    }
}
struct changePic : View{
    @Binding var show: Bool
    @State var settingsView = SettingsView()
    var body: some View {
        
        if show{
            
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
                                settingsView.shouldShowImagePicker.toggle()
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
                    if let image = settingsView.viewModel.profile_pic {
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
                        show.toggle()
                        settingsView.viewModel.changePhoto { result in
                            switch result {
                            case .success(let message):
                                print(message)
                            case .failure(let error):
                                self.settingsView.viewModel.message = error.localizedDescription
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
            .frame(width: 300)
        }
        //                .navigationViewStyle(StackNavigationViewStyle())
        //                .fullScreenCover(isPresented: settingsView.$shouldShowImagePicker, onDismiss: nil) {
        //                    ImagePicker(image: settingsView.$viewModel.profile_pic)
        //                        .ignoresSafeArea()
        //                }
        //
        //        }
        
        
    }}

func logOut(bool: Bool) {
    @State var settingsView = SettingsView()
    if bool {
        settingsView.viewModel.logOut {result in
            switch result {
            case .success(let message):
                settingsView.viewModel.message = message
                NetworkHelper.shared.setToken(tokens: "")
                print(message)
            case .failure(let error):
                settingsView.viewModel.message = error.localizedDescription
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
        SettingsView()
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

