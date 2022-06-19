//
//  SearchView.swift
//  Everyday Meal Tracker
//
//  Created by csuftitan on 6/7/22.
//

import SwiftUI

struct SearchView: View {
    private var listOfFood = foodList
    @State private var searchText = ""
    var body: some View {
        NavigationView {
                    List {
                        ForEach(searchResults, id: \.self) { name in
                            NavigationLink(destination: SearchResultView()) {
                                Text(name).bold()
                            }
                        }
                    }
                    .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Look for something")                    .navigationTitle("Food Search")
                }
    }
    var searchResults: [String] {
        if searchText.isEmpty {
            return listOfFood
        } else {
            return listOfFood.filter { $0.contains(searchText) }
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


struct SearchResultView: View {
    var body: some View {
        VStack{
            HStack{
                Text("First one")
            }
        }
    }
}
