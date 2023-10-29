//
//  AlertsView.swift
//  hackingtons
//
//  Created by Dhruv Ranganath on 10/29/23.
//

import SwiftUI
import OpenAI

var titles: [String] = [];
var descs: [String] = [];
var priorities: [String] = [];

struct AlertsView: View {
    var rec: Record
    @ObservedObject var generator: Generator
    @State private var hasGenerated = false
    @State var alerts: [Alert] = [Alert(priority: Priority.high, title: "Generating, please wait...", desc: "Go back")];
    init() {
        generator = Generator(record: rec)
    }
    var body: some View {
        Section (header: Text("alerts")) {
            ForEach(alerts) { alert in
                AlertItem(alert)
            }
        }
        .task {
            guard !hasGenerated else { return }
            hasGenerated = true
            generator.generateAlerts(record: records_full[0], alerts: alerts)
        }
    }
}

final class Generator: ObservableObject {
    private var openAI: OpenAI
    private var resDict: [String: [String]]? = [:]
    var record: String
    init(record: Record) {
        self.openAI = OpenAI(apiToken: "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")
        self.record = record.full
    }
    let functions = [
        ChatFunctionDeclaration(
            name: "getAlerts",
            description: "Get CDSS-style alerts, given a patient record. Each alert should be stored separately across arrays",
            parameters:
                JSONSchema(
                    type: .object,
                    properties: [
                        "priority": .init(type: .array, description: "The priorities of each alert from low to high", items: .init(type: .string), enumValues: ["low", "med", "high"]),
                        "title": .init(type: .array, description: "A few-word summary of each alert", items: .init(type: .string)),
                        "content": .init(type: .array, description: "The main body of each alert", items: .init(type: .string))
                    ],
                    required: ["priority", "title", "content"]
                )
        )
    ]
    func generateAlerts(record: String, alerts: [Alert]) {
        let query = ChatQuery(
            model: "gpt-3.5-turbo-16k",  // 0613 is the earliest version with function calls support.
            messages: [
                Chat(role: .system, content: "You are an implementation of a clinical decision support system (CDSS). You will be provided with information from the patient's medical record. Generate the most relevant alerts that I, as a physician, would need to be aware of when treating the patient and assign each alert a priority score of 'low', 'med', or 'high'. Each array in the output should contain corresponding elements. Sort the alerts from highest to lowest priority."),
                Chat(role: .user, content: record)
            ],
            functions: functions,
            functionCall: .function("getAlerts")
        )
        openAI.chats(query: query) { partialResult in
            switch partialResult {
            case .success(let result):
                resDict = try? JSONSerialization.jsonObject(with:result.choices[0].message.functionCall?.arguments?.data(using: .utf8) ?? Data()) as? [String: [String]]
                print(resDict!)
                for i in self.resDict!["title"]!.indices {
                    alerts.append(Alert(priority: Priority(rawValue: resDict!["priority"]![i])!, title: resDict!["title"]![i], desc: resDict!["content"]![i]))
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

struct AlertView: View {
    var alert: Alert
    var body: some View {
        List {
            Section (header: Text("Full text")) {
                HStack {
                    Text("Priority")
                    Spacer()
                    Text(alert.priority.name)
                        .foregroundColor(alert.priority.color)
                }
                
                Text(alert.desc)
            }
        }
        .navigationTitle(alert.title)
    }
}

enum Priority: String{
    case low, med, high
    var color: Color {
        switch self {
        case .low:
            return Color(.systemGreen)
        case .med:
            return Color(.systemOrange)
        case .high:
            return Color(.systemRed)
        }
    }
    var name: String {
        switch self {
        case .low:
            return "Low"
        case .med:
            return "Medium"
        case .high:
            return "High"
        }
    }
}

struct AlertItem: View {
    var alert: Alert
    
    init(_ alert: Alert) {
        self.alert = alert
    }
    
    var body: some View {
        NavigationLink {
            AlertView(alert: alert)
        } label: {
            HStack {
                Text(alert.title)
                    .foregroundColor(alert.priority.color)
            }
        }
    }
}

struct Alert: Identifiable {
    var id = UUID()
    var priority: Priority
    var title: String
    var desc: String
}
