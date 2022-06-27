//
//  NewProfileView.swift
//  Everyday Meal Tracker
//
//  Created by Rodolfo Hernandez on 6/13/22.
//

import SwiftUI

enum VerifyAlerts {
    case passed
    case allFailed
    case twoFailed
    case nameFailed
    case ageFailed
    case goalFailed
}

enum ContinueAlerts {
    case notVerified
    case changesDetected
    case noChanges
}

struct NewProfileView: View {
    // TextField Variables
    @State var name = ""
    @State var age = ""
    @State var goal = ""
    
    // Button Alerts and Conditionals
    @State var skipAlert: Bool = false
    @State var verifyAlert: Bool = false
    @State var continueAlert: Bool = false
    @State var verify: VerifyAlerts = .allFailed
    @State var changes: ContinueAlerts = .noChanges
    @State var verified: Bool = false
    @State var first_time: Bool = false
    // Stored variables if user skipped or completed profile
    @AppStorage("profileSkipped") var skipped: Bool = false
    @AppStorage("profileDone") var done: Bool = false
    
    // Manager Object and Validity Checker
    @StateObject var manager = UserManager(name: "", age: 0, goal: 0)
    @State var checker = ValidityChecker()
    
    var body: some View {
        // If user wants to verify
        if skipped || done {
            // If user already completed profile or skipped
            if done && first_time {
                ContentView().environmentObject(manager)
            } else if done && first_time == false {
                if manager.isUserPresent() {
                    ContentView().environmentObject(manager)
                }
            }else if skipped {
                ContentView().environmentObject(manager)
            }
        } else {
            GeometryReader { geometry in
                ScrollView {
                    Spacer()
                    VStack {
                        Spacer()
                        // Mark: Skip Button
                        Button("Skip") {
                            self.skipAlert.toggle()
                        } .frame(width: geometry.size.width/1.2, alignment: .trailing)
                            .padding()
                            .alert(isPresented: $skipAlert) {
                                Alert(
                                    title: Text("Skip"),
                                    message: Text("Are you sure?"),
                                    primaryButton: .default(Text("Yes")) {
                                        DispatchQueue.main.asyncAfter(deadline: .now()) {
                                            manager.updateUsers(name: "Anonymous", age: "", goal: "")
                                            self.skipped.toggle()
                                        }
                                    },
                                    secondaryButton: .cancel(Text("No"))
                                )
                            }
                        
                        // Mark: Welcome Text
                        Text("Welcome!")
                            .bold()
                            .modifier(WelcomeText())
                        
                        // Mark: Person Icon
                        Image(systemName: "person.circle")
                            .font(.system(size: 150))
                        
                        // Mark: Input Name
                        ZStack {
                            Capsule()
                                .fill(.orange.opacity(0.3))
                                .frame(width: geometry.size.width/1.04, height: geometry.size.height/14)
                            HStack(alignment: .firstTextBaseline, spacing: 1) {
                                Text("Name")
                                    .modifier(InputText())
                                TextField("your name", text: $name)
                                    .modifier(InputText())
                            }
                        } .padding()
                        
                        // Mark: Input Age
                        ZStack {
                            Capsule()
                                .fill(.orange.opacity(0.3))
                                .frame(width: geometry.size.width/1.04, height: geometry.size.height/14)
                            HStack(alignment: .firstTextBaseline, spacing: 16) {
                                Text("Age")
                                    .modifier(InputText())
                                TextField("your age", text: $age)
                                    .modifier(InputText())
                            }
                        } .padding()
                        
                        // Mark: Input Goal
                        ZStack {
                            Capsule()
                                .fill(.orange.opacity(0.3))
                                .frame(width: geometry.size.width/1.04, height: geometry.size.height/14)
                            HStack(alignment: .firstTextBaseline, spacing: 8) {
                                Text("Goal")
                                    .modifier(InputText())
                                TextField("your goal in calories", text: $goal)
                                    .modifier(InputText())
                            }
                        } .padding()
                        
                        Spacer()
                        // Mark: Main Buttons
                        HStack(alignment: .center, spacing: 25) {
                            // Mark: Verify Button
                            Button("Verify") {
                                self.verifyAlert.toggle()
                                if checker.verifyUser(name: name, age: age, goal: goal) {
                                    self.verify = .passed
                                } else {
                                    // Check all three if inputted incorrectly
                                    if checker.isValidName(name) != true && checker.isValidAge(age) != true && checker.isValidGoal(goal) != true {
                                        self.verify = .allFailed
                                    }
                                    // Check if name not inputted correctly
                                    else if checker.isValidName(name) != true {
                                        self.verify = .nameFailed
                                    }
                                    // Check age while goal is blank
                                    else if checker.isValidAge(age) != true && goal == "" {
                                        self.verify = .ageFailed
                                    }
                                    // Check goal while age is blank
                                    else if age == "" && checker.isValidGoal(goal) != true {
                                        self.verify = .goalFailed
                                    }
                                    // Check age and goal if both inputted
                                    else if checker.isValidAge(age) != true && checker.isValidGoal(goal) != true {
                                        self.verify = .twoFailed
                                    }
                                    // If age is the only improper input
                                     else if checker.isValidAge(age) != true {
                                        self.verify = .ageFailed
                                    }
                                    // If goal is the only improper input
                                    else if checker.isValidGoal(goal) != true {
                                        self.verify = .goalFailed
                                    }
                                }
                            } .modifier(ButtonDesign())
                                .alert(isPresented: $verifyAlert) {
                                    switch verify {
                                    case .passed:
                                            return Alert(
                                                title: Text("Verified"),
                                                dismissButton: .default(Text("Got it!")) {
                                                    if verified != true {
                                                        self.verified.toggle()
                                                    }
                                                }
                                            )
                                    case .allFailed:
                                        return Alert(
                                            title: Text("Name must be inputted. Improper input for both age and goal. Leave age and goal blank if desired."),
                                            dismissButton: .default(Text("Okay")))
                                    case .twoFailed:
                                            return Alert(
                                                title: Text("Age and Goal: Incorrect Input"),
                                                message: Text("Age must be greater than 0 and must be a whole number. Goal must be greater than 1000 and less than 5000."),
                                                dismissButton: .default(Text("Okay")))
                                    case .nameFailed:
                                        return Alert(
                                            title: Text("Name must be inputted"),
                                            dismissButton: .default(Text("Okay")))
                                    case .ageFailed:
                                        return Alert(
                                            title: Text("Age: Incorrect Input"),
                                            message: Text("Age must be greater than 0 and must be a whole number."),
                                            dismissButton: .default(Text("Okay")))
                                    case .goalFailed:
                                        return Alert(
                                            title: Text("Goal: Incorrect Input"),
                                            message: Text("Goal must be greater than 1000 and less than 5000."),
                                            dismissButton: .default(Text("Okay")))
                                    }
                                }
                            
                            // Mark: Continue Button
                            Button("Continue") {
                                self.continueAlert.toggle()
                                if verified == false {
                                    self.changes = .notVerified
                                } else if checker.isChanged(name: name, age: age, goal: goal) == true {
                                    self.changes = .changesDetected
                                } else if verified {
                                    self.first_time = true
                                    self.changes = .noChanges
                                }
                            } .modifier(MainButtonDesign())
                                .alert(isPresented: $continueAlert) {
                                    switch changes {
                                        // If user did not verify first
                                        case .notVerified:
                                            return Alert(
                                                title: Text("Not Verified"),
                                                message: Text("Please verify first before proceeding"),
                                                dismissButton: .default(Text("Got it")))
                                        
                                        // If user verified but made changes afterwards
                                        case .changesDetected:
                                            return Alert(
                                                title: Text("Changes Discovered"),
                                                message: Text("Please verify again before proceeding"),
                                                dismissButton: .default(Text("Got it")) {
                                                    self.verified.toggle()
                                                })
                                        
                                        // If user verified and made no changes
                                        case .noChanges:
                                            return Alert(
                                                title: Text("Welcome \(name)!"),
                                                dismissButton: .default(Text("Thanks!")) {
                                                    DispatchQueue.main.asyncAfter(deadline: .now()) {
                                                        self.manager.updateUsers(name: name, age: age, goal: goal)
                                                        self.done.toggle()
                                                    } // End of DispatchQueue
                                                })
                                    } // End of Switch Statements
                                } // End of Continue Alert
                        } .frame(width: geometry.size.width)
                    }
                } .frame(width: geometry.size.width, height: geometry.size.height)
                    .background(.orange.opacity(0.2))
            }
        }
    }
}



struct NewProfileView_Previews: PreviewProvider {
    static var previews: some View {
        NewProfileView()
    }
}
