//
//  Everyday_Meal_TrackerApp.swift
//  Everyday Meal Tracker
//
//  Created by csuftitan on 6/6/22.
//

import SwiftUI

@main
struct Everyday_Meal_TrackerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            //StartupView()
              //  .environment(\.managedObjectContext,persistenceController.container.viewContext)
            ContentView()
                .environment(\.managedObjectContext,persistenceController.container.viewContext)
        }
    }
}
