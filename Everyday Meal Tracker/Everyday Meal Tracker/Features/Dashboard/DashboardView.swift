//
//  ContentView.swift
//  Everyday Meal Tracker
//
//  Created by csuftitan on 6/6/22.
//

import SwiftUI
import CoreData

struct DashboardView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                VStack (spacing: 0) {
                    Spacer()
                    Text("June 12, 2022")
                    .bold()
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .padding(.bottom, geometry.size.height / 40)
                    HStack {
                        Text("Calorie")
                        Spacer()
                        Text("Protein")
                        Spacer()
                        Text("Carbs")
                        Spacer()
                        Text("Fat")
                    }.frame(width: geometry.size.width - 60)
                    .padding(.bottom, 5)
                }
                .frame(maxWidth: .infinity, maxHeight: geometry.size.height / 7)
                .background(Color.orange)
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 10)
                ZStack {
                    VStack (spacing: 0) {
                        ScrollView {
                            VStack(spacing: 0) {
                                ListEntry(entryHeight: 60, entryWidth: geometry.size.width - 20)
                                ListEntry(entryHeight: 60, entryWidth: geometry.size.width - 20)
                                ListEntry(entryHeight: 60, entryWidth: geometry.size.width - 20)
                            }
                        }
                        Spacer()
                    }
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Button {
                                //TODO code for button press
                            } label: {
                                Image(systemName: "plus")
                                    .imageScale(.large)
                                    .foregroundColor(Color.black)
                            }.frame(width: 40, height: 40)
                            .background(Color.orange)
                            .foregroundColor(Color.white)
                            .cornerRadius(5)
                            .padding()
                        }
                    }
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DashboardView()
        }
    }
}
