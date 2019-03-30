//
//  WebServices.swift
//  News_App
//
//  Created by Jitendra Laxman Borse on 28/03/19.
//  Copyright © 2019 Jitendra Laxman Borse. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
class WebServiceCall
{
    static let shared = WebServiceCall()
    
    func getDataFromWebservice(complition: @escaping (JSON)->()) {
        CommonSettings.shared.showLoder()
        let urlstr = "\(WebLinks.baseurl)\(WebLinks.newsmedialist_webservice)"
        Alamofire.request(URL(string: urlstr)!).responseJSON { (responce) in
            print(responce)
            let result = JSON(responce.result.value!)
            let status = result["status"]
            print(status.description)
            if status == "ok" {
                complition(result)
            }else{
                print("Something Went Wrong")
            }
            CommonSettings.shared.hideLoder()
        }
    }
    
    func getDataFromNewsWebservice(newsString:String, complition: @escaping (JSON)->()) {
        CommonSettings.shared.showLoder()
        let urlstr = "\(WebLinks.baseurl)v2/top-headlines?sources=" + newsString + "&apiKey=" + WebLinks.apikey
        Alamofire.request(URL(string: urlstr)!).responseJSON { (responce) in
            print(responce)
            let result = JSON(responce.result.value!)
            let status = result["status"]
            print(status.description)
            if status == "ok" {
                complition(result)
            }else{
                print("Something Went Wrong")
            }
            CommonSettings.shared.hideLoder()
        }
    }
}
