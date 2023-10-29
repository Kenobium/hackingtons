//
//  RecordsView.swift
//  hackingtons
//
//  Created by Dhruv Ranganath on 10/28/23.
//

import SwiftUI

struct RecordsView: View {
    
    var body: some View {
        NavigationView() {
            List(records) { rec in
                Section {
                    NavigationLink {
                        PatientView(rec: rec)
                    } label: {
                        RecordItem(rec: rec)
                    }
                }
                .listSectionSpacing(12)
            }
            .navigationTitle("Patient Records")
        }
    }
}

struct RecordItem: View {
    var rec: Record
    var body: some View {
        HStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .scaledToFit()
                .foregroundColor(.blue)
            
            VStack(alignment: .leading) {
                Text(rec.name)
                    .font(.headline)
                Text("DOB: \(rec.dob)")
                Text("Sex: \(rec.sex)")
            }
            .padding(.leading)
            
            Spacer()
            
        }
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .frame(height: 75)
        
        
    }
}

#Preview {
    RecordsView()
}

