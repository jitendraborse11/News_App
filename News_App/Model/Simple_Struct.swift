//
//  Simple_Struct.swift
//  News_App
//
//  Created by Jitendra Laxman Borse on 28/03/19.
//  Copyright © 2019 Jitendra Laxman Borse. All rights reserved.
//

import Foundation
import SwiftyJSON
struct Simple_Struct {
    var title:String = ""
    var urlToImage:String = ""
    var url:String = ""
    
    init(json:JSON) {
        self.title = json["title"].stringValue
        self.urlToImage = json["urlToImage"].stringValue
        self.url = json["url"].stringValue
    }
}
