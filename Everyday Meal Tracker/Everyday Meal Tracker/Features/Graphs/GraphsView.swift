//
//  GraphsView.swift
//  Everyday Meal Tracker
//
//  Created by Rodolfo Hernandez on 6/6/22.
//

import SwiftUI
import SwiftUICharts

struct GraphsView: View {
    @State var intakeIndex: Int = 0
    @State var organizer = DataOrganizer()
    
    @EnvironmentObject var manager: UserManager
    @EnvironmentObject var journalHistory: IntakeHistory
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                // MARK: Scrollable Data View

                ScrollView {
                    VStack(alignment: .center, spacing: 24) {
                        // MARK: Title

                        Text("\(manager.getName())'s Journal Overview")
                            .bold()
                            .font(.custom("Euphemia UCAS", size: 20))
                            .foregroundColor(Color("InvertedColorSet"))
                            .padding()
                        if organizer.doesExist(data: journalHistory) {
                            let data = organizer.monthlyData(data: journalHistory)
                            
                            // Calories Graph
                            GraphDataViewer(data: data[0], chart_title: "Calories", colorGradient: GradientColors.orange, lineColor: .orange)
                                .padding(4)
                                .background(Color("GraphColorSet"))
                                .cornerRadius(10)
                                .frame(width: geometry.size.width-14, height: geometry.size.height/2)
                                
                            // Protein Graph
                            GraphDataViewer(data: data[1], chart_title: "Protein", colorGradient: GradientColors.blue, lineColor: .blue)
                                .padding(4)
                                .background(Color("GraphColorSet"))
                                .cornerRadius(10)
                                .frame(width: geometry.size.width-14, height: geometry.size.height/2)
                            
                            // Carbs Graph
                            GraphDataViewer(data: data[2], chart_title: "Carbs", colorGradient: GradientColors.orngPink, lineColor: .mint)
                                .padding(4)
                                .background(Color("GraphColorSet"))
                                .cornerRadius(10)
                                .frame(width: geometry.size.width-14, height: geometry.size.height/2)
                            
                            // Fat Graph
                            GraphDataViewer(data: data[3], chart_title: "Fat", colorGradient: GradientColors.prplNeon, lineColor: .green)
                                .padding(4)
                                .background(Color("GraphColorSet"))
                                .cornerRadius(10)
                                .frame(width: geometry.size.width-14, height: geometry.size.height/2)
                        } else {
                            Spacer()
                            Text("No data exists")
                                .foregroundColor(Color("InvertedColorSet"))
                                .padding()
                        }
                    } // end of ScrollView's VStack
                } // end of ScrollView
            }.frame(width: geometry.size.width, height: geometry.size.height)
        }
    }
}

struct GraphsView_Previews: PreviewProvider {
    static var previews: some View {
        GraphsView()
    }
}
