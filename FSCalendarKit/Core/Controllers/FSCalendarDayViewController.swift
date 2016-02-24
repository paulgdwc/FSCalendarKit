//
//  FSCalendarDayViewController.swift
//  FacilityScheduler
//
//  Created by Paul Andrew Gutib on 06/01/2016.
//  Copyright © 2016 rSchoolToday. All rights reserved.
//

import UIKit

class FSCalendarDayViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    @IBOutlet weak var timeScheds: UICollectionView!
    @IBOutlet weak var dateDisplay: UILabel!
    
    let calendarDate = CalendarDate()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        timeScheds.backgroundColor = UIColor.whiteColor()
        self.dateDisplay.text = calendarDate.dayOfWeeksLong[calendarDate.getWeekDay(calendarDate.currentYear!, month: calendarDate.currentMonth!, day: calendarDate.currentDay!)] + ", " + calendarDate.calendarMonths[calendarDate.currentMonth!] + " \(calendarDate.currentDay!), \(calendarDate.currentYear!)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 30
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("FSCalendarDayCollectionViewCell", forIndexPath: indexPath) as! FSCalendarDayCollectionViewCell
        
        // Configure the cell
        cell.layer.borderWidth = 0.5
        cell.layer.borderColor = UIColor.grayColor().CGColor
        
        let column = indexPath.row % 2
        if column == 0 { // only put labels in the first cell of every row
            let row = indexPath.row / 2
            if row <= 6 {
                cell.calendarCell.text = "\(row + 6) AM"
            }
            else {
                cell.calendarCell.text = "\(row - 6) PM"
            }
        }
        else {
            cell.calendarCell.text = " "
        }
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let screenSize = UIScreen.mainScreen().bounds
        let column = indexPath.row % 2
        var cellWidth = screenSize.width / 3.001
        if column != 0 {
            cellWidth = cellWidth * 2
        }
        return CGSize(width: cellWidth, height: timeScheds.bounds.height / 15) // 15 rows in total for schedules, 2 column for each
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func fetchEvents(sender: AnyObject) {
        CalendarFilter.instance.eventList.removeAll()
        CalendarFilter.instance.getcalendarevents()
    }
    
    @IBAction func yesterday(sender: AnyObject) {
        calendarDate.currentDay!--
        if calendarDate.currentDay! < 1 {
            calendarDate.currentMonth!--
            calendarDate.currentDay! = calendarDate.maxDays[calendarDate.currentMonth!]
        }
        self.dateDisplay.text = calendarDate.dayOfWeeksLong[calendarDate.getWeekDay(calendarDate.currentYear!, month: calendarDate.currentMonth!, day: calendarDate.currentDay!)] + ", " + calendarDate.calendarMonths[calendarDate.currentMonth!] + " \(calendarDate.currentDay!), \(calendarDate.currentYear!)"
    }
    
    @IBAction func tomorrow(sender: AnyObject) {
        calendarDate.currentDay!++
        if calendarDate.currentDay! > calendarDate.maxDays[calendarDate.currentMonth!] {
            calendarDate.currentMonth!++
            calendarDate.currentDay! = 1
        }
        self.dateDisplay.text = calendarDate.dayOfWeeksLong[calendarDate.getWeekDay(calendarDate.currentYear!, month: calendarDate.currentMonth!, day: calendarDate.currentDay!)] + ", " + calendarDate.calendarMonths[calendarDate.currentMonth!] + " \(calendarDate.currentDay!), \(calendarDate.currentYear!)"
    }
}
