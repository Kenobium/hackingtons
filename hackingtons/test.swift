//
//  ContentView.swift
//  hackingtons
//
//  Created by Dhruv Ranganath on 10/28/23.
//

import SwiftUI

struct test: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Today")) {
                    HealthDataRow(title: "Steps", value: "8,543", unit: "steps")
                    HealthDataRow(title: "Distance", value: "4.2", unit: "km")
                    // Add more data rows for other metrics
                }
                
                Section(header: Text("Activity")) {
                    Text("Weekly Summary")
                        .font(.headline)
                        .padding(.vertical, 8)
                    
                    ActivityRow(title: "Workout", duration: "45 min")
                    ActivityRow(title: "Cycling", duration: "30 min")
                    // Add more activity rows
                }
                
                // Add more sections for other parts of the Health app
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Patient Records")
        }
    }
}

struct HealthDataRow: View {
    var title: String
    var value: String
    var unit: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                Text("\(value) \(unit)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
    }
}

struct ActivityRow: View {
    var title: String
    var duration: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                Text(duration)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
    }
}

#Preview {
    test()
}
