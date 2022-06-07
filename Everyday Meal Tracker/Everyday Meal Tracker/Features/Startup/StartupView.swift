//
//  StartupView.swift
//  Everyday Meal Tracker
//
//  Created by Rodolfo Hernandez on 6/6/22.
//

import SwiftUI

struct StartupView: View {
    var body: some View {
        VStack(spacing:20) {
            // Mark: Header
            Spacer()
            
            Image("Startup")
                .resizable()
                .scaledToFit()
                .padding()
            
            // Mark: Center
            Text("Tracking your meal calories better than ever.")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
            // Mark: Footer
            Spacer()
            
        }
        
    }
}

struct StartupView_Previews: PreviewProvider {
    static var previews: some View {
        StartupView()
    }
}
