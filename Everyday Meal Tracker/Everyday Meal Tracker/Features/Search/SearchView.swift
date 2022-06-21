//
//  SearchView.swift
//  Everyday Meal Tracker
//
//  Created by csuftitan on 6/7/22.
//

import SwiftUI

struct SearchView: View {
    @StateObject var MealData = MealDataClass()
    @State private var searchText = ""
    var body: some View {
        NavigationView {
            List {
                ForEach(MealData.meals) {
                    meal in
                    NavigationLink(destination: Text("Calories:\(meal.calorie)Fat:\(meal.fat)")) {
                        Text(meal.name)
                    }                }
            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Look for something").navigationTitle("Meal Search")
        }.environmentObject(MealData)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
