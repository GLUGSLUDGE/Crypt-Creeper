//
//  FactionExtension.swift
//  Crypt Creeper
//
//  Created by Diego Moreno on 27/2/23.
//

import Foundation
import SwiftUI

extension FactionsSelectionView {
    
    func button(image: String, title: String) -> some View {
        
        Button {
            //
        } label: {
            PopUpsView(bodyContent: {
                Image(image)
                    .resizable()
                    .scaledToFit()
            }, title: title, show: true)
            .frame(width: UIScreen.main.bounds.width/2, height: UIScreen.main.bounds.height/4)
        }
    }
    
    func popUp(image: String, title: String) -> some View {
        PopUpsView(bodyContent: {
            Button {
                //
            } label: {
                Image(image)
                    .resizable()
                    .scaledToFit()
            }

        }, title: title, show: true)
        .frame(width: UIScreen.main.bounds.width/2, height: UIScreen.main.bounds.height/4)
    }
    
}
