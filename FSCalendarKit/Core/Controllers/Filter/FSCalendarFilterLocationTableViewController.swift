//
//  FSCalendarFilterLocationTableViewController.swift
//  FSCalendar
//
//  Created by Paul Andrew Gutib on 01/02/2016.
//  Copyright © 2016 rSchoolToday. All rights reserved.
//

import UIKit
import Alamofire
import SwiftSpinner
import SwiftyJSON

class FSCalendarFilterLocationTableViewController: UITableViewController {
    
    var locations = [FSLocation]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.getlocations()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getlocations() {
        SwiftSpinner.show("Loading...");
        Alamofire.request(Router.getlocations(viewtype: "1", building_id: "ALL", locationtypes_id: "ALL")).responseJSON { response in
            if response.result.isFailure {
                debugPrint(response.result.error)
                let errorMessage = (response.result.error?.localizedDescription)! as String
                SwiftSpinner.show(errorMessage, animated: false).addTapHandler({
                    SwiftSpinner.hide()
                })
                return
            }
            let responseData = JSON(data: response.data!)
            debugPrint(responseData)
            for location in responseData {
                self.locations.append(FSLocation(modelAttr: location.1.dictionaryObject!))
            }
            self.tableView.reloadData()
            SwiftSpinner.hide()
        }
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.locations.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FSCalendarFilterLocationTableViewCell", forIndexPath: indexPath) as! FSCalendarFilterLocationTableViewCell
        
        // Configure the cell...
        let location = self.locations[indexPath.row]
        cell.locationName.text =  location.id + " - " + location.name
        if (CalendarFilter.instance.selectedLocationsIndex.contains(indexPath.row)) {
            cell.accessoryType = .Checkmark
        }
        else {
            cell.accessoryType = .None
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if (!CalendarFilter.instance.selectedLocationsIndex.contains(indexPath.row)) {
            CalendarFilter.instance.selectedLocationsIndex.append(indexPath.row)
            CalendarFilter.instance.location_id += ",\(self.locations[indexPath.row].id)"
            tableView.reloadData()
            debugPrint(CalendarFilter.instance.location_id)
        }
        else {
            let farray = CalendarFilter.instance.selectedLocationsIndex.filter() {$0 != indexPath.row}
            CalendarFilter.instance.selectedLocationsIndex = farray
            CalendarFilter.instance.location_id = CalendarFilter.instance.location_id.stringByReplacingOccurrencesOfString(",\(self.locations[indexPath.row].id)", withString: "")
            tableView.reloadData()
            debugPrint(CalendarFilter.instance.location_id)
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
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
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
