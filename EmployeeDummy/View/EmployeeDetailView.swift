//
//  EmployeeDetailView.swift
//  EmployeeDummy
//
//  Created by saeed shaikh on 24/06/26.
//

import SwiftUI

struct EmployeeDetailView: View {
   
   let employee: Employee
   var body: some View {
      NavigationStack{
         VStack(spacing: 5) {
            Text(employee.name)
            Text("\(employee.age)")
            Text("\(employee.salary)")
         }
         .font(.largeTitle)
         .frame(maxWidth: .infinity, maxHeight: .infinity)
         .navigationTitle("Employee Details")
         .navigationBarTitleDisplayMode(.inline)
      }
   }
}

#Preview {
   let sample = Employee(name: "xyz", age: 123, salary: 987)
   EmployeeDetailView(employee: sample)
}
