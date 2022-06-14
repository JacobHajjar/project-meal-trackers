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
    var body: some View {
        HStack {
            Text("Total - 100 - 17 - 10 - 6")
        }.frame(width: entryWidth, height: entryHeight)
            .background(Color.orange.opacity(0.7))
        .cornerRadius(10)
    }
}

struct ListEntry_Previews: PreviewProvider {
    static var previews: some View {
        ListEntry(entryHeight: 50, entryWidth: 290)
    }
}
