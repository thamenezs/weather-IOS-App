//
//  Service.swift
//  Weather App
//
//  Created by Espezzialy Souza on 04/10/24.
//

import Foundation

struct City{
    let lat: String
    let lon: String
    let name: String
}

class Service {
    
    private let baseUrl = "https://api.openweathermap.org/data/3.0/onecall"
    private let apiKey: String = "f9eabf71ab7672ef281bcd3362a8ba6f"
    private let session = URLSession.shared
    
    func fetchData(city: City, _ completion: @escaping (ForecastResponse?) -> Void) {
        let urlString = "\(baseUrl)?lat=\(city.lat)&lon=\(city.lon)&appId=\(apiKey)&units=metric&lang=pt_br"
        
        guard let url = URL(string: urlString) else {return}
                
        let task = session.dataTask(with: url) { data, response, error in
            guard let data else {
                completion(nil)
                return
            }
            do {
                let forecastResponse = try JSONDecoder().decode(ForecastResponse.self, from: data)
                completion(forecastResponse)
            } catch {
                print(String(data: data, encoding: .utf8) ?? "")
                completion(nil)

            }
            
        }
        
        task.resume()
    }
}

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let forecastResponse = try? JSONDecoder().decode(ForecastResponse.self, from: jsonData)


struct ForecastResponse: Codable {

    let current: Current
    let hourly: [Current]
    let daily: [Daily]

}

// MARK: - Current
struct Current: Codable {
    let dt: Int
    let temp: Double
    let humidity: Int
    let windSpeed: Double
    let weather: [Weather]

    enum CodingKeys: String, CodingKey {
        case dt, temp, humidity
        case windSpeed = "wind_speed"
        case weather
    }
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main, description, icon: String
}

// MARK: - Daily
struct Daily: Codable {
    let dt: Int
    let temp: Temp
    let weather: [Weather]

}


// MARK: - Temp
struct Temp: Codable {
    let day, min, max, night: Double
    let eve, morn: Double
}

