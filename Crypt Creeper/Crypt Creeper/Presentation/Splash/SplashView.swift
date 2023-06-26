//
//  SplashView.swift
//  Crypt Creeper
//
//  Created by Diego Moreno on 27/2/23.
//

import SwiftUI

struct SplashView: View {
    
    
    // MARK: - Properties
    
    @State private var isActive: Bool = false
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            if isActive {
                HomeView()
            } else {
                ZStack {
                    Color.accentColor
                        .ignoresSafeArea()
                    VStack {
                        VStack {
                            Image("ImageGlugLogo")
                            .resizable()
                            .scaledToFit()
                            .padding(20)
                        }
                    }
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            self.isActive = true
                        }
                    }
                }
            }
        }
    }
}


struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView(
        )
    }
}
