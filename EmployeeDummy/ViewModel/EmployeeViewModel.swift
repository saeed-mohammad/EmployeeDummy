//
//  EmployeeViewModel.swift
//  EmployeeDummy
//
//  Created by saeed shaikh on 24/06/26.
//

import Foundation
import Combine

@MainActor
class EmployeeViewModel: ObservableObject {

    @Published var employees: [Employee] = []
    @Published var isLoading = false
   
    func fetchEmployees() async {
       isLoading = true
        guard let url = URL(string: "https://aamras.com/dummy/EmployeeDetails.json") else {
           print("Invalid URL")
           isLoading = false
            return
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            let response = try JSONDecoder().decode(EmployeeResponse.self, from: data)

            employees = response.employees
            isLoading = false
//            print("Response: \(employees)")

        } catch {
           isLoading = false
            print("Error: \(error.localizedDescription)")
        }
    }
}
