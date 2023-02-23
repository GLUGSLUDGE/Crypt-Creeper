//
//  SettingsView.swift
//  Crypt Creeper
//
//  Created by Osasu sanchez on 17/2/23.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var viewModel = SettingsViewModel()
    @State var nContraseña = ""
    @State var nContraseña2 = ""
    
    
    var body: some View {
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
                
                Spacer()
                
                
                TextField ("Contraseña antigua " , text: $viewModel.pass)
                    .multilineTextAlignment(.center)
                    .frame(height: 50)
                    .background(Color .gray)
                    .cornerRadius(20)
                    .padding(.all , 10)
                TextField ("nueva contraseña" , text: $nContraseña)
                    .multilineTextAlignment(.center)
                    .frame(height: 50)
                    .background(Color .gray)
                    .cornerRadius(20)
                    .padding(.all , 10)
                
                TextField ("repetir contraseña" , text: $nContraseña2)
                    .multilineTextAlignment(.center)
                    .frame(height: 50)
                    .background(Color .gray)
                    .cornerRadius(20)
                    .padding(.all , 10)
                
                Button {
                    viewModel.changePassword(newPass: nContraseña, repitNewPass: nContraseña2)
                } label: {
                    Text("cambiar contraseña")
                }
                
                
            }
            
            
        }
        
    }

        struct SettingsView_Previews: PreviewProvider {
            static var previews: some View {
                SettingsView()
            }
        }
        
