//
//  NewsMenu_Struct.swift
//  News_App
//
//  Created by Jitendra Laxman Borse on 28/03/19.
//  Copyright © 2019 Jitendra Laxman Borse. All rights reserved.
//

import Foundation
import SwiftyJSON
struct NewsMenuStruct {
    var name:String = ""
    var id:String = ""
    var description:String = ""
    init() {
        
    }
    init(json:JSON) {
        self.name = json["name"].stringValue
        self.id = json["id"].stringValue
        self.description = json["description"].stringValue
    }
}
