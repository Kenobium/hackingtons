//
//  RecordsView.swift
//  hackingtons
//
//  Created by Dhruv Ranganath on 10/28/23.
//

import SwiftUI

struct RecordsView: View {
    var body: some View {
        Record(name: "Jane Smith", dob: "03/12/1975")
    }
}

struct Record: View {
    var name: String
    var dob: String
    
    var body: some View {
        HStack(spacing: 20.0) {
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(.blue)
                
                
            VStack {
                Text(name)
                    .font(.headline)
                Text(dob)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
            
        }
        .padding()
        .frame(height: 75.0)
        .cornerRadius(/*@START_MENU_TOKEN@*/8.0/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    RecordsView()
}
