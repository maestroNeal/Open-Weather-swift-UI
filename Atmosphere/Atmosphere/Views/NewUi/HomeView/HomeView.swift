//
//  HomeView.swift
//  Atmosphere
//
//  Created by Rahul Gangwar on 11/11/24.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var cityVM: CityViewModel
    
    var body: some View {
        
        ZStack(){
            appColors.primaryColor.color
                .edgesIgnoringSafeArea(.all)
            
            CustomShapeWithDottedLine( animeName: "rainNew", archHeight: 30, notchRadius: 10, fromTop: 190,fromLeft: 10,fromRight: 10,lineColor: appColors.primaryColor.color, fillColor: .blue)
            
            VStack{
                
                NewHeaderView(headerText: "Noida", isBackRequired: false, isSearchTapped: {
                })
                .padding(.top, 10)
                todayView()
                todayInfo()
                Spacer()
              
                ZStack{
                    VStack{
                        Text("Get Your Location")
                            .font(.title2)
                            .bold()
                        Text("Weather")
                            .font(.title3)
                            .bold()
                    }
                }
                .frame(width: UIScreen.main.bounds.width - 30)
                .frame(height: 60)
                Spacer()
              
            }
            
            
        }
    }
    private func todayView() -> some View {
        HStack{
            Text("Date")
                .font(.title2)
            Spacer()
            Text("temp")
                .font(.title)
            Spacer()
            Text("weather")
                .font(.title2)
        }
        .padding(.leading, 50)
        .padding(.trailing, 50)
        .padding()
    }
    private func todayInfo() -> some View {
        VStack{
            HStack{
                LottieView(animeName: "clouds")
                    .frame(width: UIScreen.main.bounds.width - 30 , height: 100)
                    .padding(.leading, 15)
                    .padding()
                Spacer()
            }
            
            HStack{
                LottieView(animeName: "watch")
                    .frame(width: UIScreen.main.bounds.width/2, height: UIScreen.main.bounds.width/2)
                    .padding()
                Spacer()
                VStack{
                    widgetView(imageName: "wind", color: Color.green, title: "speed mi/hr")
                    widgetView(imageName: "drop.fill", color: Color.green, title: "humidity")
                    widgetView(imageName: "umbrella.fill", color: Color.green, title: "rainChance")
                }
            }
            .padding(.trailing, 50)
        }
    }
    
    private func widgetView(imageName: String, color: Color, title: String) -> some View {
        
        VStack{
            Image(systemName: imageName)
                .padding()
                .font(.title)
                .frame(width: 70,height: 60)
                .foregroundColor(appColors.buttonColor.color)
                .background(RoundedRectangle(cornerRadius: 10).fill(appColors.primaryColor.color.opacity(1)))
            Text(title)
                .foregroundColor(color)
        }
        .shadow(color: appColors.primaryColor.color.opacity(0.2), radius: 4,x: -4, y: -4)
        .shadow(color: appColors.primaryColor.color.opacity(0.2), radius: 4,x: -4, y: -4)
    
    }
    
//    private func hourlyData() -> some View {
//      
//            HStack{
//                ForEach(cityVM.weather.hourly){ weather in
//                    let icon = HelperFunction().getWeatherIconFor(icon: weather.weather.count > 0 ? weather.weather[0].icon : "sun.max.fill")
//                    let hours = HelperFunction().getTimeFor(time: weather.dt)
//                    let temp = HelperFunction().getTempFor(temp: weather.temp)
//                    
//                    getHourlyView(color: .clear, hours: hours, image: icon, temp: temp)
//                }
//            }
//        
//    }
//    private func getHourlyView(color: Color,hours: String, image: Image, temp: String) -> some View {
//        VStack(spacing: 20, content: {
//            Spacer()
//            Text("\(hours)")
//            image
//                .frame(width: 18 , height: 18)
//                .foregroundColor(.yellow)
//            Text("\(temp)")
//                .foregroundColor(color)
//        })
//        .foregroundColor(.white)
//        .padding()
//        .background(RoundedRectangle(cornerRadius: 10).fill(LinearGradient(gradient: Gradient(colors: [Color.clear.opacity(0.5), Color.blue]), startPoint: .top, endPoint: .bottom)).opacity(0.3))
//        .shadow(color: Color.white.opacity(0.1), radius: 2,x: -2, y: -2)
//        .shadow(color: Color.black.opacity(0.3), radius: 2,x: 2, y: 2)
//    }

}

#Preview {
    HomeView(cityVM: CityViewModel())
}
