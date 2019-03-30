//
//  MenuCell.swift
//  News_App
//
//  Created by Jitendra Laxman Borse on 28/03/19.
//  Copyright © 2019 Jitendra Laxman Borse. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {
    @IBOutlet weak var view_container: UIView!
    @IBOutlet weak var menu_imgView: UIImageView!
    @IBOutlet weak var menu_title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        CommonSettings.shared.setFrameToView(bderwidth: 2, cornerRad: Float(self.menu_imgView.frame.height/2), color: .white, item: self.menu_imgView)
        self.menu_imgView.layer.masksToBounds = false
        self.menu_imgView.clipsToBounds = true
        self.menu_imgView.backgroundColor = CommonSettings.shared.getRandomColor()
        CommonSettings.shared.setFrameToView(bderwidth: 2.0, cornerRad: 5.0, color: .black, item: self.view_container)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
