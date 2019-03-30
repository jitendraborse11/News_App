//
//  MenuVC.swift
//  News_App
//
//  Created by Jitendra Laxman Borse on 28/03/19.
//  Copyright © 2019 Jitendra Laxman Borse. All rights reserved.
//

import UIKit
import SDWebImage

class MenuVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var arrData = [NewsMenuStruct]()
    @IBOutlet weak var tblView_menu: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        WebServiceCall.shared.getDataFromWebservice { (data) in
            let data = data["sources"].arrayValue
            for arr in data {
            self.arrData.append(NewsMenuStruct(json: arr))
            }
            print(self.arrData)
            DispatchQueue.main.async {
                self.tblView_menu.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }

    //Mark: - TableViewDelegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:MenuCell = tableView.dequeueReusableCell(withIdentifier: "MenuCell") as! MenuCell
        cell.menu_title.text = self.arrData[indexPath.row].name
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(self.arrData[indexPath.row].id)
        let newsview :NewsVC = self.storyboard?.instantiateViewController(withIdentifier: "NewsVC") as! NewsVC
        let nav:UINavigationController = UINavigationController(rootViewController: newsview)
        newsview.news = self.arrData[indexPath.row].id as String
        newsview.ttle = self.arrData[indexPath.row].name as String
        self.revealViewController().pushFrontViewController(nav, animated: true)
        self.revealViewController().setFrontViewPosition(FrontViewPosition.left, animated: true)
        
    }
    
    
}
