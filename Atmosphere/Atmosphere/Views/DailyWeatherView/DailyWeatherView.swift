//
//  DailyWeatherView.swift
//  Atmosphere
//
//  Created by Rahul Gangwar on 13/10/24.
//

import SwiftUI

struct DailyWeatherView: View {
    @ObservedObject var cityVM: CityViewModel
    
    var body: some View {
        ForEach(cityVM.weather.daily) { weather in
            LazyVStack {
                dailyWeatherCell(weather: weather)
            }
        }
    }
    
    private func dailyWeatherCell(weather: DailyWeather) -> some View {
        HStack {
            Text(cityVM.getDayFor(timeStamp: weather.dt).uppercased())
                .frame(width: 50)
            Spacer()
            Text("\(HelperFunction().getTempFor(temp: weather.temp.max)) ℉ | \(HelperFunction().getTempFor(temp: weather.temp.min)) ℉")
                .frame(width: 150)
            
           // Spacer()
           // Image(systemName: HelperFunction().getWeatherIconFor(icon: weather.weather.count > 0 ? weather.weather[0].icon : "sun.max.fill"))
        }
        .foregroundColor(.white)
        .padding(.horizontal, 40)
        .padding(.vertical, 15)
        .background(RoundedRectangle(cornerRadius: 10)
            .fill(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.5), Color.blue]), startPoint: .top, endPoint: .bottom))
            .opacity(0.3))
        .shadow(color: Color.white.opacity(0.1), radius: 2, x: -2, y: -2)
        .shadow(color: Color.black.opacity(0.3), radius: 2, x: 2, y: 2)
    }
}

#Preview {
    DailyWeatherView(cityVM: CityViewModel())
}
