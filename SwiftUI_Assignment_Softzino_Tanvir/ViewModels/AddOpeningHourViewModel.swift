//
//  AddOpeningHourViewModel.swift
//  SwiftUI_Assignment_Softzino_Tanvir
//
//  Created by MD Tanvir Alam on 30/8/21.
//

import Foundation

class AddOpeningHourViewModel:ObservableObject{
    @Published var selectedDay:String = "Friday"
    @Published var startingHour = Date()
    @Published var closingHour = Date()
}
