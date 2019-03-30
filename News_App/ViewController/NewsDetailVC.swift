//
//  NewsDetailVC.swift
//  News_App
//
//  Created by Jitendra Laxman Borse on 30/03/19.
//  Copyright © 2019 Jitendra Laxman Borse. All rights reserved.
//

import UIKit
import WebKit

class NewsDetailVC: UIViewController,WKNavigationDelegate {
    var urlString:String?

    @IBOutlet weak var webvc: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.webvc.navigationDelegate = self as WKNavigationDelegate
        print(self.urlString ?? "")
        let myURL = URL(string:self.urlString ?? "")
        let myRequest = URLRequest(url: myURL!)
        self.webvc.load(myRequest)
        CommonSettings.shared.showLoder()
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        CommonSettings.shared.hideLoder()
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        CommonSettings.shared.hideLoder()
    }

    

    

}
