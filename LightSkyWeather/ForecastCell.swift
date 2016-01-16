//
//  ForecastCell.swift
//  LightSkyWeather
//
//  Created by Jordan Olson on 1/15/16.
//  Copyright © 2016 JordanPR. All rights reserved.
//

import UIKit

class ForecastCell: UICollectionViewCell {
    
    @IBOutlet weak var highTempLbl: UILabel!
    @IBOutlet weak var lowTempLbl: UILabel!
    
    
    var weatherForecastInfo: WeatherInfo!
    
    func configureCell(forecastInfo: WeatherInfo) {
        self.weatherForecastInfo = forecastInfo
        
        
    }
    
    
    

}
