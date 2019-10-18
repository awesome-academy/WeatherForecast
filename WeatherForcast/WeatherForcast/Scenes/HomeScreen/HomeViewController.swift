//
//  HomeViewController.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/3/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import UIKit
import Reusable

final class HomeViewController: BaseViewController {

    @IBOutlet private weak var searchButton: UIButton!
    @IBOutlet private weak var homeTableView: UITableView!

    var weatherList = [CurrentWeather]()
    private let service = FiveDayService()
    private var fiveDayList = [FiveDayWeather]()


    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureTable()
    }

    private func configureTable() {
        homeTableView.delegate = self
        homeTableView.dataSource = self
        homeTableView.register(cellType: ListCityOfHomeTableViewCell.self)
    }

    private func configureUI() {
    }

    @IBAction func searchAction(_ sender: Any) {
        let searchVc = SearchViewController()
        searchVc.delegate = self
        navigationController?.pushViewController(searchVc, animated: true)
    }

    private func getFiveDayData(param: FiveDayParams) {
        service.getFiveDayData(param: param).cloudResponse { [weak self](response: FiveDayResponse) in
            self?.fiveDayList = response.listData
        }.cloudError { (errMsg, errCode) in
            print("\(errMsg)")
        }
    }

    private func moveToDetail(with index: Int) {
        let detailVc = DetailViewController()
        detailVc.currentViewControllerIndex = index
        detailVc.fillData(weatherList)
        navigationController?.pushViewController(detailVc, animated: true)
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
            self?.weatherList.remove(at: indexPath.row)
            self?.homeTableView.reloadData()
        }
        return UISwipeActionsConfiguration(actions: [delete])
    }
}

extension HomeViewController: PassDataBetweenViewController {

    func passDataBetweenViewController(data: CurrentWeather) {

        guard !weatherList.isEmpty else {
            weatherList.append(data)
            homeTableView.reloadData()
            return
        }
        if let index = weatherList.enumerated().first(where: { $0.element.id == data.id })?.offset {
            weatherList[index] = data
        } else {
            weatherList.append(data)
        }
        homeTableView.reloadData()
    }
}
