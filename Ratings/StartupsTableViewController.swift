//
//  StartupsTableViewController.swift
//  DAAS
//
//  Created by David Fontenot on 1/5/15.
//  Copyright (c) 2015 HackMatch. All rights reserved.
//

import UIKit

class StartupsTableViewController: UITableViewController, UISearchBarDelegate, UISearchDisplayDelegate  {
    
    var startups: [Startup] = startupsData
    var filteredStartups = [Startup]()

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
    
    func imageForRating(rating:Int) -> UIImage? {
        switch rating {
        case 1:
            return UIImage(named: "1StarSmall")
        case 2:
            return UIImage(named: "2StarsSmall")
        case 3:
            return UIImage(named: "3StarsSmall")
        case 4:
            return UIImage(named: "4StarsSmall")
        case 5:
            return UIImage(named: "5StarsSmall")
        default:
            return nil
        }
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        if tableView == self.searchDisplayController!.searchResultsTableView {
            return self.filteredStartups.count
        } else {
            return self.startups.count
        }
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("StartupCell", forIndexPath: indexPath)
            as StartupCell
        
        var startup = startups[indexPath.row] as Startup
        
        if tableView == self.searchDisplayController!.searchResultsTableView {
            startup = filteredStartups[indexPath.row]
        } else {
            startup = startups[indexPath.row]
        }
        
        cell.nameLabel.text = startup.name
        cell.typeLabel.text = startup.type
        cell.ratingImageView.image = imageForRating(startup.rating)
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 55
    }
    

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
    
    // MARK: - Search
    func filterContentForSearchText(searchText: String) {
        // Filter the array using the filter method
        self.filteredStartups = self.startups.filter({( startup: Startup) -> Bool in
            //let typeMatch = (scope == "All") || (startup.type == scope)
            //^not sure what this line does
            let stringMatch = startup.url.lowercaseString.rangeOfString(searchText.lowercaseString)
            return (stringMatch != nil)
        })
    }
    
    func searchDisplayController(controller: UISearchDisplayController!, shouldReloadTableForSearchString searchString: String!) -> Bool {
        self.filterContentForSearchText(searchString)
        return true
    }
    
    func searchDisplayController(controller: UISearchDisplayController!, shouldReloadTableForSearchScope searchOption: Int) -> Bool {
        self.filterContentForSearchText(self.searchDisplayController!.searchBar.text)
        return true
    }

    
    // MARK: - Navigation
    
    @IBAction func cancelToStartupsViewController(segue:UIStoryboardSegue) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func saveStartupDetail(segue:UIStoryboardSegue) {
        let startupsDetailViewController = segue.sourceViewController as StartupsDetailViewController
        
        //add the new startup to the startups array
        startups.append(startupsDetailViewController.startup)
        
        //update the tableView
        let indexPath = NSIndexPath(forRow: startups.count-1, inSection: 0)
        tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        
        //hide the detail view controller
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "OpenWebView" {

            let cell = sender as UITableViewCell
            
            let indexPath = tableView.indexPathForCell(cell)
            let startupURLIndex = indexPath?.row
            
            if let index = startupURLIndex {
                let destinationVC = segue.destinationViewController as StartupsWebViewController
                destinationVC.startupURL = startups[index].url
            }
        }
    }

    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
    

}
