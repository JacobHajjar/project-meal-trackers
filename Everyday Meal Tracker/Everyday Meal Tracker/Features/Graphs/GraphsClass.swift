//
//  GraphsClass.swift
//  Everyday Meal Tracker
//
//  Created by csuftitan on 6/28/22.
//

import SwiftUI
import SwiftUICharts
import Foundation

struct DataOrganizer {
    func doesExist(data: IntakeHistory) -> Bool {
        var check = false
        
        for i in data.foodHistory {
            if i.foodEaten.count != 0 {
                check = true
            }
        }
        return check
    }
    func amtDays(data: IntakeHistory) -> Int {
        print(data.foodHistory.count)
        var type: Int = 1
        if data.foodHistory.count <= 1 {
            type = 1
        } else if data.foodHistory.count > 1 && data.foodHistory.count <= 7 {
            type = 2
        } else if data.foodHistory.count > 7 && data.foodHistory.count <= 14 {
            type = 3
        } else if data.foodHistory.count > 14 && data.foodHistory.count < 30 {
            type = 4
        }
        
        return type
    }
    
    func dailyData(data: IntakeHistory, index: Int) -> [[Double]] {
        var daily: [[Double]] = [[]]
        var calories: [Double] = []
        var protein: [Double] = []
        var carbs: [Double] = []
        var fat: [Double] = []
        
        for i in data.foodHistory {
            if i.foodEaten.count != 0 {
                calories.append(i.totalCalories)
                protein.append(i.totalProtein)
                carbs.append(i.totalCarbs)
                fat.append(i.totalFat)
            }
        }
        
        daily.append(calories)
        daily.append(protein)
        daily.append(carbs)
        daily.append(fat)
        
        return daily
    }
    
    func weeklyData(data: IntakeHistory) -> [[Double]] {
        var weekly = [[Double]]()
        var calories: [Double] = []
        var protein: [Double] = []
        var carbs: [Double] = []
        var fat: [Double] = []
        
        for i in data.foodHistory {
            if i.foodEaten.count != 0 {
                calories.append(i.totalCalories)
                protein.append(i.totalProtein)
                carbs.append(i.totalCarbs)
                fat.append(i.totalFat)
            }
        }
        
        weekly.append(calories)
        weekly.append(protein)
        weekly.append(carbs)
        weekly.append(fat)
        
        return weekly
    }
    func biweeklyData(data: IntakeHistory) -> [[Double]] {
        var biweekly = [[Double]]()
        var calories: [Double] = []
        var protein: [Double] = []
        var carbs: [Double] = []
        var fat: [Double] = []
        
        for i in data.foodHistory {
            if i.foodEaten.count != 0 {
                calories.append(i.totalCalories)
                protein.append(i.totalProtein)
                carbs.append(i.totalCarbs)
                fat.append(i.totalFat)
            }
        }
        
        biweekly.append(calories)
        biweekly.append(protein)
        biweekly.append(carbs)
        biweekly.append(fat)
        
        return biweekly
    }
    
    func monthlyData(data: IntakeHistory) -> [[Double]] {
        var monthly = [[Double]]()
        var calories: [Double] = []
        var protein: [Double] = []
        var carbs: [Double] = []
        var fat: [Double] = []
        
        for i in data.foodHistory {
            if i.foodEaten.count != 0 {
                calories.append(i.totalCalories)
                protein.append(i.totalProtein)
                carbs.append(i.totalCarbs)
                fat.append(i.totalFat)
            }
        }
        
        monthly.append(calories)
        monthly.append(protein)
        monthly.append(carbs)
        monthly.append(fat)
        
        return monthly
    }
    init() {
        
    }
}

struct GraphDataViewer: View {
    @State var data: [Double] = []
    @State var chart_title: String
    @State var colorGradient: GradientColor
    @State var lineColor: Color
    
    var body: some View {
        LineView(data: data, title: chart_title, style: ChartStyle(backgroundColor: Color("GraphColorSet"), accentColor: lineColor, gradientColor: colorGradient, textColor: Color("InvertedColorSet"), legendTextColor: .clear, dropShadowColor: .black))
    }
}


