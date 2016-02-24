//
//  FSCalendarWeekViewController.swift
//  FacilityScheduler
//
//  Created by Paul Andrew Gutib on 04/01/2016.
//  Copyright © 2016 rSchoolToday. All rights reserved.
//

import UIKit

class FSCalendarWeekViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    @IBOutlet weak var timeView: UICollectionView!
    @IBOutlet weak var timeLabel: UICollectionView!
    
    let calendarDate = CalendarDate()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.timeView.backgroundColor = UIColor.whiteColor()
        self.timeLabel.backgroundColor = UIColor.whiteColor()
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
        if collectionView == self.timeView {
            return 15*31
        }
        else if collectionView == self.timeLabel {
            return 15
        }
        else {
            return 8
        }
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("FSCalendarWeekCollectionViewCell", forIndexPath: indexPath) as! FSCalendarWeekCollectionViewCell
        
        // Configure the cell
        cell.layer.borderWidth = 0.5
        cell.layer.borderColor = UIColor.grayColor().CGColor
        if collectionView == timeView {
            if indexPath.row % 15 == 0 {
                let dateVal = (indexPath.row / 15) + 1
                if dateVal <= calendarDate.maxDays[calendarDate.selectedMonth!] {
                    let weekDay = calendarDate.getWeekDay(calendarDate.currentYear!, month: calendarDate.selectedMonth!, day: dateVal)
                    cell.calendarCell.text = "\(dateVal)\n" + calendarDate.dayOfWeeks[weekDay]
                }
                else {
                    cell.calendarCell.text = " "
                }
            }
            else {
                cell.calendarCell.text = " "
            }
        }
        else if collectionView == self.timeLabel {
            if indexPath.row == 0 {
                cell.calendarCell.text = calendarDate.calendarMonths[calendarDate.currentMonth!] + "\n\(calendarDate.currentYear!)"
            }
            else if indexPath.row+6 <= 12 {
                cell.calendarCell.text = "\(indexPath.row+5) AM"
            }
            else {
                cell.calendarCell.text = "\(indexPath.row-6) PM"
            }
        }
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let screenSize = UIScreen.mainScreen().bounds
        var cellWidth: CGFloat?
        if collectionView == self.timeLabel {
            cellWidth = 70.0
        }
        else {
            cellWidth = screenSize.width / 9.001
        }
        let cellHeight: CGFloat = timeView.bounds.height / 15.001
        return CGSize(width: cellWidth!, height: cellHeight)
    }
    
    @IBAction func fetchEvents(sender: AnyObject) {
        CalendarFilter.instance.eventList.removeAll()
        CalendarFilter.instance.getcalendarevents()
        //self.eventList.reloadData()
    }

}
