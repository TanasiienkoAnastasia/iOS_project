//
//  ShowWetherView.swift
//  ToDoListApp
//
//  Created by Yarik Zavyalov on 05.01.2024.
//

import SwiftUI

struct ShowWeatherView: View {
    @ObservedObject var viewModel = ShowWeatherViewViewModel()
    @State private var cityName: String = ""

    var body: some View {
        VStack {
            TextField("Enter City", text: $cityName, onCommit: {
                viewModel.city = cityName
                viewModel.fetchWeatherData()
            })
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .autocapitalization(.words)
            
            if let weatherData = viewModel.weatherData {
                Text("City: \(weatherData.name)")
                    .font(.title)
                    .padding()

                Text("Temperature: \(weatherData.main.temp-273) C")
                    .padding()

                Text("Description: \(weatherData.weather.first?.description ?? "")")
                    .padding()

                // Add more fields as needed

            } else if let error = viewModel.error {
                Text("Error: \(error.localizedDescription)")
            } else {
                Text("Loading...")
            }
        }
        .onAppear {
            viewModel.fetchWeatherData()
        }
    }
}

struct ShowWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        ShowWeatherView()
    }
}
