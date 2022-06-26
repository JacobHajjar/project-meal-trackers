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
        let today = DailyIntake(on: Date())
        let milk = Food()
        milk.calories = "50"
        let apple = Food()
        apple.calories = "70"
        today.foodEaten.append(milk)
        today.foodEaten.append(apple)
        XCTAssertEqual(today.totalCalories, 120)
    }
    func testTotalProtein() {
        let today = DailyIntake(on: Date())
        let milk = Food()
        milk.protein = "5"
        let apple = Food()
        apple.protein = "7"
        today.foodEaten.append(milk)
        today.foodEaten.append(apple)
        XCTAssertEqual(today.totalProtein, 12)
    }
    func testTotalCarbs() {
        let today = DailyIntake(on: Date())
        let milk = Food()
        milk.carbohydrates = "5"
        let apple = Food()
        apple.carbohydrates = "7"
        today.foodEaten.append(milk)
        today.foodEaten.append(apple)
        XCTAssertEqual(today.totalCarbs, 12)
    }
    func testTotalFat() {
        let today = DailyIntake(on: Date())
        let milk = Food()
        milk.fat = "5"
        let apple = Food()
        apple.fat = "7"
        today.foodEaten.append(milk)
        today.foodEaten.append(apple)
        XCTAssertEqual(today.totalFat, 12)
    }
    func testEmptyFoodList() {
        let today = DailyIntake(on: Date())
        XCTAssertEqual(today.totalCalories, 0)
    }
}
