//
//  WeatherSubclass.swift
//  Atmosphere
//
//  Created by Rahul Gangwar on 27/09/24.
//

import Foundation

class WeatherSubclass: Weather {
    var sunset: Int
    var sunrise: Int
    
    enum CodingKeys: String, CodingKey {
        case sunset
        case sunrise
    }
    
    override init() {
        self.sunset = 0
        self.sunrise = 0
        super.init()
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.sunset = try container.decode(Int.self, forKey: .sunset)
        self.sunrise = try container.decode(Int.self, forKey: .sunrise)
        
        // Decode properties of the superclass
        try super.init(from: decoder)
    }
    
    override func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(sunset, forKey: .sunset)
        try container.encode(sunrise, forKey: .sunrise)
        
        // Encode properties of the superclass
        try super.encode(to: encoder)
    }
}
