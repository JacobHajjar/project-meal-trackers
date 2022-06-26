//
//  DailyIntake.swift
//  Everyday Meal Tracker
//
//  Created by Jacob Hajjar on 6/19/22.
//

import Foundation

struct DailyIntake : Codable {
    
    init(on currentDate: Date) {
        self.currentDate = currentDate
    }
    var foodEaten : [Food] = []
    let currentDate : Date
    
    var totalCalories : Double {
        var sum : Double = 0
        for food in foodEaten {
            if let convertedNum = Double(food.calories) {
                sum+=convertedNum
            }
        }
        return sum
    }
    var totalProtein : Double {
        var sum : Double = 0
        for food in foodEaten {
            if let convertedNum = Double(food.protein) {
                sum+=convertedNum
            }
        }
        return sum
    }
    var totalCarbs: Double {
        var sum : Double = 0
        for food in foodEaten {
            if let convertedNum = Double(food.carbohydrates) {
                sum+=convertedNum
            }
        }
        return sum
    }
    var totalFat : Double {
        var sum : Double = 0
        for food in foodEaten {
            if let convertedNum = Double(food.fat) {
                sum+=convertedNum
            }
        }
        return sum
    }
    
}
