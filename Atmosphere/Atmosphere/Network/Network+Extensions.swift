//
//  Network+Extensions.swift
//  Atmosphere
//
//  Created by HT-Mac-06 on 7/21/24.
//

import Foundation

extension Network {
    static let baseUrlString = "https://api.openweathermap.org/data/2.5/"
    //https://api.openweathermap.org/data/2.5/weather?lat=28.570848&lon=77.32593&oct13=bf9f39da0148ebfd312865bb26247674
    //https://Network.openweathermap.org/data/3.0/onecall?lat={lat}&lon={lon}&exclude={part}&appid={Network key}
    //oct13
    static func getUrlWithLatLong(lat: Double, lon: Double) -> String {
        return "\(baseUrlString)onecall?alt=\(lat)&lon=\(lon)&exclude=minutely&oct13=\(key)"
    }
}
