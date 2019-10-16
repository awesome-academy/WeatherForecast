//
//  ListCityOfHomeTableViewCell.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/7/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import UIKit
import Reusable

final class ListCityOfHomeTableViewCell: UITableViewCell, NibReusable {

    @IBOutlet private weak var wrapView: UIView!
    @IBOutlet private weak var backGroundView: UIImageView!
    @IBOutlet private weak var cityLabel: UILabel!
    @IBOutlet private weak var tempLabel: UILabel!
    @IBOutlet private weak var timeLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        configureUi()
    }

    private func configureUi() {
        timeLabel.font = UIFont.systemFont(ofSize: 17)
        cityLabel.font = UIFont.systemFont(ofSize: 25)
        tempLabel.font = UIFont.systemFont(ofSize: 55)
    }

    func fillData(data: CurrentWeather?) {
        guard let dataReceived = data else { return }
        tempLabel.text = dataReceived.mainData?.temp.getCelciusFromKelvin()
        cityLabel.text = dataReceived.name
        timeLabel.text = dataReceived.dateTimeCurrent?.getStringDateFromUnix()
    }
}
