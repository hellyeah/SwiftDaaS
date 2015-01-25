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
    
    required init(coder aDecoder: NSCoder) {
        println("init StartupsDetailViewController")
        super.init(coder: aDecoder)
    }
    
    deinit {
        println("deinit StartupsDetailViewController")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
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
