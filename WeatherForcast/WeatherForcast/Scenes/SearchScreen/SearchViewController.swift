//
//  SearchViewController.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/7/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import UIKit

final class SearchViewController: BaseViewController {
<<<<<<< HEAD
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var searchTableView: UITableView!
    @IBOutlet private weak var searchBar: UISearchBar!

=======

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var searchTableView: UITableView!
    @IBOutlet private weak var searchBar: UISearchBar!
    private let service = CurrentService()
    private let placeService = PlaceService()
    var result: CurrentWeatherModel?
    var placeList = [PlaceModel]()
    
>>>>>>> [task][18064]create_ui_search_screen
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureTableView()
    }
<<<<<<< HEAD

=======
    
>>>>>>> [task][18064]create_ui_search_screen
    private func configureTableView() {
        searchTableView.delegate = self
        searchTableView.dataSource = self
    }
<<<<<<< HEAD

    private func configureUI() {
        transitioningDelegate = self
        titleLabel.text = "Nhập tên thành phố bạn cần tìm kiếm"
    }

    @IBAction func backButtonAction(_ sender: Any) {
        navigationController?.popViewController(animated: true)
=======
    
    private func configureUI() {
        transitioningDelegate = self
        titleLabel.text = "Nhập tên hoặc mã thành phố bạn cần tìm kiếm"
    }
    
    @IBAction func backBtn(_ sender: Any) {
//        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
>>>>>>> [task][18064]create_ui_search_screen
    }
    
    private func getWeather(param: CurrentWeatherParams) {
        service.getCurrentWeather(param: param).cloudResponse {[weak self](response: CurrentWeatherResponse) in
            self?.result = response.listData
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
<<<<<<< HEAD

=======
    
>>>>>>> [task][18064]create_ui_search_screen
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}


extension SearchViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AnimationController(animationDuration: 0.4, animationType: .present)
    }
<<<<<<< HEAD

=======
    
>>>>>>> [task][18064]create_ui_search_screen
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AnimationController(animationDuration: 0.4, animationType: .dismiss)
    }
}
