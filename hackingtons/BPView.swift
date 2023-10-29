//
//  VitalsView.swift
//  hackingtons
//
//  Created by Dhruv Ranganath on 10/29/23.
//

import SwiftUI

struct BPView: View {
    var rec: Record
    var body: some View {
        List {
            Section(header: Text("Last measurement")) {
                ListItem("Date", rec.vitals.bpDates[0])
                ListItem("Measurement", rec.vitals.bp[0])
            }
            Section(header: Text("Past measurements")) {
                ForEach(rec.vitals.bp.indices, id: \.self) { i in
                    ListItem(rec.vitals.bpDates[i], rec.vitals.bp[i])
                }
            }
        }
        .navigationTitle("Blood Pressure")
    }
}

#Preview {
    BPView(rec: records[0])
}
