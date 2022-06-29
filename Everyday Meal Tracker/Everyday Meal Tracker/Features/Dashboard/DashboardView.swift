//
//  ContentView.swift
//  Everyday Meal Tracker
//
//  Created by csuftitan on 6/6/22.
//

import CoreData
import SwiftUI

struct DashboardView: View {
    @EnvironmentObject var appHistory: IntakeHistory
    @State var intakeIndex: Int = 0
    // @StateObject var curr_entIntake : DailyIntake

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                VStack(spacing: 0) {
                    Spacer()
                    HStack {
                        Button {
                            if appHistory.foodHistory.indices.contains(intakeIndex + 1) {
                                intakeIndex += 1
                            }
                        } label: {
                            Image(systemName: "chevron.left")
                                .imageScale(.large)
                                .foregroundColor(Color.black)
                            // .disabled(<#T##Bool#>)
                        }.frame(width: 50, height: 50)
                        Text(appHistory.foodHistory[intakeIndex].currentDate.formatted(date: .long, time: .omitted))
                            .bold()
                            .font(.system(size: 20, weight: .bold, design: .default))
                        Button {
                            if appHistory.foodHistory.indices.contains(intakeIndex - 1) {
                                intakeIndex -= 1
                            }
                        } label: {
                            Image(systemName: "chevron.right")
                                .imageScale(.large)
                                .foregroundColor(Color.black)
                        }.frame(width: 50, height: 50)
                    }
                    HStack {
                        VStack {
                            Text("Calories")
                            Text("\(appHistory.foodHistory[intakeIndex].totalCalories, specifier: "%.1f")")
                        }
                        Spacer()
                        VStack {
                            Text("Protein")
                            Text("\(appHistory.foodHistory[intakeIndex].totalProtein, specifier: "%.1f")")
                        }
                        Spacer()
                        VStack {
                            Text("Carbs")
                            Text("\(appHistory.foodHistory[intakeIndex].totalCarbs, specifier: "%.1f")")
                        }
                        Spacer()
                        VStack {
                            Text("Fat")
                            Text("\(appHistory.foodHistory[intakeIndex].totalFat, specifier: "%.1f")")
                        }
                    }.frame(width: geometry.size.width - 60)
                        .padding(.bottom, geometry.size.height / 40)
                }
                .frame(maxWidth: .infinity, maxHeight: geometry.size.height / 5)
                .background(Color.orange)
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 10)
                ZStack {
                    VStack(spacing: 0) {
                        VStack(spacing: 0) {
                            List {
                                ForEach($appHistory.foodHistory[intakeIndex].foodEaten) {
                                    foodElement in
                                    ListEntry(entryHeight: 60, entryWidth: geometry.size.width - 20, name: foodElement.name, calories: foodElement.calories, protein: foodElement.protein, carbohydrates: foodElement.carbohydrates,
                                              fat: foodElement.fat)
                                }.onDelete {
                                    offset in
                                    appHistory.foodHistory[intakeIndex].foodEaten.remove(atOffsets: offset)
                                    appHistory.saveHistory()
                                }
                            }.listStyle(.plain)
                                .padding(.leading, -10)
                        }
                        Spacer()
                    }
                    VStack {
                        Spacer()
                        HStack(spacing: 0) {
                            Spacer()
                            Button {
                                appHistory.foodHistory[intakeIndex].foodEaten.append(Food())
                            } label: {
                                Image(systemName: "plus")
                                    .imageScale(.large)
                                    .foregroundColor(Color.black)
                            }.frame(width: 50, height: 50)
                                .background(Color.orange)
                                .cornerRadius(5)
                                .padding()
                                .shadow(radius: 5)
                        }
                    }
                }
            }
        }
    }
}

/* struct DashboardPrev : View {
     @State var foodEaten : [Food] = [Food(), Food(), Food()]
     var body: some View {
         DashboardView(intake: foodEaten)
     }
 } */

/* struct ContentView_Previews: PreviewProvider {
     static var previews: some View {
         DashboardView()
     }
 } */
