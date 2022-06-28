//
//  SearchPersistence.swift
//  Everyday Meal Tracker
//
//  Created by Vamshikrishna Reddy Katipally on 6/23/22.
//

import Foundation
import SwiftUI

class SearchHistory: ObservableObject {
    @Published var searchStrings: [String] = []
    var maxsearches: Int = 5
    var fileURL: URL

    init() {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        fileURL = documentsDirectory.appendingPathComponent("mealSearch").appendingPathExtension("plist")
        loadHistory()
    }

    func addSearchString(_ searchString: String) {
        if searchStrings.count == maxsearches {
            searchStrings.remove(at: maxsearches - 1)
        }
        searchStrings.insert(searchString, at: 0)
        saveHistory()
    }

    func saveHistory() {
        let propertyListEncoder = PropertyListEncoder()
        if let encodedMeal = try? propertyListEncoder.encode(searchStrings) {
            try? encodedMeal.write(to: fileURL, options: .noFileProtection)
        }
    }

    func loadHistory() {
        let propertyListDecoder = PropertyListDecoder()
        if let retrievedMeal = try? Data(contentsOf: fileURL),
           let decodedMeal = try?
           propertyListDecoder.decode([String].self, from: retrievedMeal)
        {
            searchStrings = decodedMeal
        }
    }
}
