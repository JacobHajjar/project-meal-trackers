//
//  search_class.swift
//  Everyday Meal Tracker
//
//  Created by Vamshikrishna Reddy Katipally on 6/12/22.
//

import Foundation

class MealDataClass: ObservableObject {
    @Published var meals: [Meal] = []

    init() {
        meals.append(Meal(name: "Eggs", calorie:"10g", protein: "5g" , fat: "3g" , carbohydrates: "10g"))
        meals.append(Meal(name: "Bacon", calorie:"20g", protein: "8g" , fat: "4g" , carbohydrates: "11g"))
        meals.append(Meal(name: "Salad", calorie:"10g", protein: "4g" , fat: "2g" , carbohydrates: "23g"))
        meals.append(Meal(name: "Chicken", calorie:"10g", protein: "12g" , fat: "1g" , carbohydrates: "30g"))
        meals.append(Meal(name: "Fish", calorie:"10g", protein: "1g" , fat: "2g" , carbohydrates: "20g"))
    }
}

struct Meal: Identifiable {
    var id = UUID()
    var name: String
    var calorie: String
    var protein: String
    var fat: String
    var carbohydrates: String
}

