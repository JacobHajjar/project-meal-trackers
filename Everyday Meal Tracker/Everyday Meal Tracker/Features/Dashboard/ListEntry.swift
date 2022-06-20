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
        VStack(spacing: 0) {
            ZStack {
                Rectangle()
                    .fill(Color.orange)
                    .frame(height: entryHeight / 2)
                Text("Milk")
            }
            Spacer()
            HStack {
                Spacer()
                Text("100")
                Spacer()
                Text("9")
                Spacer()
                Text("8")
                Spacer()
                Text("2")
                Spacer()
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
        ListEntry(entryHeight: 60, entryWidth: 290)
    }
}
