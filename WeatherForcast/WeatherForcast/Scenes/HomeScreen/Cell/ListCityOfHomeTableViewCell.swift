//
//  ListCityOfHomeTableViewCell.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/7/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import UIKit

final class ListCityOfHomeTableViewCell: UITableViewCell {

    @IBOutlet private weak var wrapView: UIView!
    @IBOutlet private weak var backGroundView: UIImageView!
    @IBOutlet private weak var cityLabel: UILabel!
    @IBOutlet private weak var tempLabel: UILabel!
    @IBOutlet private weak var timeLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    private func configureUi() {

    }

    func fillData(data: CurrentWeather?) {
        guard let dataReceived = data else { return }
        tempLabel.text = dataReceived.mainData?.temp.getCelciusFromKelvin()
        cityLabel.text = dataReceived.name
        timeLabel.text = dataReceived.dateTimeCurrent?.getStringDateFromUnix()
    }
}
