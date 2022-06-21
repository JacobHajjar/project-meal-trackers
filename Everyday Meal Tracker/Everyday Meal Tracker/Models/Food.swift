//
//  Food.swift
//  Everyday Meal Tracker
//
//  Created by Jacob Hajjar on 6/13/22.
//

import Foundation

class Food : ObservableObject, Identifiable {
    var id = UUID()
    @Published var name : String = ""
    @Published var calories : String = ""
    @Published var protein : String = ""
    @Published var carbohydrates : String = ""
    @Published var fat : String = ""
}
