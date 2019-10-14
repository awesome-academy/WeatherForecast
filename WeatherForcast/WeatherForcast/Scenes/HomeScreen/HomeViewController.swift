//
//  HomeViewController.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/3/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import UIKit

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
        homeTableView.registerCells(ListCityOfHomeTableViewCell.className)
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

    private func moveToDetail(indexPath: Int) {
        let detailVc = DetailViewController()
        present(detailVc, animated: true)
    }
}


extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        moveToDetail(indexPath: indexPath.row)
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = homeTableView.dequeueReusableCell(withIdentifier: ListCityOfHomeTableViewCell.className, for: indexPath) as? ListCityOfHomeTableViewCell else {
            return UITableViewCell()
        }
        cell.fillData(data: weatherList[indexPath.row])
        return cell
    }
}

extension HomeViewController: PassDataBetweenViewController {
    func passDataBetweenViewController(data: CurrentWeather) {
        weatherList.append(data)
        homeTableView.reloadData()
    }
}

