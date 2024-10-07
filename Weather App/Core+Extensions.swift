//
//  Core+Extensions.swift
//  Weather App
//
//  Created by Espezzialy Souza on 07/10/24.
//

import Foundation

extension Int{
    func toWeekdayName() -> String{
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EE"
        dateFormatter.locale = Locale(identifier: "pt_BR")

        return dateFormatter.string(from: date)
    }
    
    func toHourFormat() -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "HH:mm"
        
        return dateformatter.string(from: date)
    }
    
    func isDayTime() -> Bool {
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        let hour = Calendar.current.component(.hour, from: date)
        
        let dayStartHour = 6
        let dayEndHour = 18
        
        return hour >= dayStartHour && hour < dayEndHour
    }
}
extension Double {
    
    func toCelsius() -> String {
        "\(Int(self))°C"
    }
}
