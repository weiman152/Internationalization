//
//  ChooseCountryController.swift
//  chooseCountry
//
//  Created by iOS on 2018/2/26.
//  Copyright © 2018年 iOS. All rights reserved.
//

import UIKit

class ChooseCountryController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var languageName: String {
        return NSLocalizedString("L", comment: "")
    }
    
    var dataInfo: [String: [CountryModel]] = [:]
    var sections: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chooseTxtContent()
    }
    
    class func instance() -> ChooseCountryController {
        let storyB = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let VC: ChooseCountryController = storyB.instantiateViewController(withIdentifier: "ChooseCountryController") as! ChooseCountryController
        return VC
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func backClick(_ sender: UIButton) {
        dismiss(animated: true) {}
    }
}

extension ChooseCountryController {
    
    //取出本地的txt数据并转成模型数组 source/AllCountry/
    func chooseTxtContent() -> Void {
        guard
            let url = Bundle.main.url(
                forResource: "\(languageName)",
                withExtension: "txt") else {
                    return
        }
        
        struct DataModel: Codable {
            let data: [CountryModel]?
        }
        
        do {
            let data = try Data(contentsOf: url)
            let model = try JSONDecoder().decode(DataModel.self, from: data)
            var array = model.data ?? []
            //删除phoneCode=null的国家信息
            array = array.filter({ $0.phoneCode != "(null)" })
            
            //
            var temp: [String] = array.flatMap({
                return String($0.countryCode?.first ?? Character("#"))
            })
            temp = Array(Set(temp))
            temp = temp.sorted(by: { return $0 < $1 })
            sections = temp
            
            temp.forEach({ (i) in
                dataInfo[i] = array.filter({ return $0.countryCode?.hasPrefix(i) ?? false })
            })
            
        } catch {
            print(error)
        }
    }
    
}

extension ChooseCountryController: UITableViewDelegate {
    //UITableViewDelegate
    func tableView(_ tableView: UITableView,
                   heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

extension ChooseCountryController: UITableViewDataSource {
    //UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return (dataInfo[sections[section]] ?? []).count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let array = dataInfo[sections[indexPath.section]] ?? []
        let cell = ChooseCountryCell().initCell(tableView: tableView,indexPath:indexPath)
        cell.setUpData(country: array[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                   titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sections
    }
}
