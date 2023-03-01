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
    @State private var size = 0.8
    @State private var opacity = 0.5
    @State var userDefaults = UserDefaults.standard
    
    
    // MARK: - Body
    
    var body: some View {
        if isActive {
            if userDefaults.string(forKey: "savedToken") != nil {
                HomeView()
            } else {
                LoginView()
            }
        } else {
            ZStack {
                Color.accentColor
                    .ignoresSafeArea()
                VStack {
                    VStack {
                        Image("ImageGlugLogo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.main.bounds.size.width/1.1, height: UIScreen.main.bounds.size.height/1.1)
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 1.2)) {
                            self.size = 1
                            self.opacity = 1
                        }
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        withAnimation {
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
        SplashView()
    }
}
