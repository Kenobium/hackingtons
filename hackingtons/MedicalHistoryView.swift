//
//  MedicalHistoryView.swift
//  hackingtons
//
//  Created by Dhruv Ranganath on 10/29/23.
//

import SwiftUI

struct MedicalHistoryView: View {
    var rec: Record
    var body: some View {
        List {
            Section (header: Text("Known conditions")) {
                ForEach(rec.conditions, id: \.self) { c in
                    Text(c)
                }
            }
            Section (header: Text("Surgical history")) {
                ForEach(rec.surgicalHistory, id: \.self) { s in
                    Text(s)
                }
            }
        }
        .navigationTitle("Medical History")
    }
}

#Preview {
    MedicalHistoryView(rec: records[0])
}
