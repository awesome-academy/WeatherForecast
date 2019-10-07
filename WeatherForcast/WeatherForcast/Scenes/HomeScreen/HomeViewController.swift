//
//  HomeViewController.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/3/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import UIKit

final class HomeViewController: BaseViewController {
<<<<<<< HEAD
    @IBOutlet private weak var searchButton: UIButton!
    @IBOutlet private weak var homeTableView: UITableView!
    private var weatherList = [ListWeatherModel]()

=======

    @IBOutlet private weak var searchButton: UIButton!
    @IBOutlet private weak var homeTableView: UITableView!
    private var weatherList = [ListWeatherModel]()
    
>>>>>>> [task][18064]create_ui_search_screen
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureTable()
    }
<<<<<<< HEAD

    private func configureTable() {
        homeTableView.delegate = self
        homeTableView.dataSource = self
    }

    private func configureUI() {
=======
    
    private func configureTable() {
        homeTableView.delegate = self
        homeTableView.dataSource = self
        homeTableView.registerCells(ListCityOfHomeTableViewCell.className)
    }
    
    private func configureUI() {
        
>>>>>>> [task][18064]create_ui_search_screen
    }

    @IBAction func searchAction(_ sender: Any) {
        let searchVc = SearchViewController()
<<<<<<< HEAD
        navigationController?.pushViewController(searchVc, animated: true)
    }
=======
//        navigationController?.pushViewController(searchVc, animated: true)
        present(searchVc, animated: true)
    }
    
>>>>>>> [task][18064]create_ui_search_screen
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
<<<<<<< HEAD

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

=======
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
>>>>>>> [task][18064]create_ui_search_screen
    }
}

extension HomeViewController: UITableViewDataSource {
<<<<<<< HEAD
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

=======
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
>>>>>>> [task][18064]create_ui_search_screen
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = homeTableView.dequeueReusableCell(withIdentifier: ListCityOfHomeTableViewCell.className, for: indexPath) as? ListCityOfHomeTableViewCell else {
            return UITableViewCell()
        }
        cell.fillData(city: "", temp: "", time: "")
        return cell
    }
}


