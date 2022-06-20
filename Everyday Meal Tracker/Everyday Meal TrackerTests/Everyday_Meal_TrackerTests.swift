//
//  Everyday_Meal_TrackerTests.swift
//  Everyday Meal TrackerTests
//
//  Created by csuftitan on 6/6/22.
//

import XCTest
@testable import Everyday_Meal_Tracker

class Everyday_Meal_TrackerTests: XCTestCase {
    
    func testTotalCalories() {
        var today = DailyIntake()
        var milk = Food()
        milk.calories = 50
        var apple = Food()
        apple.calories = 70
        today.add(milk)
        today.add(apple)
        XCTAssertEqual(today.totalCalories, 120)
    }
    func testTotalProtein() {
        var today = DailyIntake()
        var milk = Food()
        milk.protein = 5
        var apple = Food()
        apple.protein = 7
        today.add(milk)
        today.add(apple)
        XCTAssertEqual(today.totalProtein, 12)
    }
    func testTotalCarbs() {
        var today = DailyIntake()
        var milk = Food()
        milk.carbohydrates = 5
        var apple = Food()
        apple.carbohydrates = 7
        today.add(milk)
        today.add(apple)
        XCTAssertEqual(today.totalCarbs, 12)
    }
    func testTotalFat() {
        var today = DailyIntake()
        var milk = Food()
        milk.fat = 5
        var apple = Food()
        apple.fat = 7
        today.add(milk)
        today.add(apple)
        XCTAssertEqual(today.totalFat, 12)
    }
    func testEmptyFoodList() {
        let today = DailyIntake()
        XCTAssertEqual(today.totalCalories, 0)
    }
}
