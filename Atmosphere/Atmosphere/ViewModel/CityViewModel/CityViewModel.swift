//
//  CityViewModel.swift
//  Atmosphere
//
//  Created by HT-Mac-06 on 7/21/24.
//

import SwiftUI
import CoreLocation

final class CityViewModel : ObservableObject {
    @Published var weather = WeatherResponse.empty()
    @Published var city: String = "Unknown" {
        didSet {
            // call get location here
            getLocation()
        }
    }
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter
    }()
    
    private lazy var dayFormtter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE"
        return formatter
    }()
    
    private lazy var timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh a"
        return formatter
    }()
    
    init(){
        getLocation()
    }
    var date: String {
        return dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(weather.current.dt)))
    }
    var weatherIcon: String {
        if weather.current.weather.count > 0 {
            return weather.current.weather[0].icon
        }
        return "summer"
    }
    var tempareture: String{
        return HelperFunction().getTempFor(temp: weather.current.temp)
    }
    
    var weatherCondition: String {
        if weather.current.weather.count > 0 {
            return weather.current.weather[0].main
        }
        return "unknow!"
    }
    
    var windSpeed: String {
        return String(format: "%0.2f", weather.current.wind_speed)
    }
    
    var humidity: String {
        return String(format: "%d%%", weather.current.humidity)
    }
    
    var rainChance: String {
        return String(format: "%0.0f%%", weather.current.dew_point)
    }
    
    func getDayFor(timeStamp: Int) -> String{
        return dayFormtter.string(from: Date(timeIntervalSince1970: TimeInterval(timeStamp)))
    }
    
    private func getLocation(){
        CLGeocoder().geocodeAddressString(city) { (placeMarks, error) in
            if let places = placeMarks, let place = places.first {
                //self.city = place.locality! as String
                self.getWeather(coordinates: place.location?.coordinate)
                print(place.country)
            }
            
        }
    }
    
    
    private func getWeather(coordinates: CLLocationCoordinate2D? ){
        if let coordinates = coordinates {
            print("my lat : \(coordinates.latitude), long : \(coordinates.longitude)")
            let urlString = Network.getUrlWithLatLong(lat: coordinates.latitude, lon: coordinates.longitude)
            getWeatherData(city: city, from: urlString)
        }else{
            //unable to get coordinate
            let urlString = Network.getUrlWithLatLong(lat: 50.0755, lon: 14.418540) // demo cordinates
            getWeatherData(city: city, from: urlString)
            
        }
    }
    
    private func getWeatherData(city: String, from urlString: String){
        NetworkManager<WeatherResponse>.fetchUrl(for: URL(string: urlString)!) { (result) in
            switch result {
            case .success(let success):
                DispatchQueue.main.async {
                    self.weather = success
                    print(self.weather)
                }
            case .failure(let failure):
                print(failure.localizedDescription)
            }
            
        }
    }
    
    
    
}

class HelperFunction: NSObject {
    
    
    func getTempFor(temp: Double) -> String {
        return String(format: "%0.2f", temp)
    }
    
    func getTimeFor(time: Int) ->String {
        return String(format: "%0.1f", time)
    }
    
    func getAnimation(icon: String) -> String {
        switch icon {
        case "01d":
            return "dayClearSky"
        default:
            return "nightClearSky"
        }
        
    }
    
    func getWeatherIconFor(icon: String) -> Image {
        switch icon {
        case "01d":
            return Image(systemName: "sun.fill.max")
        default:
            return Image(systemName: "moon.fill")
        }
        
    }
}
