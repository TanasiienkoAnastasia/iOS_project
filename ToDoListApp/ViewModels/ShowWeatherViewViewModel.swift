//
//  ShowWetherViewViewModel.swift
//  ToDoListApp
//
//  Created by Yarik Zavyalov on 05.01.2024.
//

import Foundation

class ShowWeatherViewViewModel: ObservableObject {
    @Published var weatherData: WeatherData?
    @Published var error: Error?

    @Published var city: String = "Kyiv" // Default city

    private let apiKey = "0e9ada303c0c97306f176f26dbb84875" // Replace with your OpenWeatherMap API key

    private let baseURL = "https://api.openweathermap.org/data/2.5/weather"

    func fetchWeatherData() {
        let urlString = "\(baseURL)?q=\(city)&appid=\(apiKey)"

        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                DispatchQueue.main.async {
                    if let data = data {
                        do {
                            self.weatherData = try JSONDecoder().decode(WeatherData.self, from: data)
                        } catch {
                            self.error = error
                        }
                    } else if let error = error {
                        self.error = error
                    }
                }
            }.resume()
        }
    }
}

struct WeatherData: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Decodable {
    let temp: Double
}

struct Weather: Decodable {
    let description: String
}
