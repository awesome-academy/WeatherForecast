//
//  DetailViewController.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/14/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import UIKit
import Then
import Reachability

final class DetailViewController: BaseViewController {

    @IBOutlet private weak var alertLabel: UILabel!
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var alertView: UIView!
    @IBOutlet private weak var homeButton: UIButton!

    var currentViewControllerIndex = 0
    private var dataSource = [CurrentWeather]()
    private var pageController: UIPageViewController?
    private let reachability = Reachability()

    override func viewDidLoad() {
        super.viewDidLoad()
        configurePageViewController()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(reachabilityChanged(note:)), name: .reachabilityChanged, object: reachability)
        do {
            try reachability?.startNotifier()
        } catch {
            print("\(Message.errorNotify)")
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        reachability?.stopNotifier()
    }

    private func configurePageViewController() {
        pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil).then {
            $0.view.backgroundColor = .clear
            $0.dataSource = self
            $0.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height - 30)
            let dataViewController = DataViewController(with: currentViewControllerIndex)
            dataViewController.fillData(data: dataSource[currentViewControllerIndex])
            $0.setViewControllers([dataViewController], direction: .forward, animated: true, completion: nil)
            $0.didMove(toParent: self)
        }
        guard let pageControl = pageController else {
            return
        }
        addChild(pageControl)
        view.addSubview(pageControl.view)
    }

    @objc func reachabilityChanged(note: Notification) {
        guard let reachability = note.object as? Reachability else {
            return
        }
        alertView.backgroundColor = reachability.isReachable ? .white : .red
        alertLabel.text = reachability.isReachable ? "" : Message.errorNetwork
    }

    func fillData(_ data: [CurrentWeather]?) {
        guard let dataReceived = data else {
            return
        }
        dataSource = dataReceived
    }

    @IBAction func backButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

extension DetailViewController: UIPageViewControllerDataSource {

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return currentViewControllerIndex
    }

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return dataSource.count
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {

        guard let dataView = viewController as? DataViewController else {
            return nil
        }
        if dataView.index == 0 {
            return nil
        }
        let dataViewController = DataViewController(with: dataView.index - 1)
        dataViewController.fillData(data: dataSource[dataView.index - 1])
        return dataViewController
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {

        guard let dataView = viewController as? DataViewController else {
            return nil
        }
        if dataView.index >= dataSource.count - 1 {
            return nil
        }
        let dataViewController = DataViewController(with: dataView.index + 1)
        dataViewController.fillData(data: dataSource[dataView.index + 1])
        return dataViewController
    }
}


