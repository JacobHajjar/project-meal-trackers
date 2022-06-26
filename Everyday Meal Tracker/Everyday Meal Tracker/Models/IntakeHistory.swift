//
//  IntakeHistory.swift
//  Everyday Meal Tracker
//
//  Created by Jacob Hajjar on 6/24/22.
//

import Foundation

final class IntakeHistory : ObservableObject {
    
    @Published var foodHistory: [DailyIntake] = []
    
    let fileURL = FileManager.default.urls(for: .documentDirectory,in: .userDomainMask).first!.appendingPathComponent("foodHistory")
                .appendingPathExtension("plist")
    init() {
        initializeHistory()
    }
    func initializeHistory() {
        let currentDate = Date()
        for i in 0...29 {
            foodHistory.append(DailyIntake(on: Calendar.current.date(byAdding: .day, value: -i, to: currentDate)!))
        }
    }
    

    func loadHistory() {
        let propertyListDecoder = PropertyListDecoder()
        if let retrievedHistory = try? Data(contentsOf: fileURL),
           let decodedHistory = try?
           propertyListDecoder.decode([DailyIntake].self,
                                      from: retrievedHistory)
        {
            var historyIndex = 0
            for i in 0...29 {
                if foodHistory[i].currentDate.formatted(date: .long, time: .omitted) == decodedHistory[historyIndex].currentDate.formatted(date: .long, time: .omitted) {
                    foodHistory[i] = decodedHistory[historyIndex]
                    historyIndex+=1
                }
            }
        }
    }
    func saveHistory() {
        let propertyListEncoder = PropertyListEncoder()
        if let encodedCrossWalk = try? propertyListEncoder.encode(foodHistory) {
            try? encodedCrossWalk.write(to: fileURL,
                                        options: .noFileProtection)
        }
    }
}
