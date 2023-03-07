//
//  UserProfileView-ViewModel.swift
//  Crypt Creeper
//
//  Created by Diego Moreno on 7/3/23.
//

import SwiftUI

extension UserProfileView {
    class ViewModel: ObservableObject {
        
        func getUser(completion: @escaping (_ user: UserModel, _ error: NetworkError) -> ()) {
            
            let url = "http://127.0.0.1:8000/api/user/getUserData"
            
            
            
        }
    }
}
