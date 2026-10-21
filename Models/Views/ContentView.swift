import SwiftUI

struct ContentView: View {
    @State private var checklists: [Checklist] = [
        Checklist(
            name: "Daily Routine",
            category: "Personal",
            items: [
                ChecklistItem(title: "Plan my day"),
                ChecklistItem(title: "Complete my priorities"),
                ChecklistItem(title: "Review my progress")
            ]
        )
    ]

    var body: some View {
        NavigationStack {
            List {
                ForEach($checklists) { $checklist in
                    Section {
                        ForEach($checklist.items) { $item in
                            Toggle(
                                item.title,
                                isOn: $item.isCompleted
                            )
                        }
                    } header: {
                        VStack(alignment: .leading) {
                            Text(checklist.name)
                            Text(checklist.category)
                                .font(.caption)
                        }
                    } footer: {
                        let total = checklist.items.count
                        let completed = checklist.items.filter {
                            $0.isCompleted
                        }.count

                        ProgressView(
                            value: Double(completed),
                            total: Double(max(total, 1))
                        )

                        Text("\(completed) of \(total) completed")
                    }
                }
            }
            .navigationTitle("Organized")
        }
    }
}
