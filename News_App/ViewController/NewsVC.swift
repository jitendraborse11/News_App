//
//  NewsVC.swift
//  News_App
//
//  Created by Jitendra Laxman Borse on 28/03/19.
//  Copyright © 2019 Jitendra Laxman Borse. All rights reserved.
//

import UIKit
import SwiftyJSON

class NewsVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tblView_newsList: UITableView!
    
    
    var arrData = [Simple_Struct]()
    var arrName = [NewsMenuStruct]()
    var news:String = "bbc-news"
    var ttle:String = "News"
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        if self.revealViewController() != nil {
            menuButton.target = self.revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
        WebServiceCall.shared.getDataFromNewsWebservice(newsString: news) { (responcedata) in
            let articals = responcedata["articles"].arrayValue
            for resArr in articals
            {
                self.arrData.append(Simple_Struct(json: resArr))
                self.arrName.append(NewsMenuStruct(json: resArr["source"]))
            }
            print(self.arrData)
            print(self.arrName)
            DispatchQueue.main.async {
                self.tblView_newsList.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:NewsListCell = tableView.dequeueReusableCell(withIdentifier: "NewsListCell") as! NewsListCell
        let string = self.arrData[indexPath.row].title as String
        let str = string.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
        print(str)
        cell.lbl_title.text = str
        cell.lbl_info.text = self.arrName[indexPath.row].name
        let url = URL(string: self.arrData[indexPath.row].urlToImage)
        cell.imgView_newspic.sd_setImage(with: url, completed: nil)
        cell.selectionStyle = .none

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let wv:NewsDetailVC = self.storyboard?.instantiateViewController(withIdentifier: "NewsDetailVC") as! NewsDetailVC
        wv.urlString = self.arrData[indexPath.row].url as String
        self.navigationController?.pushViewController(wv, animated: true)
    }
}
