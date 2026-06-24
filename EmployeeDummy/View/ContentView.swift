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
          if viewModel.isLoading {
             
             ProgressView("Loading Employees...")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .font(.title)
             
          }
          else if viewModel.employees.isEmpty {
             
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
                   .frame(maxWidth: .infinity, alignment: .leading)
                   .contentShape(Rectangle())
                   .onTapGesture {
                      selectedEmployee = employee
                   }
                }
             }
             .navigationTitle("EmployeeDummy")
             .navigationDestination(item: $selectedEmployee) { employee in
                EmployeeDetailView(employee: employee)
             }
             
          }
       }
       .task {
          await viewModel.fetchEmployees()
       }
    }
}


#Preview {
    ContentView()
}
