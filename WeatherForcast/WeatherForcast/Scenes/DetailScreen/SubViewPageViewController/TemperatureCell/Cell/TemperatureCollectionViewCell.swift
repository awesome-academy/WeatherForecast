//
//  TemperatureCollectionViewCell.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/17/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import UIKit
import Reusable

final class TemperatureCollectionViewCell: UICollectionViewCell, NibReusable {
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var temperatureLabel: UILabel!
    @IBOutlet private weak var weatherImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func fillData(_ data: FiveDayWeather?) {
        guard let dataReceived = data else {
            return
        }
        if let temperature = dataReceived.mainData?.temp.getStringNoDecimal() {
            temperatureLabel.text = temperature + "°"
        }
        timeLabel.text = dataReceived.dateTime.getStringHourFromUnix()
        weatherImage.image = dataReceived.weatherData.first?.main.toWeatherIcon()
    }
}

