//
//  Modifiers.swift
//  Everyday Meal Tracker
//
//  Created by Rodolfo Hernandez on 6/25/22.
//

import SwiftUI

struct WelcomeText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Euphemia UCAS", size: 30))
            .foregroundColor(.red)
            .padding()
    }
}

struct InputText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Euphemia UCAS", size: 20))
            .padding()
    }
}

struct SkipButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.red)
            .cornerRadius(10)
    }
}

struct MainButtonDesign: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(width:120, height: 50)
            .background(Color.red)
            .cornerRadius(10)
            .foregroundColor(.black)
        
    }
}

struct Modifiers_Previews: PreviewProvider {
    static var previews: some View {
        NewProfileView()
    }
}
