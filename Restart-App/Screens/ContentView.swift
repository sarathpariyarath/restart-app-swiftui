//
//  ContentView.swift
//  Restart-App
//
//  Created by Sarath P on 07/07/22.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("onboarding") var isOnboardingActive: Bool = true
    
    var body: some View {
        ZStack {
            if isOnboardingActive {
                OnboardingView()
            } else {
                HomeView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
