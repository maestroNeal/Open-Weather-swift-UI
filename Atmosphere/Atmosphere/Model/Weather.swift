//
//  Weather.swift
//  Atmosphere
//
//  Created by HT-Mac-06 on 7/21/24.
//



import Foundation

class Weather: Codable, Identifiable {
    var dt: Int
    var temp: Double
    var feel_like: Double
    var pressure: Double
    var humidity: Int
    var dew_point: Double
    var uvi: Double
    var clouds: Int
    var visibility: Int
    var wind_speed: Double
    var wind_deg: Int
    var wind_gust: Double
    var weather: [WeatherDetails]
    
    enum CodingKeys: String, CodingKey {
        case dt
        case temp
        case feel_like = "feels_like"
        case pressure
        case humidity
        case dew_point = "dew_point"
        case uvi
        case clouds
        case visibility
        case wind_speed = "wind_speed"
        case wind_deg = "wind_deg"
        case wind_gust = "wind_gust"
        case weather
    }
    
    init() {
        dt = 0
        temp = 0.0
        feel_like = 0.0
        pressure = 0.0
        humidity = 0
        dew_point = 0.0
        uvi = 0.0
        clouds = 0
        visibility = 0
        wind_speed = 0.0
        wind_deg = 0
        wind_gust = 0.0
        weather = [WeatherDetails(main: "", description: "", icon: "")]
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        dt = try container.decode(Int.self, forKey: .dt)
        temp = try container.decode(Double.self, forKey: .temp)
        feel_like = try container.decode(Double.self, forKey: .feel_like)
        pressure = try container.decode(Double.self, forKey: .pressure)
        humidity = try container.decode(Int.self, forKey: .humidity)
        dew_point = try container.decode(Double.self, forKey: .dew_point)
        uvi = try container.decode(Double.self, forKey: .uvi)
        clouds = try container.decode(Int.self, forKey: .clouds)
        visibility = try container.decode(Int.self, forKey: .visibility)
        wind_speed = try container.decode(Double.self, forKey: .wind_speed)
        wind_deg = try container.decode(Int.self, forKey: .wind_deg)
        wind_gust = try container.decode(Double.self, forKey: .wind_gust)
        weather = try container.decode([WeatherDetails].self, forKey: .weather)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(dt, forKey: .dt)
        try container.encode(temp, forKey: .temp)
        try container.encode(feel_like, forKey: .feel_like)
        try container.encode(pressure, forKey: .pressure)
        try container.encode(humidity, forKey: .humidity)
        try container.encode(dew_point, forKey: .dew_point)
        try container.encode(uvi, forKey: .uvi)
        try container.encode(clouds, forKey: .clouds)
        try container.encode(visibility, forKey: .visibility)
        try container.encode(wind_speed, forKey: .wind_speed)
        try container.encode(wind_deg, forKey: .wind_deg)
        try container.encode(wind_gust, forKey: .wind_gust)
        try container.encode(weather, forKey: .weather)
    }
}

extension Weather {
    var id: UUID {
        return UUID()
    }
}
