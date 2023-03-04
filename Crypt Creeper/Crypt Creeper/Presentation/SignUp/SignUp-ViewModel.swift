//
//  SignUpView-ViewModel.swift
//  Crypt Creeper
//
//  Created by Diego Moreno on 28/2/23.
//

// Pasar los datos del signup al faction view
// Elegir facción en el faction view a través del id

import Foundation
import UIKit
extension SignUpView {
    class ViewModel: ObservableObject {
        
        @Published var username: String = ""
        @Published var email: String = ""
        @Published var password: String = ""
        @Published var repeatPassword: String = ""
        @Published var profilePic: UIImage?
        @Published var factionId: Int = 0
        
        @Published var alertTitle: String = ""
        @Published var alertMessage: String = ""
        @Published var message: String = ""
        @Published var showAlert: Bool = false
        @Published var isRegistered: Bool = false
        @Published var isLoged: Bool = false
        
        var userModel: UserModel = .init()
        
    }
}
