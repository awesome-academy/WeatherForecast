//
//  DetailWeatherTableViewCell.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/15/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import UIKit
import Reusable

final class DetailWeatherTableViewCell: UITableViewCell, NibReusable {

    @IBOutlet private weak var sunRiseTime: UILabel!
    @IBOutlet private weak var sunRiseLabel: UILabel!
    @IBOutlet private weak var rainAmount: UILabel!
    @IBOutlet private weak var rainAmountLabel: UILabel!
    @IBOutlet private weak var windLabel: UILabel!
    @IBOutlet private weak var seaPressureLabel: UILabel!
    @IBOutlet private weak var seaPressureIndex: UILabel!
    @IBOutlet private weak var windSpeed: UILabel!
    @IBOutlet private weak var viewDistanceLabel: UILabel!
    @IBOutlet private weak var viewDistance: UILabel!
    @IBOutlet private weak var sunSetTime: UILabel!
    @IBOutlet private weak var sunSetLabel: UILabel!
    @IBOutlet private weak var humidityIndex: UILabel!
    @IBOutlet private weak var humidityLabel: UILabel!
    @IBOutlet private weak var temperatureSensing: UILabel!
    @IBOutlet private weak var temperatureSensingLabel: UILabel!
    @IBOutlet private weak var pressureLabel: UILabel!
    @IBOutlet private weak var pressureIndex: UILabel!
    @IBOutlet private weak var uvLabel: UILabel!
    @IBOutlet private weak var uvIndex: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        configureUi()
    }

    private func configureUi() {
        sunRiseLabel.text = "MT Mọc"
        sunSetLabel.text = "MT Lặn"
        seaPressureLabel.text = "Áp suất mặt"
        humidityLabel.text = "Độ ẩm"
        windLabel.text = "Tốc độ gió"
        temperatureSensingLabel.text = "Nhiệt độ cảm nhận"
        rainAmountLabel.text = "Lượng mưa"
        pressureLabel.text = "Áp suất"
        viewDistanceLabel.text = "Tầm nhìn"
        uvLabel.text = "Chỉ số UV"
    }

    func fillCurrentWeather(_ data: CurrentWeather?) {
        guard let dataReceived = data else {
            return
        }
        sunRiseTime.text = dataReceived.sysData?.sunRise.getStringHoursMinutesFromUnix()
        sunSetTime.text = dataReceived.sysData?.sunSet.getStringHoursMinutesFromUnix()
        humidityIndex.text = "\(dataReceived.mainData?.humidity ?? 0) %"
        
        if let windSpd = dataReceived.windData?.speed.getStringOneDecimal() {
            windSpeed.text = windSpd + "m/s"
        }

        if let tempSensing = dataReceived.mainData?.temp.getStringNoDecimal() {
            temperatureSensing.text = tempSensing + "°"
        }

        viewDistance.text = ("\(dataReceived.visibility ?? 0) m")
        if let pressIndex = dataReceived.mainData?.pressure.getStringOneDecimal() {
            pressureIndex.text = pressIndex + " hPa"
        }

        if let seaIndex = dataReceived.mainData?.seaLevel.getStringOneDecimal() {
            seaPressureIndex.text = seaIndex + " hPa"
        }
    }

    func fillFiveDayWeather(_ data: FiveDayWeather?) {
        guard let dataReceived = data else {
            return
        }
        rainAmount.text = dataReceived.rain?.rainCount.getStringNoDecimal() ?? "0" + "cm"
    }

    func fillUVIndex(_ data: UVIndex?) {
        guard let dataReceived = data else {
            return
        }
        uvIndex.text = dataReceived.value.getStringOneDecimal()
    }
}
