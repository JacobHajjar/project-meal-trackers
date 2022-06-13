//
//  search_class.swift
//  Everyday Meal Tracker
//
//  Created by Vamshikrishna Reddy Katipally on 6/12/22.
//

import Foundation


protocol FoodData: ObservableObject {
    var name: String { get set }
    var calories: String { get set }
    var protein: String { get set }
    var fat: String { get set }
    var carbohydrates: String { get set }
}

class Search: FoodData {
    var name: String
    var calories: String
    var protein: String
    var fat: String
    var carbohydrates: String
  
    init(name:String,calories:String,protein:String,fat:String,carbohydrates:String){
        self.name = name
        self.calories = calories
        self.protein = protein
        self.fat = fat
        self.carbohydrates = carbohydrates
    }
}

