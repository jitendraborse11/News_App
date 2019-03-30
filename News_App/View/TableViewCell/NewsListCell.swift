//
//  NewsListCell.swift
//  News_App
//
//  Created by Jitendra Laxman Borse on 28/03/19.
//  Copyright © 2019 Jitendra Laxman Borse. All rights reserved.
//

import UIKit

class NewsListCell: UITableViewCell {

    @IBOutlet weak var view_container: UIView!
    @IBOutlet weak var imgView_newspic: UIImageView!
    @IBOutlet weak var imgview_logo: UIImageView!
    @IBOutlet weak var lbl_info: UILabel!
    @IBOutlet weak var lbl_title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        CommonSettings.shared.setFrameToView(bderwidth: 2, cornerRad: Float(self.imgview_logo.frame.height/2), color: .white, item: self.imgview_logo)
        self.imgview_logo.layer.masksToBounds = false
        self.imgview_logo.clipsToBounds = true
        self.imgview_logo.backgroundColor = CommonSettings.shared.getRandomColor()
        CommonSettings.shared.setFrameToView(bderwidth: 1.0, cornerRad: 2.0, color: .white, item: self.view_container)
        CommonSettings.shared.setFrameToView(bderwidth: 4.0, cornerRad: 2.0, color: .black, item: self.imgView_newspic)

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
