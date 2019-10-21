//
//  BannerTableViewCell.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/15/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import UIKit
import Reusable

final class BannerTableViewCell: UITableViewCell, NibReusable {

    @IBOutlet private weak var temperatureLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func fillData(_ data: CurrentWeather?) {
        guard let dataReceived = data else {
            return
        }
        nameLabel.text = dataReceived.name
        descriptionLabel.text = dataReceived.weatherData[0].description
        if let temperature = dataReceived.mainData?.temp.getStringNoDecimal() {
            temperatureLabel.text = temperature + "°"
        }
    }
}
