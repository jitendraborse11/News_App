//
//  File.swift
//  News_App
//
//  Created by Jitendra Laxman Borse on 28/03/19.
//  Copyright © 2019 Jitendra Laxman Borse. All rights reserved.
//

import Foundation
import UIKit
import SwiftLoader

class CommonSettings {
    static let shared = CommonSettings()
    
    func configureLoder() {
        var config : SwiftLoader.Config = SwiftLoader.Config()
        config.size = 100
        config.spinnerColor = .red
        config.foregroundColor = .black
        config.foregroundAlpha = 0.5
        SwiftLoader.setConfig(config: config)
    }
    
    func showLoder()  {
        self.configureLoder()
        SwiftLoader.show(animated: true)
    }
    
    func hideLoder() {
        SwiftLoader.hide()
    }
    
    func getRandomColor() -> UIColor {
        //Generate between 0 to 1
        let red:CGFloat = CGFloat(drand48())
        let green:CGFloat = CGFloat(drand48())
        let blue:CGFloat = CGFloat(drand48())
        
        return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
    }
    
    func setFrameToView(bderwidth:Float,cornerRad:Float,color:UIColor,item:UIView) {
        item.layer.borderWidth = CGFloat(bderwidth)
        item.layer.borderColor = (color).cgColor
        item.layer.cornerRadius = CGFloat(cornerRad)
    }
}
