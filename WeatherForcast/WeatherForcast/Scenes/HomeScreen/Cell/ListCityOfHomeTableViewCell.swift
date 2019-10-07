//
//  ListCityOfHomeTableViewCell.swift
//  WeatherForcast
//
//  Created by Tung Tran on 10/7/19.
//  Copyright © 2019 Sun. All rights reserved.
//

import UIKit

<<<<<<< HEAD
final class ListCityOfHomeTableViewCell: UITableViewCell {
=======
class ListCityOfHomeTableViewCell: UITableViewCell {

>>>>>>> [task][18064]create_ui_search_screen
    @IBOutlet private weak var wrapView: UIView!
    @IBOutlet private weak var backGroundView: UIImageView!
    @IBOutlet private weak var cityLabel: UILabel!
    @IBOutlet private weak var tempLabel: UILabel!
    @IBOutlet private weak var timeLabel: UILabel!
<<<<<<< HEAD

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func fillData(city: String, temp: String, time: String) {
=======
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func fillData(city: String, temp: String, time: String ) {
>>>>>>> [task][18064]create_ui_search_screen
        tempLabel.text = temp
        cityLabel.text = city
        timeLabel.text = time
    }
}
