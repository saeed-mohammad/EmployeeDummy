//
//  EmployeeViewModel.swift
//  EmployeeDummy
//
//  Created by saeed shaikh on 24/06/26.
//

import Foundation
import Combine

class EmployeeViewModel: ObservableObject {

    @Published var employees: [Employee] = []

    func fetchEmployees() async {

        guard let url = URL(string: "https://aamras.com/dummy/EmployeeDetails.json") else {
           print("Invalid URL")
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            let response = try JSONDecoder().decode(EmployeeResponse.self, from: data)

            employees = response.employees
//            print("Response: \(employees)")

        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
}
