//
//  search_class.swift
//  Everyday Meal Tracker
//
//  Created by Vamshikrishna Reddy Katipally on 6/12/22.
//

import Foundation
import SwiftUI

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

struct SearchAPIResult: Codable {
    var foods: [foodInfo]
}

struct foodInfo: Codable {
    var foodNutrients: [foodNutrient]
    var description: String
}

struct foodNutrient: Codable {
    var nutrientName: String
    var unitName: String
    var value: Double
}

class MealFinder: ObservableObject {
    @Published var firstFoundName = ""
    @Published var ResultCalories : Double = 0
    @Published var ResultFat : Double = 0
    @Published var ResultProtein : Double = 0
    @Published var ResultCarbohydrates : Double = 0

    
    @Published var image = UIImage()

    private var accessToken = "Y4r5i58ZoYepqOqzpZxqhK1Ehdb1F6OQDb0E1c5U"

    func find(_ searchString: String) {
        print("searchString")
        print(searchString)

        guard searchString != "" else {
            return
        }

        let usdaSearchURL = "https://api.nal.usda.gov/fdc/v1/foods/search?query=\(searchString)&pageSize=1&api_key=\(accessToken)"
        
        if let urlString = usdaSearchURL.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed),
           let url = URL(string: urlString)
        {
            let task = URLSession.shared.dataTask(with: url) {
                data, _, _ in

                DispatchQueue.main.async {
                    let jsonDecoder = JSONDecoder()
                    if let validData = data, let result = try? jsonDecoder.decode(SearchAPIResult.self, from: validData) {
                        if result.foods.count > 0 {
                            self.firstFoundName = result.foods[0].description
                            self.ResultProtein = result.foods[0].foodNutrients[0].value
                            self.ResultFat = result.foods[0].foodNutrients[1].value
                            self.ResultCarbohydrates = result.foods[0].foodNutrients[2].value
                            self.ResultCalories = result.foods[0].foodNutrients[3].value
                        } else {
                            self.firstFoundName = "No results found"
                        }
                    } else {
                        self.firstFoundName = "No results found"
                    }
                }
            }
            task.resume()
        }
    }
}

