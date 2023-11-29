//
//  ContentView.swift
//  MealExpenses
//
//  Created by Po Hsiang Chao on 2023/11/29.
//

import SwiftUI

struct ContentView: View {
    @State private var breakfastCost = 0.0
    @State private var lunchCost = 0.0
    @State private var dinnerCost = 0.0
    @State private var otherCost = 0.0
    @State private var coffeePrice = 3 // Default value
    
    let coffeePrices = [3, 5, 10, 15, 20]

    var monthlyTotal: Double {
        (breakfastCost + lunchCost + dinnerCost + otherCost) * 30
    }
    
    var cupsOfCoffee: Int {
        Int(monthlyTotal) / coffeePrice
    }
    
    var currencyFormat: FloatingPointFormatStyle<Double>.Currency {
        .currency(code: Locale.current.currency?.identifier ?? "USD")
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Breakfast")) {
                    TextField("Amount", value: $breakfastCost, format: currencyFormat)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Lunch")) {
                    TextField("Amount", value: $lunchCost, format: currencyFormat)
                        .keyboardType(.decimalPad)
                }

                Section(header: Text("Dinner")) {
                    TextField("Amount", value: $dinnerCost, format: currencyFormat)
                        .keyboardType(.decimalPad)
                }

                Section(header: Text("Other Meals")) {
                    TextField("Amount", value: $otherCost, format: currencyFormat)
                        .keyboardType(.decimalPad)
                }
                
                Section {
                    Picker("Coffee Price", selection: $coffeePrice) {
                        ForEach(coffeePrices, id: \.self) {
                            Text("\($0)")
                        }
                    }
                } header: {
                    Text("Select the price of a coffee")
                }
                
                Section {
                    Text("Monthly Total: \(monthlyTotal, format: currencyFormat)")
                }
                
                Section {
                    Text("Cups of coffee: \(cupsOfCoffee)")
                } header: {
                    Text("Coffee Equivalent")
                }
            }
            .navigationTitle("Meal Expenses")
        }
    }
}

#Preview {
    ContentView()
}
