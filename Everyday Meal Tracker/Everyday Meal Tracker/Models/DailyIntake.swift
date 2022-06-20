//
//  DailyIntake.swift
//  Everyday Meal Tracker
//
//  Created by Jacob Hajjar on 6/19/22.
//

import Foundation

struct DailyIntake {
    var totalCalories : Int = 0
    var totalProtein : Int = 0
    var totalCarbs: Int = 0
    var totalFat : Int = 0
    
    private(set) var foodEaten : [Food] = []
    
    mutating func add(_ eatenFood: Food) {
        foodEaten.append(eatenFood)
        totalCalories+=eatenFood.calories
        totalProtein+=eatenFood.protein
        totalCarbs+=eatenFood.carbohydrates
        totalFat+=eatenFood.fat
    }
}
