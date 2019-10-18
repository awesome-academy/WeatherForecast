//
//  PlacesTableViewCell.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/18/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import UIKit
import Reusable

final class PlacesTableViewCell: UITableViewCell, NibReusable {
    @IBOutlet private weak var placeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func fillData(_ data: Place?) {
        guard let dataReceived = data else {
            return
        }
        placeLabel.text = dataReceived.description
    }
}
