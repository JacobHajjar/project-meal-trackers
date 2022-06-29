//
//  SearchClass.swift
//  Everyday Meal Tracker
//
//  Created by Vamshikrishna Reddy Katipally on 6/12/22.
//

import Foundation
import SwiftUI

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
    @Published var ResultCalories: Double = 0
    @Published var ResultFat: Double = 0
    @Published var ResultProtein: Double = 0
    @Published var ResultCarbohydrates: Double = 0

    private var accessToken = "Y4r5i58ZoYepqOqzpZxqhK1Ehdb1F6OQDb0E1c5U"

    func find(_ searchString: String) {
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
