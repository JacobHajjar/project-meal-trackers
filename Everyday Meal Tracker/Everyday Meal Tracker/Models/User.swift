//
//  User.swift
//  Everyday Meal Tracker
//
//  Created by Rodolfo Hernandez on 6/13/22.
//
import Foundation
import SwiftUI


struct User: Codable {
    var name: String
    var age: Int
    var goal: Double
    
    enum UserKeys: String, CodingKey {
        case name
        case age
        case goal
    }
}

struct ValidityChecker {
    private var name: String = ""
    private var age: Int = 0
    private var goal: Double = 0
    
    func isChanged(name: String, age: String, goal: String) -> Bool {
        var changed = false
        if self.name != name {
            changed = true
        } else if self.age != 0 {
            if age == "" {
                changed = true
            } else if self.age != Int(age) {
                changed = true
            }
        } else if self.goal != 0 {
            if goal == "" {
               changed = true
            } else if self.goal != Double(goal) {
                changed = true
            }
        }
        
        return changed
    }
    
    mutating func isValidName(_ name: String) -> Bool {
        var valid_name = false
        if name != "" {
            self.name = name
            valid_name = true
        }
        return valid_name
    }
    
    mutating func isValidAge(_ age: String) -> Bool {
        var valid_age = false
        if Int(age) != nil {
            if let current_age = Int(age) {
                switch current_age {
                case 0..<100:
                    self.age = current_age
                    valid_age = true
                default:
                    valid_age = false
                }
            }
        }
        return valid_age
    }
    
    mutating func isValidGoal(_ goal: String) -> Bool {
        var valid_goal = false
        if Double(goal) != nil {
            if let current_goal = Double(goal) {
                switch current_goal {
                case 0..<1000:
                    valid_goal = false
                case 1000...5000:
                    self.goal = current_goal
                    valid_goal = true
                default:
                    valid_goal = false
                }
            }
        }
        return valid_goal
    }
    
    mutating func verifyUser(name: String, age: String, goal: String) -> Bool {
        var valid_input = false
        var validName = false
        var validAge = false
        var validGoal = false
        
        if name != "" {
            validName = isValidName(name)
        }
        if age != "" {
            validAge = isValidAge(age)
        }
        if goal != "" {
            validGoal = isValidGoal(goal)
        }
        if validName == true && age == "" && goal == "" {
            valid_input = true
        } else if validName == true && validAge == true && goal == "" {
            valid_input = true
        } else if validName == true && validGoal == true && age == "" {
            valid_input = true
        } else if validName, validAge, validGoal == true {
            valid_input = true
        }
        
        return valid_input
    }
    
    init() {
        
    }
}

final class UserManager: ObservableObject {
    @Published var user: User
    private var checker = ValidityChecker()
    
    func isEmpty() -> Bool {
        if self.user.name == "" {
            return true
        } else {
            return false
        }
    }
    
    func getName() -> String {
        return self.user.name
    }
    
    func getAge() -> Int {
        return self.user.age
    }
    
    func getGoal() -> Double {
        return self.user.goal
    }
    
    private func changeName(name: String) {
        if self.user.name != "" && name != "" {
            if self.user.name != name {
                self.user.name = name
            }
        } else if self.user.name == "" && name != "" {
            self.user.name = name
        }
    }
    
    private func changeAge(age: String) {
        if let new_age = Int(age) {
            if new_age != self.getAge() {
                self.user.age = new_age
            }
        } else if age == "" {
            self.user.age = 0
        }
    }
    
    private func changeGoal(goal: String) {
        if let new_goal = Double(goal) {
            self.user.goal = new_goal
        } else if goal == "" {
            self.user.goal = 2000
        }
    }
    
    func updateUsers(name: String, age: String, goal: String) {
        if checker.verifyUser(name: name, age: age, goal: goal) {
            changeName(name: name)
            changeAge(age: age)
            changeGoal(goal: goal)
            saveUser()
            
        }
    }
    
    private func saveUser() {
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(self.user) {
                UserDefaults.standard.set(data, forKey: "userData")
            }
    }
    
    private func loadUser() {
        DispatchQueue.main.async {
            if let savedUser = UserDefaults.standard.object(forKey: "userData") as? Data {
                let decoder = JSONDecoder()
                if let loadedUser = try? decoder.decode(User.self, from: savedUser) {
                    self.user.name = loadedUser.name
                    self.user.age = loadedUser.age
                    self.user.goal = loadedUser.goal
                }
            }
        }
    }
    
    func isUserPresent() -> Bool {
        var present = false
        loadUser()
        if self.getName() != "" {
            present = true
        }
        return present
    }
    
    init(name: String, age: Int, goal: Double) {
        self.user = User(name: name, age:  age, goal: goal)
    }
}
