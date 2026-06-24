//
//  ContentView.swift
//  EmployeeDummy
//
//  Created by saeed shaikh on 24/06/26.
//

import SwiftUI

struct ContentView: View {

    @StateObject private var viewModel = EmployeeViewModel()

    @State private var selectedEmployee: Employee?

    var body: some View {

       NavigationStack {
          if viewModel.employees.isEmpty {
             
             ContentUnavailableView(
               "No Employees",
               systemImage: "person.slash"
             )
             
          } else {
             
             List{
                ForEach(viewModel.employees){employee in
                   
                   VStack(alignment: .leading, spacing: 8) {
                      Text(employee.name)
                      Text("\(employee.age)")
                      Text("\(employee.salary)")
                   }
                   .font(.title)
                   .onTapGesture {
                      selectedEmployee = employee
                   }
                }
             }
             .navigationTitle("EmployeeDummy")
             .task {
                await viewModel.fetchEmployees()
             }
             .navigationDestination(item: $selectedEmployee) { employee in
                EmployeeDetailView(employee: employee)
             }
             
          }
       }
    }
}


#Preview {
    ContentView()
}
