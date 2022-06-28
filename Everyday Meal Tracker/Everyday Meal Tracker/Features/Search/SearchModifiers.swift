//
//  Modifiers.swift
//  Everyday Meal Tracker
//
//  Created by Vamshikrishna Reddy Katipally on 6/23/22.
//

import Foundation
import SwiftUI

struct SearchTextEntry: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(10)
            .border(Color.black)
            .background(Color.white)
    }
}

struct SearchButtonDesign: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(10)
            .background(Color.black)
            .foregroundColor(Color.white)
            .cornerRadius(10)
    }
}

struct ButtonDesign: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(10)
            .background(Color.black)
            .foregroundColor(Color.white)
            .cornerRadius(10)
    }
}
