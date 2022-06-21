//
//  DailyIntake.swift
//  Everyday Meal Tracker
//
//  Created by Jacob Hajjar on 6/19/22.
//

import Foundation

class DailyIntake : ObservableObject {
    
    init() {
        
    }
    
    var totalCalories : Int {
        var sum = 0
        for food in foodEaten {
            let convertedNum = Int(food.calories) ?? 0
            sum+=convertedNum
        }
        return sum
    }
    var totalProtein : Int {
        var sum = 0
        for food in foodEaten {
            let convertedNum = Int(food.protein) ?? 0
            sum+=convertedNum
        }
        return sum
    }
    var totalCarbs: Int {
        var sum = 0
        for food in foodEaten {
            let convertedNum = Int(food.carbohydrates) ?? 0
            sum+=convertedNum
        }
        return sum
    }
    var totalFat : Int {
        var sum = 0
        for food in foodEaten {
            let convertedNum = Int(food.fat) ?? 0
            sum+=convertedNum
        }
        return sum
    }
    
    @Published var foodEaten : [Food] = []
    
   /* func add(_ eatenFood: Food) {
        foodEaten.append(eatenFood)
        totalCalories+=Int(eatenFood.calories)
        totalProtein+=eatenFood.protein
        totalCarbs+=eatenFood.carbohydrates
        totalFat+=eatenFood.fat
    }*/
}
