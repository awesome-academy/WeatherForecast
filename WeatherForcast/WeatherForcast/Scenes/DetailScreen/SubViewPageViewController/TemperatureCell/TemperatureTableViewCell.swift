//
//  TemperatureTableViewCell.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/15/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import UIKit
import Reusable

final class TemperatureTableViewCell: UITableViewCell, NibReusable {

    @IBOutlet private weak var temperatureMinLabel: UILabel!
    @IBOutlet private weak var temperatureMaxLabel: UILabel!
    @IBOutlet private weak var dayLabel: UILabel!
    @IBOutlet private weak var temperatureCollection: UICollectionView!

    private var weather = [FiveDayWeather]()

    override func awakeFromNib() {
        super.awakeFromNib()
        configureCollection()
    }

    private func configureCollection() {
        temperatureCollection.do {
            $0.delegate = self
            $0.dataSource = self
            $0.backgroundColor = .clear
            $0.register(cellType: TemperatureCollectionViewCell.self)
        }
    }

    func fillTodayInfo(_ data: CurrentWeather?) {
        guard let received = data else {
            return
        }
        let stringDate = received.dateTimeCurrent.getStringDayOfWeekFromUnix()
        dayLabel.text = "Hôm nay \(stringDate.toVietNameseString())"
        temperatureMaxLabel.text = received.mainData?.tempMax.getStringNoDecimal()
        temperatureMinLabel.text = received.mainData?.tempMin.getStringNoDecimal()
    }

    func fillData(_ data: [FiveDayWeather]?) {
        guard let dataReceived = data else {
            return
        }
        weather = dataReceived
        temperatureCollection.reloadData()
    }
}

extension TemperatureTableViewCell: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weather.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = temperatureCollection.dequeueReusableCell(for: indexPath, cellType: TemperatureCollectionViewCell.self).then {
            $0.fillData(weather[indexPath.row])
        }
        return cell
    }
}
extension TemperatureTableViewCell: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = temperatureCollection.bounds.height
        let width = temperatureCollection.bounds.width / 4.5
        return CGSize(width: width, height: height)
    }
}


