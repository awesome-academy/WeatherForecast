//
//  FiveDayTableViewCell.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/15/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import UIKit
import Reusable

final class FiveDayTableViewCell: UITableViewCell, NibReusable {

    @IBOutlet private weak var dayLabel: UILabel!
    @IBOutlet private weak var minTemperatureLabel: UILabel!
    @IBOutlet private weak var maxTemperatureLabel: UILabel!
    @IBOutlet private weak var weatherImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func fillData(_ data: FiveDayWeather?) {
        guard let dataReceived = data else {
            return
        }
    }
}
