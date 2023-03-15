//
//  UserModel.swift
//  Crypt Creeper
//
//  Created by Diego Moreno on 7/3/23.
//

import Foundation
import UIKit

struct UserModel {
    let username: String
    let email: String
    let password: String
    var factionId: Int
    let profilePic: UIImage
    
    init() {
        self.username = ""
        self.email = ""
        self.password = ""
        self.factionId = 1
        self.profilePic = UIImage()
    }
    
    init(username: String, email: String, password: String, factionId: Int, profilePic: UIImage) {
        self.username = username
        self.email = email
        self.password = password
        self.factionId = factionId
        self.profilePic = profilePic
    }
}
