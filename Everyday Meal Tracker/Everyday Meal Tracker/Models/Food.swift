//
//  Food.swift
//  Everyday Meal Tracker
//
//  Created by Jacob Hajjar on 6/13/22.
//

import Foundation

struct Food : Identifiable, Codable {
    init() {
        
    }
    var id = UUID()
    var name : String = ""
    var calories : String = ""
    var protein : String = ""
    var carbohydrates : String = ""
    var fat : String = ""
    
}
