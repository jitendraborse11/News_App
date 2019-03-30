//
//  NewsCell.swift
//  News_App
//
//  Created by Jitendra Laxman Borse on 28/03/19.
//  Copyright © 2019 Jitendra Laxman Borse. All rights reserved.
//

import UIKit

class NewsCell: UICollectionViewCell {
    
    @IBOutlet weak var img_logo: UIImageView!
    @IBOutlet weak var img_pic: UIImageView!
    @IBOutlet weak var lbl_title: UILabel!
    @IBOutlet weak var lbl_info: UILabel!
    @IBOutlet weak var news_container: UIView!
    
    func setContent() {
        CommonSettings.shared.setFrameToView(bderwidth: 2.0, cornerRad: 5.0, color: .white, item: self.news_container)

    }

}
