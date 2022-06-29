//
//  StartupView.swift
//  Everyday Meal Tracker
//
//  Created by Rodolfo Hernandez on 6/6/22.
//

import SwiftUI

struct LaunchView: View {
    @State private var isActive: Bool = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive {
            NewProfileView()
        } else {
            ZStack {
                VStack {
                    VStack {
                        Image(systemName: "fork.knife.circle")
                            .font(.system(size: 150))
                            .foregroundColor(.orange)
                        Text("Everyday Meal Tracker")
                            .font(.system(size: 20, design: .rounded))
                            .foregroundColor(.orange.opacity(0.8))
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear {
                        withAnimation(.easeIn(duration: 1.2)) {
                            self.size = 0.9
                            self.opacity = 1.0
                        }
                    }
                }
                .ignoresSafeArea()
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    self.isActive = true
                }
            }
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
