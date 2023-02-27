//
//  FactionsSelectionView.swift
//  Crypt Creeper
//
//  Created by Diego Moreno on 27/2/23.
//

import SwiftUI

struct FactionsSelectionView: View {
    var body: some View {
        ZStack {
            Color.ui.popUpColor
                .ignoresSafeArea()
            // Ghost
            VStack {
                HStack {
                    popUp(image: "Ghost", title: "Ghost")
                    Spacer()
                }
                Spacer()
            }
            // Big Mud
            VStack {
                HStack {
                    popUp(image: "Big_mud", title: "Big Mud")
                }
                .padding(.leading, 30)
                Spacer()
            }
            .padding(.top, 60)
            ZStack {
                // Double Double
                VStack {
                    HStack {
                        popUp(image: "Double_double", title: "Double2")
                        Spacer()
                    }
                }
                .padding(.top, 160)
                // King Eyes
                VStack {
                    HStack {
                        popUp(image: "Kingeyes", title: "KingEye")
                    }
                    Spacer()
                }
                .padding(.top, 280)
                // Uzzi
                VStack {
                    HStack {
                        Spacer()
                        popUp(image: "Uzzi", title: "Uzzi")
                    }
                    .padding(.leading, 30)
                    Spacer()
                }
                .padding(.top, 170)
            }
            ZStack {
                // Tia
                VStack {
                    Spacer()
                    HStack {
                        popUp(image: "Tía", title: "Tia")
                        Spacer()
                    }
                    .padding(.leading, -10)
                }
                .padding(.bottom, 70)
                // Mosca
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        popUp(image: "Mosca", title: "   Mosca")
                    }
                }
                // Hans
                VStack {
                    Spacer()
                    HStack {
                        popUp(image: "Hans", title: "Hans")
                    }
                    .padding(.trailing, 30)
                }
                .padding(.bottom, 20)
            }
        }
    }
}

struct FactionsSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        FactionsSelectionView()
    }
}
