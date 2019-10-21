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
    }

    func fillData(data: CurrentWeather?) {
        guard let dataReceived = data else { return }
        tempLabel.text = dataReceived.mainData?.temp.getStringNoDecimal()
        cityLabel.text = dataReceived.name
        timeLabel.text = dataReceived.dateTimeCurrent?.getStringDateFromUnix()
    }
}
