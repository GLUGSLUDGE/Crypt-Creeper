//
//  FactionsExtension.swift
//  Crypt Creeper
//
//  Created by Diego Moreno on 4/3/23.
//

import Foundation
import SwiftUI

extension FactionsView {
    
    func popUp(image: String, title: String, id: Int) -> some View {
        PopUpsView(title: title) {
            Image(image)
                .resizable()
                .scaledToFit()
        }
        .frame(width: UIScreen.main.bounds.width/2, height: UIScreen.main.bounds.height/4)
        .background(
            NavigationLink("", destination: HomeView(), isActive: $viewModel.isLoged)
        )
    }
    
}
