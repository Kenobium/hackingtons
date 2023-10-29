//
//  PatientModel.swift
//  hackingtons
//
//  Created by Dhruv Ranganath on 10/28/23.
//

import Foundation


struct Record : Identifiable {
    var id = UUID()
    var name: String
    var dob: String
    var sex: String
    var meds: [Medication]
    var conditions: [String]
    var surgicalHistory: [String]
    var allergies: [Allergy]
    var vitals: Vitals
    var lab: Lab
    var full: String;
}

struct Medication : Identifiable {
    var id = UUID()
    var name: String
    var dosage: String
    var disease: String
    var directions: String
}

struct Allergy : Identifiable {
    var id = UUID()
    var drug: String
    var rxn: String
}

struct Vitals : Identifiable {
    var id = UUID()
    var pulse: [String]
    var pulseDates: [String]
    var bp: [String]
    var bpDates: [String]
}

struct Lab: Identifiable {
    var id = UUID()
    var date: String
    var labs: [String]
    var vals: [String]
}

let records = [
    Record(name: "Jane Smith", dob: "03/12/1975", sex: "F", meds: [
        Medication(name: "Lisinopril", dosage: "20mg", disease: "hypertension", directions: "Take once daily"),
        Medication(name: "Metformin", dosage: "1000mg", disease: "Type 2 Diabetes", directions: "Take twice daily"),
        Medication(name: "Ibuprofen", dosage: "400mg", disease: "Back pain", directions: "Take as needed"),
    ], conditions: [
        "Hypertension", "Type 2 Diabetes", "Chronic back pain", "Seasonal allergies"
    ], surgicalHistory: [
        "Appendectomy in 1990"
    ], allergies: [
        Allergy(drug: "Sulfa Drugs", rxn: "Rash reported in 2010")
    ], vitals: Vitals(
        pulse: ["72 bpm", "70 bpm", "75 bpm"],
        pulseDates: ["10/15/2023", "01/2023", "08/2022"],
        bp: ["130/82 mmHg", "128/80 mmHg", "135/85 mmHg"],
        bpDates: ["10/15/2023", "01/2023", "08/2022"]
    ), lab: Lab(
        date: "10/10/2023",
        labs: ["Glucose", "LDL Cholesterol", "HDL Cholesterol", "Hemoglobin A1C"],
        vals: ["120 mg/dL", "110 mg/dL", "50 mg/dL", "7.2%"]
    ), full:
                """
                Patient Information:
                - Name: Jane Smith
                - Date of Birth: March 12, 1975
                - Gender: Female
                
                Medical History:
                - Past Medical Conditions: Hypertension, Type 2 Diabetes
                - Surgical History: Appendectomy in 1990
                - Known Medical Issues: Chronic back pain, seasonal allergies
                
                Medication History:
                1. Lisinopril - 20mg, once daily (Prescribed for hypertension)
                2. Metformin - 1000mg, twice daily (Prescribed for Type 2 Diabetes)
                3. Ibuprofen - 400mg, as needed for back pain (No reported adverse reactions)
                
                Allergies and Adverse Reactions:
                1. Penicillin - No known allergies
                2. Sulfa Drugs - Rash reported in 2010
                
                Vital Signs:
                - Blood Pressure:
                  - Last Measurement (October 15, 2023): 130/82 mmHg
                  - Historical Data:
                    - January 2023: 128/80 mmHg
                    - August 2022: 135/85 mmHg
                
                - Heart Rate:
                  - Last Measurement (October 15, 2023): 72 bpm
                  - Historical Data:
                    - January 2023: 70 bpm
                    - August 2022: 75 bpm
                
                Laboratory Results:
                - Recent Blood Tests (October 10, 2023):
                  - Glucose: 120 mg/dL
                  - Cholesterol:
                    - LDL: 110 mg/dL
                    - HDL: 50 mg/dL
                  - Hemoglobin A1c: 7.2%
                
                Imaging Results:
                - X-ray of Lumbar Spine (September 25, 2023):
                  - Findings: Mild degenerative changes, no acute abnormalities.
                
                Procedures and Interventions:
                - Appendectomy in 1990
                - Annual flu vaccination (Last administered on September 1, 2023)
                
                Family Medical History:
                - Father: Hypertension and Coronary Artery Disease
                - Mother: Type 2 Diabetes
                - Siblings:
                  - Brother: Asthma
                  - Sister: No significant medical history reported
                
                Social History:
                - Smoking Status: Non-smoker
                - Alcohol Use: Occasional, social drinker
                - Diet: Balanced diet with a focus on low sodium and low sugar
                - Exercise: Regular walks and light exercises
                
                Current Symptoms and Complaints:
                - Chronic back pain (Ongoing)
                - Seasonal allergies (Spring and Fall)
                
                Care Plans and Treatment History:
                - Ongoing management of hypertension and Type 2 Diabetes
                - Physical therapy for back pain
                
                Hospitalization History:
                - None reported
                
                Advanced Directives:
                - No advanced directives on file
                
                Functional Status:
                - Able to perform activities of daily living independently.
                
                Patient Preferences:
                - Values maintaining an active lifestyle and independence.
                - Preferences for conservative management of chronic conditions.
                
                Genetic and Genomic Information:
                - No specific genetic testing or genomic information available.
                """
          )
]

