//
//  ViewController.swift
//  ChooseCountry
//
//  Created by iOS on 2018/2/27.
//  Copyright © 2018年 iOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var chooseButton: UIButton!
    @IBOutlet weak var chooseLanguage: UILabel!
    @IBOutlet weak var currentLanguage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func chooseAction(_ sender: UIButton) {
        let chooseCountryVC = ChooseCountryController.instance()
        present(chooseCountryVC, animated: true) {
            print(NSLocalizedString("goto_choose_country", comment: ""))
        }
    }
}

