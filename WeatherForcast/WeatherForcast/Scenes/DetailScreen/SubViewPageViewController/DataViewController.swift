//
//  DataViewController.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/15/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import UIKit

final class DataViewController: UIViewController {

    @IBOutlet private weak var testLabel: UILabel!

    var index: Int

    init(with index: Int) {
        self.index = index
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    private func configureView() {
        testLabel.text = "index: \(index)"
        view.backgroundColor = .clear
    }
}
