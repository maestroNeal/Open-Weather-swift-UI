//
//  HourlyWeatherView.swift
//  Atmosphere
//
//  Created by Rahul Gangwar on 13/10/24.
//

import SwiftUI

struct HourlyWeatherView: View {
    @ObservedObject var cityVM: CityViewModel
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ForEach(cityVM.weather.hourly){ weather in
                    let icon = HelperFunction().getWeatherIconFor(icon: weather.weather.count > 0 ? weather.weather[0].icon : "sun.max.fill")
                    let hours = HelperFunction().getTimeFor(time: weather.dt)
                    let temp = HelperFunction().getTempFor(temp: weather.temp)
                    getHourlyView(hours: hours, image: icon, temp: temp)
                }
            }
        }
    }
    
    private func getHourlyView(hours: String, image: Image, temp: String) -> some View {
        VStack(spacing: 20, content: {
            Spacer()
            Text("\(hours)")
            Spacer()
            image
                .foregroundColor(.yellow)
            Spacer()
            Text("\(temp)")
        })
        .foregroundColor(.white)
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).fill(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.5), Color.blue]), startPoint: .top, endPoint: .bottom)).opacity(0.3))
        .shadow(color: Color.white.opacity(0.1), radius: 2,x: -2, y: -2)
        .shadow(color: Color.black.opacity(0.3), radius: 2,x: 2, y: 2)
    }
    
    
}

#Preview {
    HourlyWeatherView(cityVM: CityViewModel())
}
