//
//  ChooseCountryCell.swift
//  chooseCountry
//
//  Created by iOS on 2018/2/26.
//  Copyright © 2018年 iOS. All rights reserved.
//

import UIKit

class ChooseCountryCell: UITableViewCell {

    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var numLabel: UILabel!
    
    func initCell(tableView:UITableView,indexPath:IndexPath) -> ChooseCountryCell {
        let nib = UINib(nibName: "ChooseCountryCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ChooseCountryCell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChooseCountryCell", for: indexPath as IndexPath) as! ChooseCountryCell
        return cell
    }
    
    func setUpData(country: CountryModel) -> Void {
        countryNameLabel.text = country.countryName
        numLabel.text = "+\(country.phoneCode ?? "")"
    }
    
}
