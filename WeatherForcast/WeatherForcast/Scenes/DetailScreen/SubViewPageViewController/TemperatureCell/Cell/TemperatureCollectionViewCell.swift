//
//  TemperatureCollectionViewCell.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/16/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import UIKit
import Reusable

final class TemperatureCollectionViewCell: UICollectionViewCell, NibReusable {

    @IBOutlet private weak var temperatureLabel: UILabel!
    @IBOutlet private weak var weatherImage: UIImageView!
    @IBOutlet private weak var timeLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func fillData(_ data: FiveDayWeather?) {
        guard let dataReceived = data else {
            return
        }
        temperatureLabel.text = dataReceived.mainData?.temp.getCelciusFromKelvin()
        timeLabel.text = dataReceived.dateTime.getStringHourFromUnix()
    }
}
