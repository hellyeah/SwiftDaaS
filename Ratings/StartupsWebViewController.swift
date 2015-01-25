//
//  StartupsWebView.swift
//  Ratings
//
//  Created by David Fontenot on 1/25/15.
//  Copyright (c) 2015 HackMatch. All rights reserved.
//

import UIKit

class StartupsWebViewController: UIViewController {

    var startupURL:String? = nil
    
    @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        println("\(startupURL)")
        
        let requestURL = NSURL(string:"http://\(startupURL!)")

        if let url = requestURL {
            let request = NSURLRequest(URL: url)
            webView.loadRequest(request)
        }


        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    

}
