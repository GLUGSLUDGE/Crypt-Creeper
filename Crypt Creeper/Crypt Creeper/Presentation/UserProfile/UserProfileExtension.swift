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
        HStack {
            switch topPlay {
            case 1:
                topPlays(top: topPlay, image: "ICON_ENEMY_8", point: points)
            case 2:
                topPlays(top: topPlay, image: "ICON_ENEMY_7", point: points)
            case 3:
                topPlays(top: topPlay, image: "ICON_ENEMY_6", point: points)
            case 4:
                topPlays(top: topPlay, image: "ICON_ENEMY_5", point: points)
            case 5:
                topPlays(top: topPlay, image: "ICON_ENEMY_4", point: points)
            case 6:
                topPlays(top: topPlay, image: "ICON_ENEMY_3", point: points)
            case 7:
                topPlays(top: topPlay, image: "ICON_ENEMY_2", point: points)
            case 8:
                topPlays(top: topPlay, image: "ICON_ENEMY_1", point: points)
            default:
                BoldText(title: "THERE ARE NO PLAYS", fontSize: 20)
            }
        }
    }
    
    func printAchievements(numTrophys: Int) -> some View {
        achievements(image: "ICON_ENEMY_8", title: "Kill the final boss", desc: "You killed the final boss")
    }
    
    func achievements(image: String, title: String, desc: String) -> some View {
        HStack {
            ImageFromAssets(image: image)
                .frame(width: 120, height: 120)
            VStack {
                BoldText(title: title, fontSize: 24)
                    .foregroundColor(Color.ui.text)
//                    .padding(.trailing, 30)
                ThinText(title: desc, fontSize: 20)
                    .foregroundColor(Color.ui.text)
            }
            Spacer()
        }
        .border(.white, width: 3)
        .padding(.horizontal, 4)
    }
    
    func topPlays(top: Int, image: String, point: Int) -> some View {
        VStack {
            HStack(spacing: 0) {
                BoldText(title: "\(top)", fontSize: 30)
                    .foregroundColor(Color.ui.text)
                    .padding(.bottom, 80)
                    .padding(.leading, 10)
                    .padding(.top, 7)
                ImageFromAssets(image: image)
                    .frame(width: 100, height: 100)
                    .padding(.trailing, 20)
            }
            BoldText(title: "\(point)"+"p", fontSize: 24)
                .foregroundColor(Color.ui.text)
                .padding(.bottom, 10)
                .padding(.leading, 10)
        }
        .border(.white, width: 3)
        .padding(.horizontal, 4)
    }
}
