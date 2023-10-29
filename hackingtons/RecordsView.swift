//
//  RecordsView.swift
//  hackingtons
//
//  Created by Dhruv Ranganath on 10/28/23.
//

import SwiftUI

struct RecordsView: View {
    let records = [
        Record(name: "Jane Smith", dob: "03/12/1975", gender: "F"),
        Record(name: "Robert Johnson", dob: "11/05/1962", gender: "M"),
        Record(name: "Maria Rodriguez", dob: "02/20/1988", gender: "F"),
        Record(name: "William Turner", dob: "09/08/1960", gender: "M")
    ]
    
    var body: some View {
        NavigationView() {
            List(records) { rec in
                Section {
                    RecordItem(name: rec.name, dob: rec.dob, gender: rec.gender)
                    
                }
                .listSectionSpacing(12)
            }
            .navigationTitle("Patient Records")
        }
    }
}

struct Record: Identifiable {
    var id = UUID()
    var name: String
    var dob: String
    var gender: String
}

struct RecordItem: View {
    var name: String
    var dob: String
    var gender: String
    
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
                Text("Gender: \(gender)")
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

