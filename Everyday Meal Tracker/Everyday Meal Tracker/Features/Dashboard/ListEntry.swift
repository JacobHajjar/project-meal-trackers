//
//  ListEntry.swift
//  Everyday Meal Tracker
//
//  Created by Jacob Hajjar on 6/13/22.
//

import SwiftUI

struct ListEntry: View {
    var entryHeight : CGFloat
    var entryWidth : CGFloat
    @StateObject var foodItem : Food
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Rectangle()
                    .fill(Color.orange)
                    .frame(height: entryHeight / 2)
                TextField(
                    "Enter Food Name",
                    text: $foodItem.name
                ).frame(width: entryWidth)
                    .multilineTextAlignment(.center)
            }
            Spacer()
            HStack (spacing: 0) {
                TextField(
                    "Calories",
                    text: $foodItem.calories
                ).frame(width: entryWidth / 4)
                    .multilineTextAlignment(.center)
                TextField(
                    "Protein",
                    text: $foodItem.protein
                ).frame(width: entryWidth / 4)
                    .multilineTextAlignment(.center)
                TextField(
                    "Carbs",
                    text: $foodItem.carbohydrates
                ).frame(width: entryWidth / 4)
                    .multilineTextAlignment(.center)
                TextField(
                    "Fat",
                    text: $foodItem.fat
                ).frame(width: entryWidth / 4).multilineTextAlignment(.center)
            }
            Spacer()
        }.frame(width: entryWidth, height: entryHeight)
        .background(Color.orange.opacity(0.7))
        .cornerRadius(10)
        .padding(.top, 8)
    }
}

struct ListEntry_Previews: PreviewProvider {
    static var previews: some View {
        ListEntry(entryHeight: 60, entryWidth: 290, foodItem: Food())
    }
}
