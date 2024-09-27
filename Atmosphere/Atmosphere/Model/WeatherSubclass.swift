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
    
    enum CodingKeys: String {
        case sunset
        case sunrise
    }
    
    override init() {
        self.sunset = 0
        self.sunrise = 0
        super.init()
    }
    
    required init(from decoder: Decoder) throws {
        fatalError("init(from:) has not been implemented")
        //try super.init(from: decoder)
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        sunset = try container.decode(Int.self, forKey: .sunset)
//        sunrise = try container.decode(Int.self, forKey: .sunrise)
    }
}
