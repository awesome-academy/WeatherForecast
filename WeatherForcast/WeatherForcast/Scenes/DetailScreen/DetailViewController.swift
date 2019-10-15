//
//  DetailViewController.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/14/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import UIKit
import Then

final class DetailViewController: BaseViewController {

    @IBOutlet private weak var contentView: UIView!

    var currentViewControllerIndex = 0
    private var pageController: UIPageViewController?
    var dataSource = [CurrentWeather]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configurePageViewController()
    }

    private func configurePageViewController() {
        pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil).then {
            $0.view.backgroundColor = .clear
            $0.delegate = self
            $0.dataSource = self
            $0.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
            let dataViewController = DataViewController(with: currentViewControllerIndex)
            $0.setViewControllers([dataViewController], direction: .forward, animated: true, completion: nil)
            $0.didMove(toParent: self)
        }
        guard let pageControl = pageController else {
            return
        }
        addChild(pageControl)
        view.addSubview(pageControl.view)
    }

    func fillData(_ data: [CurrentWeather]?) {
        guard let dataReceived = data else {
            return
        }
        dataSource = dataReceived
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
        return DataViewController(with: dataView.index - 1)
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let dataView = viewController as? DataViewController else {
            return nil
        }
        if dataView.index >= dataSource.count - 1 {
            return nil
        }
        return DataViewController(with: dataView.index + 1)
    }
}

extension DetailViewController: UIPageViewControllerDelegate {
}
