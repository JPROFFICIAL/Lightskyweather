//
//  WeatherAPI.swift
//  LightSkyWeather
//
//  Created by Jordan Olson on 1/15/16.
//  Copyright © 2016 JordanPR. All rights reserved.
//

import Foundation
import Alamofire

class WeatherInfo {
    var latitude: Double!
    var longitude: Double!
    var summary: String!
    var visibility: Double!
    var currentTemp: Double!
    var currentTempIcon: String!
    var feelsLikeTemp: Double!
    var windSpeed: Double!
    var sevenDaySummary: String!
    
    var currentDayHigh: Double!
    var currentDayLow: Double!
    var secondDayHigh: Double!
    var secondDayLow: Double!
    var thirdDayHigh: Double!
    var thirdDayLow: Double!
    var fourthDayHigh: Double!
    var fourthDayLow: Double!
    var fifthDayHigh: Double!
    var fifthDayLow: Double!
    var sixthDayHigh: Double!
    var sixthDayLow: Double!
    var seventhDayHigh: Double!
    var seventhDayLow: Double!

    
    var cityNameURL: String!
    //Need to get more fields
    
    
    init(latitudeOne: Double, longitudeOne: Double) {
        self.latitude = latitudeOne
        self.longitude = longitudeOne
        
        cityNameURL = "\(URL_BASE)\(URL_KEY)\(self.latitude),\(self.longitude)"
    }
    
    
    func downloadWeatherDetails(completed: downloadComplete) {
        print(cityNameURL)
        let url = NSURL(string: cityNameURL)!
        Alamofire.request(.GET, url).responseJSON { response in
            let result = response.result
            print(result.value?.debugDescription)
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let currentWeather = dict["currently"] as? Dictionary<String, AnyObject> {
                    
                    
                    if let currentSummary = currentWeather["summary"] as? String {
                        self.summary = currentSummary
                    }
                    
                    if let currentTemperIcon = currentWeather["icon"] as? String {
                        self.currentTempIcon = currentTemperIcon
                    }
                    
                    if let currentTemperature = currentWeather["temperature"] as? Double {
                        self.currentTemp = currentTemperature
                       
                    }
                    
                    if let currentApparentTemp = currentWeather["apparentTemperature"] as? Double {
                        self.feelsLikeTemp = currentApparentTemp
                       
                    }
                    if let currentVisibility = currentWeather["visibility"] as? Double {
                        self.visibility = currentVisibility
                    }
                    
                    if let currentWindSpeed = currentWeather["windSpeed"] as? Double {
                        self.windSpeed = currentWindSpeed                        
                    }
                    
                }
                
                if let sevenDayWeather = dict["daily"] as? Dictionary<String, AnyObject> {
                    
                    if let sevenDaySummaryTotal = sevenDayWeather["summary"] as? String {
                        self.sevenDaySummary = sevenDaySummaryTotal
                       
                    }
                    
                    if let sevenDayData = sevenDayWeather["data"] as? Array<Dictionary<String,AnyObject>> {
                        
                        if let currentDayLowTemp = sevenDayData[0]["temperatureMin"] as? Double {
                            self.currentDayLow = currentDayLowTemp
                           
                        }
                        
                        if let currentDayHighTemp = sevenDayData[0]["temperatureMax"] as? Double {
                            self.currentDayHigh = currentDayHighTemp
                           
                        }
                        
                        if let secondDayLowTemp = sevenDayData[1]["temperatureMin"] as? Double {
                            self.secondDayLow = secondDayLowTemp
                            
                        }
                        
                        if let secondDayHighTemp = sevenDayData[1]["temperatureMax"] as? Double {
                            self.secondDayHigh = secondDayHighTemp
                            
                        }
                        
                        if let thirdDayLowTemp = sevenDayData[2]["temperatureMin"] as? Double {
                            self.thirdDayLow = thirdDayLowTemp
                           
                        }
                        
                        if let thirdDayHighTemp = sevenDayData[2]["temperatureMax"] as? Double {
                            self.thirdDayHigh = thirdDayHighTemp
                            
                        }
                        
                        if let fourthDayLowTemp = sevenDayData[3]["temperatureMin"] as? Double {
                            self.fourthDayLow = fourthDayLowTemp
                            
                        }
                        
                        if let fourthDayHighTemp = sevenDayData[3]["temperatureMax"] as? Double {
                            self.fourthDayHigh = fourthDayHighTemp
                            
                        }
                        
                        if let fifthDayLowTemp = sevenDayData[4]["temperatureMin"] as? Double {
                            self.fifthDayLow = fifthDayLowTemp
                           
                        }
                        
                        if let fifthDayHighTemp = sevenDayData[4]["temperatureMax"] as? Double {
                            self.fifthDayHigh = fifthDayHighTemp
                           
                        }
                        
                        if let sixthDayLowTemp = sevenDayData[5]["temperatureMin"] as? Double {
                            self.sixthDayLow = sixthDayLowTemp
                            
                        }
                        
                        if let sixthDayHighTemp = sevenDayData[5]["temperatureMax"] as? Double {
                            self.sixthDayHigh = sixthDayHighTemp
                            
                        }
                        
                        if let seventhDayLowTemp = sevenDayData[6]["temperatureMin"] as? Double {
                            self.seventhDayLow = seventhDayLowTemp
                            
                        }
                        
                        if let seventhDayHighTemp = sevenDayData[6]["temperatureMax"] as? Double {
                            self.seventhDayHigh = seventhDayHighTemp
                            
                        }


                    }
                    
                    
                }
                
                
            }
            
            
            completed()
        }
        
    }
    
    
    
    
    
}
