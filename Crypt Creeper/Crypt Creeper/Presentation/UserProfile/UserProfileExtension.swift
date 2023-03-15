//
//  UserProfileExtension.swift
//  Crypt Creeper
//
//  Created by Diego Moreno on 6/3/23.
//

import Foundation
import SwiftUI

extension UserProfileView {
    func printTopPlays(topPlay: Int, points: Int) -> some View {
        VStack {
            HStack(spacing: 0) {
                BoldText(title: "\(topPlay)", fontSize: 30)
                    .foregroundColor(Color.ui.text)
                    .padding(.bottom, 80)
                    .padding(.leading, 10)
                    .padding(.top, 7)
                ImageFromAssets(image: "ICON_ENEMY_\(topPlay)")
                    .frame(width: 100, height: 100)
                    .padding(.trailing, 20)
            }
            BoldText(title: "\(points)p", fontSize: 24)
                .foregroundColor(Color.ui.text)
                .padding(.bottom, 10)
                .padding(.leading, 10)
        }
        .border(.white, width: 3)
        .padding(.horizontal, 4)
    }
    
    func achievements(image: String, title: String, desc: String) -> some View {
        HStack {
            ImageFromAssets(image: image)
                .frame(width: 120, height: 120)
            VStack(alignment: .leading) {
                BoldText(title: title, fontSize: 24)
                    .foregroundColor(Color.ui.text)
                ThinText(title: desc, fontSize: 20)
                    .foregroundColor(Color.ui.text)
            }
            Spacer()
        }
        .border(.white, width: 3)
        .padding(.horizontal, 4)
    }
}
