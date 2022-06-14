//
//  ContentView.swift
//  Everyday Meal Tracker
//
//  Created by csuftitan on 6/6/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 20) {
                VStack {
                    Spacer()
                    Text("June 12, 2022")
                    .bold()
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .padding(.bottom, 7)
                }
                .frame(maxWidth: .infinity, maxHeight: geometry.size.height / 10)
                .background(Color.orange)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
                ListEntry(entryHeight: 50, entryWidth: geometry.size.width - 20)
                ListEntry(entryHeight: 50, entryWidth: geometry.size.width - 20)
                ListEntry(entryHeight: 50, entryWidth: geometry.size.width - 20)
                Spacer()
                Button("Add Food Entry") {
                    //TODO code for button press
                }.frame(width: 200, height: 50)
                .background(Color.orange)
                .foregroundColor(Color.white)
                .cornerRadius(5)
                .padding(.bottom, 20.0)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
