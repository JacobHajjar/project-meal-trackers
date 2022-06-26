//
//  SearchView.swift
//  Everyday Meal Tracker
//
//  Created by csuftitan on 6/7/22.
//
import SwiftUI

struct SearchView: View {
    @State var searchString: String = ""
    @StateObject var finder = MealFinder()
    @State var crosswalkname: String = ""
    @StateObject var history = SearchHistory()
    // @StateObject var MealData = MealDataClass()
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Meal Search")
                    .font(.largeTitle).padding(.top,60)
                HStack{
                TextField("Looking for something..", text: $searchString)
                    .modifier(TextEntry())

                Button(action: {
                    finder.find(searchString)
                    history.addSearchString(searchString)
                }) {
                    Text("Search")
                }
                .modifier(ButtonDesign())    .padding(.bottom, 5)
                }
                Text("Recent searches")
                    .font(.headline)
                List(history.searchStrings, id: \.self) {
                    storedSearchString in
                    Button(action: {
                        searchString = storedSearchString
                        finder.find(searchString)
                        history.addSearchString(searchString)
                    }) {
                        Text(storedSearchString)
                    }
                }.frame(height: 300)
                Text("Results")
                    .font(.headline)
                VStack(alignment: .leading) {
                    Spacer()
                    Text(finder.firstFoundName)
                    Spacer()
                    Text("Calories :  \(finder.ResultCalories, specifier: "%.1f")")
                    Text("Protein :  \(finder.ResultProtein, specifier: "%.1f")")
                    Text("Carbohydrates : \(finder.ResultCarbohydrates, specifier: "%.1f")")
                    Text("Fat : \(finder.ResultFat, specifier: "%.1f")")
                    Spacer()
                    Button(action: {
                    
                    }) {
                        Text("Add to Journal")
                    }
                    .modifier(ButtonDesign())
                }
                // Image(uiImage: finder.image)
                Spacer()
            }.padding()
        }
    }
//    var body: some View {
//        NavigationView {
//            List {
//                ForEach(MealData.meals) {
//                    meal in
//                    NavigationLink(destination: VStack {
//                        VStack {
//                            Text("Calories: \(meal.calorie)")
//                            Text("Protein: \(meal.fat)")
//                            Text("Carbs: \(meal.fat)")
//                            Text("Fat: \(meal.fat)")
//                            Spacer()
//                        }
//                        VStack {
//                            Button(action: {
//                                print("Success!")
//                            }) {
//                                Text("Add")
//                            }.padding()
//                                .background(Color.black)
//                                .foregroundColor(Color.white)
//                                .cornerRadius(10)
//                        }
//                    }) {
//                        Text(meal.name)
//                    }
//                }
//            }
//            .searchable(text: $searchString, placement: .navigationBarDrawer(displayMode: .always), prompt: "Look for something"){
//                Text("Recent searches")
//                    .font(.headline)
//                List(history.searchStrings, id: \.self) {
//                    storedSearchString in
//                    Button(action: {
//                        searchString = storedSearchString
//                        finder.find(searchString)
//                        history.addSearchString(searchString)
//                    }) {
//                        Text(storedSearchString)
//                    }
//                }
//            }
//            .onChange(of: searchString) {
//                print(searchString)
//            }
//            .navigationTitle("Meal Search")
//
//        }.environmentObject(MealData)
//    }
}

struct SearchResultView: View {
    var body: some View {
        Text("Second Screen")
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
