//
//  ForecastViewModel.swift
//  Forecast
//
//  Created by SOYEONG on 2021/07/04.
//

import Foundation

private let defaultIcon = "❓"
private let iconMap = [
    "Drizzle" : "🌧",
    "Thunderstorm" : "⛈",
    "Rain" :  "🌧",
    "Snow" :  "❄️",
    "Clear" :  "☀️",
    "Clouds" : "☁️"
]

public class ForecastViewModel: ObservableObject {
    @Published var cityName: String = "City Name"
    @Published var temperature: String = "--"
    @Published var tempMin: String = "--"
    @Published var tempMax: String = "--"
    @Published var weatherDescription: String = "--"
    @Published var weatherIcon: String = defaultIcon
    // @Published var days: Array = []
    
    public let forecastService: ForecastService
    
    public init(forecastService: ForecastService) {
        self.forecastService = forecastService
    }
    
    public func refresh() {
        forecastService.loadWeatherData{ weather in
            DispatchQueue.main.async {
                self.cityName = weather.city
                self.temperature = "\(weather.temperature)℃"
                self.tempMin = "Min \(weather.tempMin)℃"
                self.tempMax = "Max \(weather.tempMax)℃"
                self.weatherDescription = weather.description.capitalized
                self.weatherIcon = iconMap[weather.iconName] ?? defaultIcon
            }
            
        }
    }
}
