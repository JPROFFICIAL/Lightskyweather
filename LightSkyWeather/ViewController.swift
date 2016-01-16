//
//  ViewController.swift
//  LightSkyWeather
//
//  Created by Jordan Olson on 1/15/16.
//  Copyright © 2016 JordanPR. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var weatherView: UIView!
    @IBOutlet weak var currentTempLbl: UILabel!
    @IBOutlet weak var feelsLikeTempLbl: UILabel!
    @IBOutlet weak var visibilityLbl: UILabel!
    @IBOutlet weak var windSpeedLbl: UILabel!
    @IBOutlet weak var weatherIconView: UIImageView!
    @IBOutlet weak var currentTempDescriptionLbl: UILabel!
        
    @IBOutlet weak var longitudeTextField: UITextField!
    @IBOutlet weak var latitudeTextField: UITextField!
    @IBOutlet weak var currentHighLbl: UILabel!
    @IBOutlet weak var secondHighLbl: UILabel!
    @IBOutlet weak var thirsHighLbl: UILabel!
    @IBOutlet weak var fourthHighLbl: UILabel!
    @IBOutlet weak var fifthHighLbl: UILabel!
    @IBOutlet weak var sixthHighLbl: UILabel!
    @IBOutlet weak var seventhHighLbl: UILabel!
    @IBOutlet weak var currentLowLbl: UILabel!
    @IBOutlet weak var secondLowLbl: UILabel!
    @IBOutlet weak var thirsLowLbl: UILabel!
    @IBOutlet weak var fourthLowLbl: UILabel!
    @IBOutlet weak var fifthLowLbl: UILabel!
    @IBOutlet weak var sicthLowLbl: UILabel!
    @IBOutlet weak var seventhLowLvl: UILabel!
    
    @IBOutlet weak var SevenDayDescriptionLbl: UILabel!
    
    var weatherInfo: WeatherInfo!
    
    let currentWeather = WeatherInfo(latitudeOne: 44.986656, longitudeOne: -93.258133)
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        getWeather()
    }
    
    func updateUI() {
        
        self.currentTempLbl.text = "\(currentWeather.currentTemp)"
        self.feelsLikeTempLbl.text = "\(currentWeather.feelsLikeTemp)"
        self.visibilityLbl.text = "\(currentWeather.visibility)"
        self.windSpeedLbl.text = "\(currentWeather.windSpeed)"
        self.currentTempDescriptionLbl.text = "\(currentWeather.summary)"
        self.SevenDayDescriptionLbl.text = "\(currentWeather.sevenDaySummary)"
        
        self.currentHighLbl.text = "\(currentWeather.currentDayHigh)"
        self.currentLowLbl.text = "\(currentWeather.currentDayLow)"
        self.secondHighLbl.text = "\(currentWeather.secondDayHigh)"
        self.secondLowLbl.text = "\(currentWeather.secondDayLow)"
        self.thirsHighLbl.text = "\(currentWeather.thirdDayHigh)"
        self.thirsLowLbl.text = "\(currentWeather.thirdDayLow)"
        self.fourthHighLbl.text = "\(currentWeather.fourthDayHigh)"
        self.fourthLowLbl.text = "\(currentWeather.fourthDayLow)"
        self.fifthHighLbl.text = "\(currentWeather.fifthDayHigh)"
        self.fifthLowLbl.text = "\(currentWeather.fifthDayLow)"
        self.sixthHighLbl.text = "\(currentWeather.sixthDayHigh)"
        self.sicthLowLbl.text = "\(currentWeather.sixthDayLow)"
        self.seventhHighLbl.text = "\(currentWeather.seventhDayHigh)"
        self.seventhLowLvl.text = "\(currentWeather.seventhDayLow)"

        
        
        
    }
    
    
    func getWeather() {
        
        currentWeather.downloadWeatherDetails { () -> () in
            
            self.updateUI()
        
        }
        
    }
    
    
    @IBAction func getNewWeatherLocation(sender: AnyObject) {
        
        let newLatitude: Double = NSString(string: "\(latitudeTextField.text)").doubleValue
        let newLongitude: Double = NSString(string: "\(longitudeTextField.text)").doubleValue
        
        let newWeather = WeatherInfo(latitudeOne: newLatitude, longitudeOne: newLongitude)
        
        newWeather.downloadWeatherDetails { () -> () in
            
            self.currentTempLbl.text = "\(newWeather.currentTemp)"
            self.feelsLikeTempLbl.text = "\(newWeather.feelsLikeTemp)"
            self.visibilityLbl.text = "\(newWeather.visibility)"
            self.windSpeedLbl.text = "\(newWeather.windSpeed)"
            self.currentTempDescriptionLbl.text = "\(newWeather.summary)"
            self.SevenDayDescriptionLbl.text = "\(newWeather.sevenDaySummary)"
            
            self.currentHighLbl.text = "\(newWeather.currentDayHigh)"
            self.currentLowLbl.text = "\(newWeather.currentDayLow)"
            self.secondHighLbl.text = "\(newWeather.secondDayHigh)"
            self.secondLowLbl.text = "\(newWeather.secondDayLow)"
            self.thirsHighLbl.text = "\(newWeather.thirdDayHigh)"
            self.thirsLowLbl.text = "\(newWeather.thirdDayLow)"
            self.fourthHighLbl.text = "\(newWeather.fourthDayHigh)"
            self.fourthLowLbl.text = "\(newWeather.fourthDayLow)"
            self.fifthHighLbl.text = "\(newWeather.fifthDayHigh)"
            self.fifthLowLbl.text = "\(newWeather.fifthDayLow)"
            self.sixthHighLbl.text = "\(newWeather.sixthDayHigh)"
            self.sicthLowLbl.text = "\(newWeather.sixthDayLow)"
            self.seventhHighLbl.text = "\(newWeather.seventhDayHigh)"
            self.seventhLowLvl.text = "\(newWeather.seventhDayLow)"

        }
    }
    
    
    

}

