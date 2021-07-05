//
//  WeatherView.swift
//  Forecast
//
//  Created by SOYEONG on 2021/07/04.
//


import SwiftUI

struct ForecastView: View {
    
    @ObservedObject var viewModel: ForecastViewModel
    
    var body: some View {
        
        ZStack{
            
            Image("background").resizable()
                .ignoresSafeArea()
            
            VStack{
                Text(viewModel.cityName)
                    .font(.title2)
                    .padding()
                
                Spacer()
                
                HStack {
                    Text(viewModel.weatherIcon)
                        .font(.system(size: 50))
                        .padding(.leading)
                    
                    Text(viewModel.weatherDescription)
                        .font(.title2)
                    Spacer()
                }
                
                HStack {
                    Text(viewModel.tempMax)
                        .padding(.leading)
                    Text(viewModel.tempMin)
                    Spacer()
                }
                
                HStack {
                    Text(viewModel.temperature)
                        .font(.system(size: 70))
                        .padding(.leading)
                    Spacer()
                }
                
            }.onAppear(perform: viewModel.refresh)
            .foregroundColor(Color.white)
        }

    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
            ForecastView(viewModel: ForecastViewModel(forecastService: ForecastService())
            )
    }
}
