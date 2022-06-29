//
//  ListEntry.swift
//  Everyday Meal Tracker
//
//  Created by Jacob Hajjar on 6/13/22.
//

import SwiftUI

struct ListEntry: View {
    var entryHeight: CGFloat
    var entryWidth: CGFloat
    @Binding var name: String
    @Binding var calories: String
    @Binding var protein: String
    @Binding var carbohydrates: String
    @Binding var fat: String
    @FocusState private var calorieFieldIsFocused: Bool
    @FocusState private var proteinFieldIsFocused: Bool
    @FocusState private var carbFieldIsFocused: Bool
    @FocusState private var fatFieldIsFocused: Bool
    @EnvironmentObject var appHistory: IntakeHistory

    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Rectangle()
                    .fill(Color.orange)
                    .frame(height: entryHeight / 2)
                TextField(
                    "Enter Food Name",
                    text: $name).frame(width: entryWidth)
                    .multilineTextAlignment(.center)
                    .onSubmit {
                        appHistory.saveHistory()
                    }
            }
            Spacer()
            HStack(spacing: 0) {
                TextField(
                    "Calories",
                    text: $calories)
                    .focused($calorieFieldIsFocused)
                    .onChange(of: calorieFieldIsFocused) {
                        _ in
                        appHistory.saveHistory()
                        print("Saved")
                        if doubleIsInvalid(of: calories) {
                            calories = ""
                        }
                    }
                    .frame(width: entryWidth / 4)
                    .multilineTextAlignment(.center)
                    .keyboardType(.decimalPad)
                TextField(
                    "Protein",
                    text: $protein)
                    .focused($proteinFieldIsFocused)
                    .onChange(of: proteinFieldIsFocused) {
                        _ in
                        appHistory.saveHistory()
                        if doubleIsInvalid(of: protein) {
                            protein = ""
                        }
                    }
                    .frame(width: entryWidth / 4)
                    .multilineTextAlignment(.center)
                    .keyboardType(.decimalPad)
                TextField(
                    "Carbs",
                    text: $carbohydrates)
                    .focused($carbFieldIsFocused)
                    .onChange(of: carbFieldIsFocused) {
                        _ in
                        appHistory.saveHistory()
                        if doubleIsInvalid(of: carbohydrates) {
                            carbohydrates = ""
                        }
                    }
                    .frame(width: entryWidth / 4)
                    .multilineTextAlignment(.center)
                    .keyboardType(.decimalPad)
                TextField(
                    "Fat",
                    text: $fat)
                    .focused($fatFieldIsFocused)
                    .onChange(of: fatFieldIsFocused) {
                        _ in
                        appHistory.saveHistory()
                        if doubleIsInvalid(of: fat) {
                            fat = ""
                        }
                    }
                    .frame(width: entryWidth / 4)
                    .multilineTextAlignment(.center)
                    .keyboardType(.decimalPad)
            }
            Spacer()
        }.frame(width: entryWidth, height: entryHeight)
            .background(Color.orange.opacity(0.7))
            .cornerRadius(10)
            .padding(.all, 0)
    }
}

func doubleIsInvalid(of doubleString: String) -> Bool {
    if let _ = Double(doubleString) {
        return false
    } else {
        return true
    }
}

/* struct ListEntry_Previews: PreviewProvider {
     static var previews: some View {
         @State var foodPreview = Food()
         ListEntry(entryHeight: 60, entryWidth: 200, name: $foodPreview.name, calories: $foodPreview.name, protein: $foodPreview.name, carbohydrates: $foodPreview.name,
                   fat: $foodPreview.name)
     }
 } */
