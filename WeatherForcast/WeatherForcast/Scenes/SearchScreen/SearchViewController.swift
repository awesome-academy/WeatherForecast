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
    var placeList = [Place]()
    var currentWeather: CurrentWeather?

    private let serviceHelper: ServiceHelper? = {
        return ServiceHelper.getInstance(CurrentService(),
                                         FiveDayService(),
                                         PlaceService(),
                                         UVIndexService())
    }()

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

        serviceHelper?.getWeather(param: param, onSuccess: { [weak self](response) in
            self?.delegate?.passDataBetweenViewController(data: response)
            self?.navigationController?.popViewController(animated: true)
        }, onFailed: { (errMsg, errCode) in
            print("\(errMsg ?? "")")
        })
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    }
}

