//
//  SearchView.swift
//  Everyday Meal Tracker
//
//  Created by csuftitan on 6/7/22.
//

import SwiftUI

struct SearchView: View {
        private var listOfFood = foodList
        @State var searchText = ""
        var body: some View {
            NavigationView {
                List {
                    
                }
                .searchable(text: $searchText)
                .navigationTitle("Search")
            }
        }
    }

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

public var foodList = [
    "Salad",
    "Chicken",
    "Bacon",
    "Eggs",
]
