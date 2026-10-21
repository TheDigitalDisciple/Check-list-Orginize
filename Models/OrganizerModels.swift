
import Foundation

struct ChecklistItem: Identifiable, Codable {
    var id: UUID = UUID()
    var title: String
    var isCompleted: Bool = false
    var dueDate: Date? = nil
}

struct Checklist: Identifiable, Codable {
    var id: UUID = UUID()
    var name: String
    var category: String
    var items: [ChecklistItem] = []
}
