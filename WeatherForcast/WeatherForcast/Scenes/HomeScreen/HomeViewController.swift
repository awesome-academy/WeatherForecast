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
    private var weatherList = [ListWeatherModel]()
    
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
//        navigationController?.pushViewController(searchVc, animated: true)
        present(searchVc, animated: true)
    }
    
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = homeTableView.dequeueReusableCell(withIdentifier: ListCityOfHomeTableViewCell.className, for: indexPath) as? ListCityOfHomeTableViewCell else {
            return UITableViewCell()
        }
        cell.fillData(city: "", temp: "", time: "")
        return cell
    }
}


