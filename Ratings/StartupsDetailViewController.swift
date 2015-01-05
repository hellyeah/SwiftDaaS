//
//  StartupsDetailViewController.swift
//  Ratings
//
//  Created by David Fontenot on 1/5/15.
//  Copyright (c) 2015 HackMatch. All rights reserved.
//

import UIKit

class StartupsDetailViewController: UITableViewController {

    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var detailLabel: UILabel!
    
    var startup:Startup!
    var type:String = "Chess"
    
    required init(coder aDecoder: NSCoder) {
        println("init StartupsDetailViewController")
        super.init(coder: aDecoder)
    }
    
    deinit {
        println("deinit StartupsDetailViewController")
    }   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailLabel.text = type

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//    // MARK: - Table view data source
//
//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        // #warning Potentially incomplete method implementation.
//        // Return the number of sections.
//        return 0
//    }
//
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete method implementation.
//        // Return the number of rows in the section.
//        return 0
//    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0 {
            nameTextField.becomeFirstResponder()
        }
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SaveStartupDetail" {
            startup = Startup(name: self.nameTextField.text, type: type, rating: 1)
        }
        if segue.identifier == "PickType" {
            let typePickerViewController = segue.destinationViewController as TypePickerViewController
            typePickerViewController.selectedType = type
        }
    }
    
    @IBAction func selectedType(segue:UIStoryboardSegue) {
        let typePickerViewController = segue.sourceViewController as TypePickerViewController
        if let selectedType = typePickerViewController.selectedType {
            detailLabel.text = selectedType
            type = selectedType
        }
        self.navigationController?.popViewControllerAnimated(true)
    }

    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
