//
//  FSCalendarMonthViewController.swift
//  FacilityScheduler
//
//  Created by Paul Andrew Gutib on 15/12/2015.
//  Copyright © 2015 rSchoolToday. All rights reserved.
//

import UIKit

class FSCalendarMonthViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var monthView: UICollectionView!
    @IBOutlet weak var weekLabel: UICollectionView!
    @IBOutlet weak var monthTitle: UILabel!
    @IBOutlet weak var eventList: UITableView!
    @IBOutlet weak var selectedDateDisplay: UILabel!
    
    let calendarDate = CalendarDate()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.monthView.backgroundColor = UIColor.whiteColor()
        self.weekLabel.backgroundColor = UIColor.whiteColor()
        
        self.selectedDateDisplay.text = "\(calendarDate.components!.year)-" + String(format: "%02d", calendarDate.components!.month) + "-\(calendarDate.components!.day)"
        self.monthTitle.text = calendarDate.calendarMonths[calendarDate.currentMonth!] + " \(calendarDate.currentYear!)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        if collectionView == monthView {
            return 42
        }
        else {
            return 7
        }
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("FSCalendarMonthCollectionViewCell", forIndexPath: indexPath) as! FSCalendarMonthCollectionViewCell
        
        // Configure the cell
        cell.backgroundColor = UIColor.whiteColor()
        cell.layer.borderColor = UIColor.grayColor().CGColor
        cell.calendarCell.textColor = UIColor.blackColor()
        if collectionView == monthView {
            cell.layer.borderWidth = 0.5
            let currentDay = indexPath.row - calendarDate.startingWeekDay!
            if calendarDate.startingWeekDay! <= indexPath.row && currentDay < calendarDate.maxDays[calendarDate.selectedMonth!] {
                if currentDay+1 == calendarDate.currentDay && calendarDate.currentMonth == calendarDate.selectedMonth {
                    cell.backgroundColor = UIColor.lightGrayColor()
                    cell.calendarCell.textColor = UIColor.whiteColor()
                }
                cell.calendarCell.text = "\(currentDay + 1)"
            }
            else {
                cell.calendarCell.text = " "
            }
        }
        else {
            cell.calendarCell.text = calendarDate.dayOfWeeks[indexPath.row]
        }
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let screenSize = UIScreen.mainScreen().bounds
        let cellWidth: CGFloat = screenSize.width / 7
        var cellHeight: CGFloat?
        if collectionView == monthView {
            cellHeight = 35
        }
        else {
            cellHeight = 25.0
        }
        return CGSize(width: cellWidth, height: cellHeight!)
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        calendarDate.events.removeAll()
        let cell = collectionView.cellForItemAtIndexPath(indexPath) as! FSCalendarMonthCollectionViewCell
        cell.backgroundColor = UIColor.darkGrayColor()
        cell.calendarCell.textColor = UIColor.whiteColor()
        let selectedDay = "\(calendarDate.currentYear!)-" + String(format: "%02d", calendarDate.selectedMonth!+1) + "-" + String(format: "%02d", Int(cell.calendarCell.text!)!)
        for event in CalendarFilter.instance.eventList {
            if event.date == selectedDay {
                calendarDate.events.append(event)
            }
        }
        self.selectedDateDisplay.text = selectedDay
        self.eventList.reloadData()
        debugPrint(selectedDay)
    }
    
    func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.cellForItemAtIndexPath(indexPath) as! FSCalendarMonthCollectionViewCell
        cell.backgroundColor = UIColor.whiteColor()
        cell.calendarCell.textColor = UIColor.blackColor()
        let currentDay = indexPath.row - calendarDate.startingWeekDay!
        if currentDay+1 == calendarDate.currentDay && calendarDate.currentMonth == calendarDate.selectedMonth {
            cell.backgroundColor = UIColor.lightGrayColor()
            cell.calendarCell.textColor = UIColor.whiteColor()
        }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return calendarDate.events.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.textLabel?.text = calendarDate.events[indexPath.row].activity_name!
        return cell
    }
    
    @IBAction func prevMonth(sender: AnyObject) {
        if calendarDate.selectedMonth != 0 {
            calendarDate.selectedMonth = calendarDate.selectedMonth! - 1
            self.monthTitle.text = calendarDate.calendarMonths[calendarDate.selectedMonth!] + " \(calendarDate.currentYear!)"
        }
        else {
            calendarDate.selectedMonth = 11
            calendarDate.currentYear = calendarDate.currentYear! - 1
            self.monthTitle.text = calendarDate.calendarMonths[calendarDate.selectedMonth!] + " \(calendarDate.currentYear!)"
        }
        self.refreshCalendarDates()
    }
    
    @IBAction func nextMonth(sender: AnyObject) {
        if calendarDate.selectedMonth != 11 {
            calendarDate.selectedMonth = calendarDate.selectedMonth! + 1
            self.monthTitle.text = calendarDate.calendarMonths[calendarDate.selectedMonth!] + " \(calendarDate.currentYear!)"
        }
        else {
            calendarDate.selectedMonth = 0
            calendarDate.currentYear = calendarDate.currentYear! + 1
            self.monthTitle.text = calendarDate.calendarMonths[calendarDate.selectedMonth!] + " \(calendarDate.currentYear!)"
        }
        self.refreshCalendarDates()
    }
    
    @IBAction func fetchEvents(sender: AnyObject) {
        CalendarFilter.instance.eventList.removeAll()
        CalendarFilter.instance.getcalendarevents()
        self.eventList.reloadData()
    }
    
    func refreshCalendarDates() {
        calendarDate.firstDayOfMonth.year = calendarDate.currentYear!
        calendarDate.firstDayOfMonth.month = calendarDate.selectedMonth! + 1
        calendarDate.firstDayOfMonth.day = 1
        let firstDay = NSCalendar.currentCalendar().dateFromComponents(calendarDate.firstDayOfMonth)!
        let firstDayComponents = calendarDate.calendar.components([.Day , .Month , .Year, .Weekday], fromDate: firstDay)
        calendarDate.startingWeekDay = firstDayComponents.weekday - 1
        self.monthView.reloadData()
    }

}
