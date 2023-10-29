//
//  HRView.swift
//  hackingtons
//
//  Created by Dhruv Ranganath on 10/29/23.
//

import SwiftUI

struct HRView: View {
    var rec: Record
    var body: some View {
        List {
            Section(header: Text("Last measurement")) {
                ListItem("Date", rec.vitals.pulseDates[0])
                ListItem("Measurement", rec.vitals.pulse[0])
            }
            Section(header: Text("Past measurements")) {
                ForEach(rec.vitals.pulse.indices, id: \.self) { i in
                    ListItem(rec.vitals.pulseDates[i], rec.vitals.pulse[i])
                }
            }
        }
        .navigationTitle("Heart Rate")
    }
}

#Preview {
    HRView(rec: records[0])
}
