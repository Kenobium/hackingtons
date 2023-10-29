//
//  SwiftUIView.swift
//  hackingtons
//
//  Created by Dhruv Ranganath on 10/28/23.
//

import SwiftUI

struct PatientView: View {
    var rec: Record
    var body: some View {
        List {
            AlertsView(rec: rec)
            BasicInfoView(rec: rec)
            NavigationLink {
                MedicalHistoryView(rec: rec)
            } label: {
                Text("Medical History")
            }
            MedicationHistoryView(rec: rec)
            Section (header: Text("Vitals")) {
                NavigationLink {
                    BPView(rec: rec)
                } label: {
                    Text("Blood Pressure")
                }
                NavigationLink {
                    HRView(rec: rec)
                } label: {
                    Text("Heart Rate")
                }
            }
            LabView(rec: rec)
        }
        .navigationTitle(rec.name)
    }
}

struct ListItem: View {
    var key: String
    var val: String
    var body: some View {
        HStack {
            Text(key)
                .foregroundColor(Color.gray)
            Spacer()
            Text(val)
        }
    }
    init(_ key: String, _ val: String) {
        self.key = key
        self.val = val
    }
}


struct BasicInfoView: View {
    var rec: Record
    var body: some View {
        Section (header: Text("Basic info")) {
            ListItem("DOB", "\(rec.dob)")
            ListItem("Sex", "\(rec.sex)")
        }
    }
}

struct MedicationHistoryView: View {
    var rec: Record
    var body: some View {
        Section (header: Text("Medication History")) {
            ForEach(rec.meds) { med in
                VStack(alignment: .leading) {
                    HStack {
                        Text(med.name)
                            .font(.headline)
                        Text(med.dosage)
                    }
                    Text("Prescribed for \(med.disease)")
                        .font(.subheadline)
                    
                    Text(med.directions)
                        .font(.body)
                        .padding(.top, -1.0)
                }
            }
        }
    }
}

struct AllergiesView: View {
    var rec: Record
    var body: some View {
        Section (header: Text("Allergies and adverse reactions")) {
            ForEach(rec.allergies) { allergy in
                VStack(alignment: .leading) {
                    Text(allergy.drug)
                        .font(.headline)
                    Text(allergy.rxn)
                }
            }
        }
    }
}

struct LabView: View {
    var rec: Record
    var body: some View {
        Section(header: Text("Lab Results")) {
            ListItem("Date", rec.lab.date)
            ForEach(rec.lab.labs.indices, id: \.self) { i in
                ListItem(rec.lab.labs[i], rec.lab.vals[i])
            }
        }
    }
}

#Preview {
    PatientView(rec: records[0])
}
