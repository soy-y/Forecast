//
//  Forecast.swift
//  Forecast
//
//  Created by SOYEONG on 2021/07/04.
//

import Foundation

public struct Weather{
    let city: String
    let temperature: String
    let tempMin: String
    let tempMax: String
    let description: String
    let iconName: String

    init(response: APIResponse){
        city = response.name
        temperature = "\(Int(response.main.temp))"
        tempMin = "\(Int(response.main.temp_min))"
        tempMax = "\(Int(response.main.temp_max))"
        description = response.weather.first?.description ?? ""
        iconName = response.weather.first?.iconName ?? ""
    }
}
