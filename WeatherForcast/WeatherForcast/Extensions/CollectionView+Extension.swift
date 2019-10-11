//
//  CollectionView+Extension.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/11/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import UIKit

extension UICollectionView {
    func registerCells(_ identifiers: String...) {
        for identifier in identifiers {
            self.register(UINib(nibName: identifier, bundle: nil), forCellWithReuseIdentifier: identifier)
        }
    }
}
