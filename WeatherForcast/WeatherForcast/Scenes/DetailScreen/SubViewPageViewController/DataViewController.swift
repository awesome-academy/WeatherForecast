//
//  DataViewController.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/15/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import UIKit
import Reusable

final class DataViewController: UIViewController {
    @IBOutlet private weak var dataTableview: UITableView!

    var index: Int
    private var currentWeather: CurrentWeather?
    private var indicator = UIActivityIndicatorView()
    private var fiveDayWeather = [FiveDayWeather]()
    private var uvIndex: UVIndex?
    private let dispatch = DispatchGroup()
    private var hourOfDayTemperature = [FiveDayWeather]()
    private var weatherInWeek = [FiveDayWeather]()

    private let serviceHelper: ServiceHelper? = {
        return ServiceHelper.getInstance(CurrentService(),
                                         FiveDayService(),
                                         PlaceService(),
                                         UVIndexService())
    }()

    init(with index: Int) {
        self.index = index
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureTable()
        getWeatherData()
    }

    private func configureTable() {
        dataTableview.then {
            $0.delegate = self
            $0.dataSource = self
            $0.backgroundColor = .clear
            $0.register(cellType: BannerTableViewCell.self)
            $0.register(cellType: TemperatureTableViewCell.self)
            $0.register(cellType: FiveDayTableViewCell.self)
            $0.register(cellType: DetailWeatherTableViewCell.self)
        }
    }

    private func startIndicator() {
        indicator.then {
            $0.center = self.view.center
            $0.hidesWhenStopped = true
            $0.style = .gray
        }
        view.addSubview(indicator)
        indicator.startAnimating()
        UIApplication.shared.beginIgnoringInteractionEvents()
    }

    private func stopIndicator() {
        indicator.stopAnimating()
        UIApplication.shared.endIgnoringInteractionEvents()
    }

    func fillData(data: CurrentWeather?) {
        guard let dataReceived = data else {
            return
        }
        currentWeather = dataReceived
    }

    private func configureView() {
        view.backgroundColor = .clear
    }

    private func getWeatherData() {
        startIndicator()
        getFiveDayData()
        getUVData()
        getCurrentWeather()

        dispatch.notify(queue: .main) {
            self.dataTableview.reloadData()
            self.stopIndicator()
        }
    }

    private func getFiveDayData() {
        dispatch.enter()
        var param = FiveDayParams()
        param.cityName = currentWeather?.name

        serviceHelper?.getFiveDayData(param: param, onSuccess: { [weak self] dataList in
            self?.fiveDayWeather = dataList
            self?.filterTemperature(dataList)
        }, onFailed: { [weak self] _, _ in
            self?.dispatch.leave()
        })
    }

    private func getUVData() {
        dispatch.enter()
        var param = UVIndexParams()
        param.coord = currentWeather?.coordData

        serviceHelper?.getUVData(param: param, onSuccess: { [weak self] index in
            self?.uvIndex = index
            self?.dispatch.leave()
        }, onFailed: { [weak self] _, _ in
            self?.dispatch.leave()
        })
    }

    private func getCurrentWeather() {
        dispatch.enter()
        var param = CurrentWeatherParams()
        param.cityName = currentWeather?.name

        serviceHelper?.getWeather(param: param, onSuccess: { [weak self] weather in
            self?.currentWeather = weather
            self?.dispatch.leave()
        }, onFailed: { [weak self] _, _ in
            self?.dispatch.leave()
        })
    }

    private func filterTemperature(_ inputData: [FiveDayWeather]) {
        let myDate = Date().dayAfter.getCurrentDateString()
        for item in inputData {
            if item.dateTime.getDateTimeFromUnix() == myDate {
                hourOfDayTemperature.append(item)
            }
            if item.dateTime.getStringHourFromUnix() == Result.hourFilter {
                weatherInWeek.append(item)
            }
        }
        dispatch.leave()
    }
}

extension DataViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension DataViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return TableRow.bannerRow
        case 1:
            return TableRow.temperatureRow
        case 2:
            return weatherInWeek.count
        case 3:
            return TableRow.detailRow
        default:
            return 0
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        switch indexPath.section {
        case 0:

            let cell = dataTableview.dequeueReusableCell(for: indexPath, cellType: BannerTableViewCell.self).then {
                $0.fillData(currentWeather)
            }
            return cell

        case 1:
            let cell = dataTableview.dequeueReusableCell(for: indexPath, cellType: TemperatureTableViewCell.self).then {
                $0.fillData(hourOfDayTemperature)
                $0.fillTodayInfo(currentWeather)
            }
            return cell

        case 2:
            let cell = dataTableview.dequeueReusableCell(for: indexPath, cellType: FiveDayTableViewCell.self).then {
                $0.fillData(weatherInWeek[indexPath.row])
            }
            return cell

        case 3:
            let cell = dataTableview.dequeueReusableCell(for: indexPath, cellType: DetailWeatherTableViewCell.self).then {
                $0.fillUVIndex(uvIndex)
                $0.fillCurrentWeather(currentWeather)
                $0.fillFiveDayWeather(fiveDayWeather.first)
            }
            return cell
        default:
            return UITableViewCell()
        }
    }
}
