//
//  SplashScreenView.swift
//  Australia
//

import SwiftUI

struct SplashScreenView: View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        ZStack {
            // Adjust background color for light and dark mode
            (colorScheme == .dark ? Color.black : Color.blue)
                .ignoresSafeArea()
            
            VStack {
                Image(systemName: Localization.SplashScreen.globeIcon)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.white)
                Text(Localization.SplashScreen.welcomeMessage)
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(.top, 16)
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
