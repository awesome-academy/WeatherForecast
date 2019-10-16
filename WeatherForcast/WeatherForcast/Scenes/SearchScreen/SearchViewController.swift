//
//  SearchViewController.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/7/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import UIKit

final class SearchViewController: BaseViewController {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var searchTableView: UITableView!
    @IBOutlet private weak var searchBar: UISearchBar!

    var delegate: PassDataBetweenViewController?
    private var passDataBack: ((CurrentWeather) -> Void)?
    private let service = CurrentService()
    private let placeService = PlaceService()
    var placeList = [Place]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureTableView()
    }

    private func configureTableView() {
        searchTableView.delegate = self
        searchTableView.dataSource = self
    }

    private func configureUI() {
        searchBar.delegate = self
        searchBar.becomeFirstResponder()
        titleLabel.text = "Nhập tên thành phố bạn cần tìm kiếm"
    }

    @IBAction func backButtonAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }

    private func getWeather(param: CurrentWeatherParams) {
        service.getCurrentWeather(param: param).cloudResponse { [weak self](response: CurrentWeatherResponse) in
            guard let data = response.object else {
                print("city not found")
                return
            }
            self?.delegate?.passDataBetweenViewController(data: data)
            self?.navigationController?.popViewController(animated: true)
        }.cloudError { (errMsg, errCode) in
            print("\(errMsg)")
        }
    }

    private func getPlace(param: PlaceParams) {
        placeService.getPlace(param: param).cloudResponse { [weak self](response: PlaceResponse) in
            self?.placeList = response.places
        }.cloudError { (msg, code) in
            print("\(msg)")
        }
    }
}

extension SearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension SearchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text: String = searchBar.text?.removeStartEndWhiteSpaces() else {
            return
        }
        var param = CurrentWeatherParams()
        param.cityName = text
        getWeather(param: param)

    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    }
}

