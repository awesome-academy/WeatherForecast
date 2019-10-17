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
        temperatureCollection.then {
            $0.delegate = self
            $0.dataSource = self
            $0.backgroundColor = .clear
            $0.register(cellType: TemperatureCollectionViewCell.self)
        }
    }

    func fillData(_ data: [FiveDayWeather]?) {
        guard let dataReceived = data else {
            return
        }
        weather = dataReceived
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
extension TemperatureTableViewCell: UICollectionViewDelegate {

}


