import Foundation

struct Employee: Codable, Identifiable, Hashable {
   let id = UUID()
    let name: String
    let age: Int
    let salary: Int
}

struct EmployeeResponse: Codable {
    let employees: [Employee]
}
