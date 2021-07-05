//
//  ForecastApp.swift
//  Forecast
//
//  Created by SOYEONG on 2021/07/03.
//

import SwiftUI

/*
 MVVM Architecture
 
 Model - data point
 View - UI
 ViewModel - manages Models for View

 */

@main
struct ForecastApp: App {
    var body: some Scene {
        WindowGroup {
            let forecastService = ForecastService()
            let viewModel = ForecastViewModel(forecastService: forecastService)
            ForecastView(viewModel: viewModel)
        }
    }
}