//    Record(name: "Robert Johnson", dob: "11/05/1962", sex: "M"),
//    Record(name: "Maria Rodriguez", dob: "02/20/1988", sex: "F"),
//    Record(name: "William Turner", dob: "09/08/1960", sex: "M")

let records_full = [
    """
    Patient Information:
    - Name: Maria Rodriguez
    - Date of Birth: February 20, 1988
    - Gender: Female
    
    Medical History:
    - Past Medical Conditions: Asthma, Migraines
    - Surgical History: None reported
    - Known Medical Issues: Seasonal allergies, occasional migraines
    
    Medication History:
    1. Albuterol Inhaler - As needed (Prescribed for Asthma)
    2. Sumatriptan - 50mg, as needed for migraines
    3. Loratadine - 10mg, once daily (Seasonal Allergies)
    
    Allergies and Adverse Reactions:
    1. None reported
    
    Vital Signs:
    - Blood Pressure:
      - Last Measurement (October 14, 2023): 118/76 mmHg
      - Historical Data:
        - January 2023: 120/78 mmHg
        - August 2022: 122/80 mmHg
    
    - Heart Rate:
      - Last Measurement (October 14, 2023): 68 bpm
      - Historical Data:
        - January 2023: 72 bpm
        - August 2022: 70 bpm
    
    Laboratory Results:
    - Recent Blood Tests (October 10, 2023):
      - Complete Blood Count (CBC): Within normal range
      - IgE levels: Elevated due to allergies
    
    Imaging Results:
    - None reported
    
    Procedures and Interventions:
    - Pulmonary Function Tests (PFTs) for asthma monitoring
    - Neurology consultation for migraine management
    
    Family Medical History:
    - Father: Hypertension
    - Mother: Migraines
    - Siblings:
      - Brother: No significant medical history reported
      - Sister: Allergic rhinitis
    
    Social History:
    - Smoking Status: Non-smoker
    - Alcohol Use: Occasional, social drinker
    - Diet: Balanced diet with attention to trigger foods for migraines
    - Exercise: Regular cardio exercises, weather permitting
    
    Current Symptoms and Complaints:
    - Occasional shortness of breath (Asthma)
    - Migraines (Infrequent)
    
    Care Plans and Treatment History:
    - Asthma action plan with rescue inhaler
    - Migraine diary for trigger identification
    
    Hospitalization History:
    - None reported
    
    Advanced Directives:
    - No advanced directives on file
    
    Functional Status:
    - Full functionality with occasional limitations during asthma exacerbations.
    
    Patient Preferences:
    - Values proactive management of asthma and migraines.
    - Prefers non-pharmacological interventions when possible.
    
    Genetic and Genomic Information:
    - No specific genetic testing or genomic information available.
    """,
    """
    Patient Information:
    - Name: Maria Rodriguez
    - Date of Birth: February 20, 1988
    - Gender: Female
    
    Medical History:
    - Past Medical Conditions: Asthma, Migraines
    - Surgical History: None reported
    - Known Medical Issues: Seasonal allergies, occasional migraines
    
    Medication History:
    1. Albuterol Inhaler - As needed (Prescribed for Asthma)
    2. Sumatriptan - 50mg, as needed for migraines
    3. Loratadine - 10mg, once daily (Seasonal Allergies)
    
    Allergies and Adverse Reactions:
    1. None reported
    
    Vital Signs:
    - Blood Pressure:
      - Last Measurement (October 14, 2023): 118/76 mmHg
      - Historical Data:
        - January 2023: 120/78 mmHg
        - August 2022: 122/80 mmHg
    
    - Heart Rate:
      - Last Measurement (October 14, 2023): 68 bpm
      - Historical Data:
        - January 2023: 72 bpm
        - August 2022: 70 bpm
    
    Laboratory Results:
    - Recent Blood Tests (October 10, 2023):
      - Complete Blood Count (CBC): Within normal range
      - IgE levels: Elevated due to allergies
    
    Imaging Results:
    - None reported
    
    Procedures and Interventions:
    - Pulmonary Function Tests (PFTs) for asthma monitoring
    - Neurology consultation for migraine management
    
    Family Medical History:
    - Father: Hypertension
    - Mother: Migraines
    - Siblings:
      - Brother: No significant medical history reported
      - Sister: Allergic rhinitis
    
    Social History:
    - Smoking Status: Non-smoker
    - Alcohol Use: Occasional, social drinker
    - Diet: Balanced diet with attention to trigger foods for migraines
    - Exercise: Regular cardio exercises, weather permitting
    
    Current Symptoms and Complaints:
    - Occasional shortness of breath (Asthma)
    - Migraines (Infrequent)
    
    Care Plans and Treatment History:
    - Asthma action plan with rescue inhaler
    - Migraine diary for trigger identification
    
    Hospitalization History:
    - None reported
    
    Advanced Directives:
    - No advanced directives on file
    
    Functional Status:
    - Full functionality with occasional limitations during asthma exacerbations.
    
    Patient Preferences:
    - Values proactive management of asthma and migraines.
    - Prefers non-pharmacological interventions when possible.
    
    Genetic and Genomic Information:
    - No specific genetic testing or genomic information available.
    """
]
