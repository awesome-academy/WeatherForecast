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
    private var indicator = UIActivityIndicatorView()

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
        searchTableView.then {
            $0.delegate = self
            $0.dataSource = self
            $0.register(cellType: PlacesTableViewCell.self)
        }
    }

    private func configureUI() {
        searchBar.delegate = self
        searchBar.becomeFirstResponder()
        titleLabel.text = "Nhập tên thành phố bạn cần tìm kiếm"
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

    @IBAction func backButtonAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

extension SearchViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var param = CurrentWeatherParams()
        param.cityName = placeList[indexPath.row].mainText

        serviceHelper?.getWeather(param: param, onSuccess: { [weak self] weather in
            self?.currentWeather = weather
            self?.delegate?.passDataBetweenViewController(data: weather)
            self?.navigationController?.popViewController(animated: true)
        }, onFailed: { [weak self] _, _ in
        })
    }
}

extension SearchViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = searchTableView.dequeueReusableCell(for: indexPath, cellType: PlacesTableViewCell.self).then {
            $0.fillData(placeList[indexPath.row])
        }
        return cell
    }
}

extension SearchViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text: String = searchBar.text?.removeStartEndWhiteSpaces() else {
            return
        }
        var param = PlaceParams()
        param.searchString = text
        startIndicator()

        serviceHelper?.getPlace(param: param, onSuccess: { [weak self] response in
            guard response.status != Result.overLimit else {
                self?.stopIndicator()
                self?.alertShow(title: Message.errorTitle, message: Message.errorMessage, view: self ?? UIViewController())
                return
            }
            self?.placeList = response.places
            self?.stopIndicator()
            self?.searchTableView.reloadData()
        }, onFailed: { [weak self] _, _ in
            self?.stopIndicator()
        })
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    }
}

