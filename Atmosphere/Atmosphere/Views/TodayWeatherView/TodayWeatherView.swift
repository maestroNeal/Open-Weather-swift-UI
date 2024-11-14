//
//  TodayWeatherView.swift
//  Atmosphere
//
//  Created by Rahul Gangwar on 13/10/24.
//

import SwiftUI

struct TodayWeatherView: View {
    @ObservedObject var cityVM : CityViewModel
    
    var body: some View {
        VStack(spacing: 10){
            Text("Today")
                .font(.largeTitle)
                .bold()
            HStack(spacing: 20){
                LottieView(animeName: HelperFunction().getAnimation(icon: cityVM.weatherIcon))
                    .frame(width: 100,height: 100)
                    //.background(.black)
                VStack(alignment: .leading){
                    Text("\(cityVM.tempareture)℉")
                        .font(.system(size: 30))
                        .bold()
                    Text("\(cityVM.weatherCondition)")
                }
            }
            HStack{
                Spacer()
                widgetView(imageName: "wind", color: Color.green, title: "\(cityVM.windSpeed)mi/hr")
                Spacer()
                widgetView(imageName: "drop.fill", color: Color.green, title: "\(cityVM.humidity)")
                Spacer()
                widgetView(imageName: "umbrella.fill", color: Color.green, title: "\(cityVM.rainChance)")
                Spacer()
            }
        }
        .padding()
        .foregroundColor(.white)
        .background(RoundedRectangle(cornerRadius: 25).fill(LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.5), Color.blue]), startPoint: .top, endPoint: .bottom)).opacity(0.3))
        .shadow(color: Color.white.opacity(0.1), radius: 2,x: -2, y: -2)
        .shadow(color: Color.black.opacity(0.3), radius: 2,x: 2, y: 2)
    }
    private func widgetView(imageName: String, color: Color, title: String) -> some View {
        
        VStack{
            Image(systemName: imageName)
                .padding()
                .font(.title)
                .foregroundColor(color)
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.5)))
            Text(title)
        }
        
    }
}

#Preview {
    TodayWeatherView(cityVM: CityViewModel())
}
