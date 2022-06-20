//
//  MainView.swift
//  Everyday Meal Tracker
//
//  Created by Jacob Hajjar on 6/18/22.
//

import SwiftUI

enum Screens {
    case dashboard
    case journal
}
struct ContentView: View {
    @State var currentView: Screens = .journal
    var body: some View {
        GeometryReader { geometry in
            VStack (spacing: 0) {
                switch(currentView) {
                    case .dashboard:
                        DashboardView()
                    default:
                        JournalView()
                }
                Spacer()
                ZStack {
                   Rectangle()
                    .fill(Color.orange)
                    .frame(width: geometry.size.width, height: geometry.size.height / 10)
                    .shadow(color: Color.black.opacity(0.4), radius: 10)
                    HStack {
                        Spacer()
                        Button {
                            currentView = .journal
                        } label: {
                            Image(systemName: "book.closed.fill")
                                .imageScale(.large)
                                .foregroundColor(Color.black)
                        }
                        Spacer()
                        Button {
                            currentView = .dashboard
                        } label: {
                            Image(systemName: "house.fill")
                                .imageScale(.large)
                                .foregroundColor(Color.black)
                        }
                        Spacer()
                        Button {
                            currentView = .dashboard //set graph view
                        } label: {
                            Image(systemName: "chart.xyaxis.line")
                                .imageScale(.large)
                                .foregroundColor(Color.black)
                        }
                        Spacer()
                    }
                }
            }.ignoresSafeArea()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
