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
        NavigationView {
            VStack{
                TextField ("nombre" , text: $viewModel.userName)
                    .multilineTextAlignment(.center)
                    .frame(height: 50)
                    .background(Color .gray)
                    .cornerRadius(20)
                    .padding(.all , 10)
                Button {
                    self.viewModel.ChangeName { result in
                        switch result {
                        case .success(let message):
                            self.viewModel.message = message
                        case .failure(let error):
                            self.viewModel.message = error.localizedDescription
                        }
                    }
                }label: {
                    Text("cambiar nombre")
                }
                Spacer()
                
                Text(viewModel.message)
                
                VStack{
                    
                    Button {
                        shouldShowImagePicker.toggle()
                    } label: {
                        if let image = viewModel.profile_pic {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 143, height: 143)
                                .cornerRadius(80)
                        } else {
                           
                            Image(systemName:"person.fill")
                                .resizable()
                                .clipShape(Circle())
                                .frame(width: 150, height: 150)
                                .overlay(Circle().stroke(Color.blue))
                        }
                    }
                    .overlay(RoundedRectangle(cornerRadius: 80)
                        .stroke(Color.black, lineWidth: 3))
                    
                    Button {
                        self.viewModel.changePhoto{result in
                            switch result {
                            case .success(let message):
                                self.viewModel.message = message
                            case .failure(let error):
                                self.viewModel.message = error.localizedDescription
                            }
                        }
                    } label: {
                        Text("canbiar contraseña")
                    }

                }
                
                Spacer()
                
                
                TextField ("Contraseña antigua " , text: $viewModel.pass)
                    .multilineTextAlignment(.center)
                    .frame(height: 50)
                    .background(Color .gray)
                    .cornerRadius(20)
                    .padding(.all , 10)
                TextField ("nueva contraseña" , text: $viewModel.newPass)
                    .multilineTextAlignment(.center)
                    .frame(height: 50)
                    .background(Color .gray)
                    .cornerRadius(20)
                    .padding(.all , 10)
                
                TextField ("repetir contraseña" , text: $viewModel.repitNewPass)
                    .multilineTextAlignment(.center)
                    .frame(height: 50)
                    .background(Color .gray)
                    .cornerRadius(20)
                    .padding(.all , 10)
                
                Button {
                    viewModel.changePassword { result in
                        switch result {
                        case .success(let message):
                            self.viewModel.message = message
                        case .failure(let error):
                            self.viewModel.message = error.localizedDescription
                        }
                    }
                } label: {
                    Text("cambiar contraseña")
                }
                
                
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .fullScreenCover(isPresented: $shouldShowImagePicker, onDismiss: nil) {
                ImagePicker(image: $viewModel.profile_pic)
                    .ignoresSafeArea()
            }
            
        }
    }
}


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

