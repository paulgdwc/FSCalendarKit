//
//  FSCalendarFilterTableViewController.swift
//  FSCalendar
//
//  Created by Paul Andrew Gutib on 01/02/2016.
//  Copyright © 2016 rSchoolToday. All rights reserved.
//

import UIKit

class FSCalendarFilterTableViewController: UITableViewController {

    @IBOutlet weak var showTitleLocation: UISwitch!
    @IBOutlet weak var showTitleActivity: UISwitch!
    @IBOutlet weak var showTitleEndTime: UISwitch!
    @IBOutlet weak var showExpectedAttendance: UISwitch!
    @IBOutlet weak var showSetupTeardownTime: UISwitch!
    @IBOutlet weak var showCancelledPermit: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    
        self.showTitleLocation.setOn(self.boolConverter(CalendarFilter.instance.showTitleLocation), animated: false)
        self.showTitleActivity.setOn(self.boolConverter(CalendarFilter.instance.showTitleActivity), animated: false)
        self.showTitleEndTime.setOn(self.boolConverter(CalendarFilter.instance.showTitleEndTime), animated: false)
        self.showExpectedAttendance.setOn(self.boolConverter(CalendarFilter.instance.showExpectedAttendance), animated: false)
        self.showSetupTeardownTime.setOn(self.boolConverter(CalendarFilter.instance.showSetupTeardownTime), animated: false)
        self.showCancelledPermit.setOn(self.boolConverter(CalendarFilter.instance.showCancelledPermit), animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func boolConverter(value: String) -> Bool {
        if value == "1" {
            return true
        }
        else {
            return false
        }
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

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

    // MARK: - Navigation

    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func showSetupTeardownTime(sender: AnyObject) {
        if self.showSetupTeardownTime.on {
           CalendarFilter.instance.showSetupTeardownTime = "1"
        }
        else {
           CalendarFilter.instance.showSetupTeardownTime = "0"
        }
        debugPrint(CalendarFilter.instance.showSetupTeardownTime)
    }
    
    @IBAction func showTitleLocation(sender: AnyObject) {
        if self.showTitleLocation.on {
            CalendarFilter.instance.showTitleLocation = "1"
        }
        else {
            CalendarFilter.instance.showTitleLocation = "0"
        }
        debugPrint(CalendarFilter.instance.showTitleLocation)
    }
    
    @IBAction func showTitleActivity(sender: AnyObject) {
        if self.showTitleActivity.on {
            CalendarFilter.instance.showTitleActivity = "1"
        }
        else {
            CalendarFilter.instance.showTitleActivity = "0"
        }
        debugPrint(CalendarFilter.instance.showTitleActivity)
    }
    
    @IBAction func showTitleEndTime(sender: AnyObject) {
        if self.showTitleEndTime.on {
            CalendarFilter.instance.showTitleEndTime = "1"
        }
        else {
            CalendarFilter.instance.showTitleEndTime = "0"
        }
        debugPrint(CalendarFilter.instance.showTitleEndTime)
    }
    
    @IBAction func showExpectedAttendance(sender: AnyObject) {
        if self.showExpectedAttendance.on {
            CalendarFilter.instance.showExpectedAttendance = "1"
        }
        else {
            CalendarFilter.instance.showExpectedAttendance = "0"
        }
        debugPrint(CalendarFilter.instance.showExpectedAttendance)
    }
    
    @IBAction func showCancelledPermit(sender: AnyObject) {
        if self.showCancelledPermit.on {
            CalendarFilter.instance.showCancelledPermit = "1"
        }
        else {
            CalendarFilter.instance.showCancelledPermit = "0"
        }
        debugPrint(CalendarFilter.instance.showCancelledPermit)
    }
    
    @IBAction func backToCalendar(sender: AnyObject) {
        //let presentingViewController: UIViewController! = self.presentingViewController
        
        //self.dismissViewControllerAnimated(false) {
            // go back to MainMenuView as the eyes of the user
        //    presentingViewController.dismissViewControllerAnimated(false, completion: nil)
        //}
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
