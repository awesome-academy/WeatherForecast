//
//  HomeViewController.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/3/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import UIKit
import Reusable
import Reachability
import RealmSwift

final class HomeViewController: BaseViewController {

    @IBOutlet private weak var alertLabel: UILabel!
    @IBOutlet private weak var alertView: UIView!
    @IBOutlet private weak var searchButton: UIButton!
    @IBOutlet private weak var homeTableView: UITableView!

    var weatherList = [CurrentWeather]()
    private let service = FiveDayService()
    private var fiveDayList = [FiveDayWeather]()
    private let homeReachability = Reachability()
    private let realm = try? Realm()
    private var isConnected = true

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTable()

        guard let weatherFromLocal = realm?.objects(RealmWeather.self) else {
            return
        }
        getDataFromLocal(weatherFromLocal) {
            homeTableView.reloadData()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        NotificationCenter.default.addObserver(self, selector: #selector(internetChanged(note:)), name: .reachabilityChanged, object: homeReachability)
        do {
            try homeReachability?.startNotifier()
        } catch {
            print("\(Message.errorNotify)")
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        homeReachability?.stopNotifier()
    }

    private func configureTable() {
        homeTableView.do {
            $0.delegate = self
            $0.dataSource = self
            $0.register(cellType: ListCityOfHomeTableViewCell.self)
        }
    }

    private func getDataFromLocal(_ weather: Results<RealmWeather>, onSuccess: (() -> Void)) {
        defer {
            onSuccess()
        }

        for data in weather {
            let weatherToFill = CurrentWeather(data: nil).then {
                $0.id = data.id
                $0.name = data.name
                $0.dateTimeCurrent = data.dateTimeCurrent
            }

            let coordData = Coordinate(data: nil).with {
                $0.lat = data.lat
                $0.lon = data.lon
            }
            weatherToFill.coordData = coordData

            let mainData = MainTemperature(data: nil).with {
                $0.temp = data.temperature
            }
            weatherToFill.mainData = mainData

            weatherList.append(weatherToFill)
        }
    }

    @objc func internetChanged(note: Notification) {
        guard let reachability = note.object as? Reachability else {
            return
        }
        alertView.backgroundColor = reachability.isReachable ? .white : .red
        alertLabel.text = reachability.isReachable ? "" : Message.errorNetwork
        isConnected = reachability.isReachable
    }

    @IBAction func searchAction(_ sender: Any) {
        if isConnected {
            let searchVc = SearchViewController()
            searchVc.delegate = self
            navigationController?.pushViewController(searchVc, animated: true)
        } else {
            alertShow(title: Message.errorTitle, message: Message.errorNetwork, view: self)
        }
    }

    private func getFiveDayData(param: FiveDayParams) {
        service.getFiveDayData(param: param).cloudResponse { [weak self](response: FiveDayResponse) in
            self?.fiveDayList = response.listData
        }.cloudError { (errMsg, errCode) in
            print("\(errMsg)")
        }
    }

    private func moveToDetail(with index: Int) {
        if isConnected {
            let detailVc = DetailViewController()
            detailVc.currentViewControllerIndex = index
            detailVc.fillData(weatherList)
            navigationController?.pushViewController(detailVc, animated: true)
        } else {
            alertShow(title: Message.errorTitle, message: Message.errorNetwork, view: self)
        }
    }

    private func saveLocalReaml(with data: CurrentWeather?, onSuccess: @escaping (() -> Void),
                                onFailed: @escaping ((_ error: Error) -> Void)) {

        guard let dataReceived = data else {
            return
        }
        let realmWeather = RealmWeather().then {
            $0.id = dataReceived.id
            $0.temperature = dataReceived.mainData?.temp ?? 0.0
            $0.name = dataReceived.name
            $0.dateTimeCurrent = dataReceived.dateTimeCurrent
            $0.lat = dataReceived.coordData?.lat ?? 0.0
            $0.lon = dataReceived.coordData?.lon ?? 0.0
        }
        do {
            try realm?.write {
                realm?.add(realmWeather)
            }
            onSuccess()
        } catch let error {
            onFailed(error)
        }
    }

    private func updateLocalRealm(with data: CurrentWeather?, onSuccess: @escaping (() -> Void),
                                  onFailed: @escaping ((_ error: Error) -> Void)) {

        guard let dataReceived = data else {
            return
        }
        let realmWeather = RealmWeather().then {
            $0.id = dataReceived.id
            $0.temperature = dataReceived.mainData?.temp ?? 0.0
            $0.name = dataReceived.name
            $0.dateTimeCurrent = dataReceived.dateTimeCurrent
            $0.lat = dataReceived.coordData?.lat ?? 0.0
            $0.lon = dataReceived.coordData?.lon ?? 0.0
        }
        do {
            try realm?.write {
                realm?.add(realmWeather, update: true)
            }
            onSuccess()
        } catch let error {
            onFailed(error)
        }
    }

    private func deleteObjectRealm(with data: CurrentWeather?, onSuccess: @escaping (() -> Void),
                                   onFailed: @escaping ((_ error: Error) -> Void)) {
        guard let dataReceived = data else {
            return
        }

        let id = dataReceived.id
        guard let deleteTarget = realm?.objects(RealmWeather.self).filter("id = %@", id) else {
            return
        }
        do {
            try realm?.write {
                realm?.delete(deleteTarget)
            }
            onSuccess()
        } catch let error {
            onFailed(error)
        }
    }
}

extension HomeViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        moveToDetail(with: indexPath.row)
    }
}

extension HomeViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = homeTableView.dequeueReusableCell(for: indexPath, cellType: ListCityOfHomeTableViewCell.self).then {
            $0.fillData(data: weatherList[indexPath.row])
        }
        return cell
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        let delete = UIContextualAction(style: .destructive, title: "Xoá") { [weak self] (action, view, nil) in

            self?.deleteObjectRealm(with: self?.weatherList[indexPath.row], onSuccess: {
                self?.weatherList.remove(at: indexPath.row)
                self?.homeTableView.reloadData()
            }, onFailed: { [weak self] error in
                self?.alertShow(title: Message.errorTitle, message: "\(error.localizedDescription)", view: self ?? UIViewController())
            })
        }
        return UISwipeActionsConfiguration(actions: [delete])
    }
}

extension HomeViewController: PassDataBetweenViewController {

    func passDataBetweenViewController(data: CurrentWeather) {

        guard !weatherList.isEmpty else {
            saveLocalReaml(with: data, onSuccess: {
                self.weatherList.append(data)
            }, onFailed: { [weak self] error in
                self?.alertShow(title: Message.errorTitle, message: "\(error.localizedDescription)", view: self ?? UIViewController())
            })

            homeTableView.reloadData()
            return
        }

        if let index = weatherList.enumerated().first(where: { $0.element.id == data.id })?.offset {
            updateLocalRealm(with: data, onSuccess: {
                self.weatherList[index] = data
            }, onFailed: { [weak self] error in
                self?.alertShow(title: Message.errorTitle, message: "\(error.localizedDescription)", view: self ?? UIViewController())
            })

        } else {
            saveLocalReaml(with: data, onSuccess: {
                self.weatherList.append(data)
            }, onFailed: { [weak self] error in
                self?.alertShow(title: Message.errorTitle, message: "\(error.localizedDescription)", view: self ?? UIViewController())
            })
        }

        homeTableView.reloadData()
    }
}
