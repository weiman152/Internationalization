//
//  CountryModel.swift
//  chooseCountry
//
//  Created by iOS on 2018/2/26.
//  Copyright © 2018年 iOS. All rights reserved.
//

import UIKit

struct CountryModel : Codable {
    let countryName : String?
    let countryPinyin : String?
    let phoneCode : String?
    let countryCode : String?
}
