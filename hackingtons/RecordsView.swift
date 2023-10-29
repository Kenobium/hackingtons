//
//  RecordsView.swift
//  hackingtons
//
//  Created by Dhruv Ranganath on 10/28/23.
//

import SwiftUI

struct RecordsView: View {
    let records = [
        Record(name: "Jane Smith", dob: "03/12/1975"),
        Record(name: "Robert Johnson", dob: "11/05/1962"),
        Record(name: "Maria Rodriguez", dob: "02/20/1988"),
        Record(name: "William Turner", dob: "09/08/1960")
    ]
    
    var body: some View {
        NavigationView() {
            List(records) { rec in
                RecordItem(name: rec.name, dob: rec.dob)
            }
            .navigationTitle("Patient Records")
        }
        
    }
}

struct Record: Identifiable {
    var id = UUID()
    var name: String
    var dob: String
}

struct RecordItem: View {
    var name: String
    var dob: String
    
    var body: some View {
        HStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .scaledToFit()
                .foregroundColor(.blue)
            
            VStack(alignment: .leading) {
                Text(name)
                    .font(.headline)
                Text("DOB: \(dob)")
            }
            .padding(.leading)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
            
        }
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .frame(height: 75)
        
        
    }
}

#Preview {
    RecordsView()
}

