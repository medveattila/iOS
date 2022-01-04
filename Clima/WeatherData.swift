//
//  WeatherData.swift
//  Clima
//
//  Created by Medveczky Attila on 2020. 09. 24..
//  Copyright © 2020. App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let id: Int
}
