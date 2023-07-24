//
//  feeds.swift
//  abcmobiles
//
//  Created by LOKESH on 17/07/23.
//

import UIKit
import WebKit


class feeds: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        web.load(NSURLRequest(url: NSURL(string:"https://news.google.com/stories/CAAqNggKIjBDQklTSGpvSmMzUnZjbmt0TXpZd1NoRUtEd2pGdDVPZ0NCRUNqQUNGY3NENUhpZ0FQAQ?hl=en-IN&gl=IN&ceid=IN%3Aen")!as URL) as URLRequest)
        
        self.navigationItem.hidesBackButton = true
    }
    
    @IBOutlet var web: WKWebView!
    

}
