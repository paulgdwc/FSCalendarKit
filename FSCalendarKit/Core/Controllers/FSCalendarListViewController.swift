//
//  FSCalendarListViewController.swift
//  FSCalendar
//
//  Created by Paul Andrew Gutib on 12/01/2016.
//  Copyright © 2016 rSchoolToday. All rights reserved.
//

import UIKit

class FSCalendarListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var weekDisplay: UILabel!
    
    let calendarDate = CalendarDate()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.weekDisplay.text = calendarDate.dayOfWeeksLong[calendarDate.getWeekDay(calendarDate.currentYear!, month: calendarDate.currentMonth!, day: calendarDate.currentDay!)] + ", " + calendarDate.calendarMonths[calendarDate.currentMonth!] + " \(calendarDate.currentDay!), \(calendarDate.currentYear!)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 7 // 7 days in a week
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FSCalendarListTableViewCell", forIndexPath: indexPath) as! FSCalendarListTableViewCell
    
        // Configure the cell...
    
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func previousWeek(sender: AnyObject) {
        
    }
    
    @IBAction func nextWeek(sender: AnyObject) {
        
    }

}
