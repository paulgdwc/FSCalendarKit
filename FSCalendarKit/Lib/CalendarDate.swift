//
//  CalendarDate.swift
//  FSCalendar
//
//  Created by Paul Andrew Gutib on 16/02/2016.
//  Copyright © 2016 rSchoolToday. All rights reserved.
//

import Foundation

class CalendarDate {
    
    var calendarMonths = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    var currentYear: Int?
    var currentMonth: Int?
    var selectedMonth: Int?
    var currentDay: Int?
    let maxDays = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    var startingWeekDay: Int?
    let currentDate = NSDate()
    let calendar = NSCalendar.currentCalendar()
    var firstDayOfMonth = NSDateComponents()
    var events = [FSEvent]()
    var components: NSDateComponents?
    var dayOfWeeks = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    var dayOfWeeksLong = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    
    init() {
        self.components = self.calendar.components([.Day , .Month , .Year, .Weekday], fromDate: self.currentDate)
        
        self.currentMonth = self.components!.month - 1
        self.selectedMonth =  self.currentMonth
        self.currentYear = self.components!.year
        self.currentDay = self.components!.day
        
        self.firstDayOfMonth.year = self.components!.year
        self.firstDayOfMonth.month = self.components!.month
        self.firstDayOfMonth.day = 1
        let firstDay = NSCalendar.currentCalendar().dateFromComponents(self.firstDayOfMonth)!
        let firstDayComponents = self.calendar.components([.Day , .Month , .Year, .Weekday], fromDate: firstDay)
        self.startingWeekDay = firstDayComponents.weekday - 1
    }
    
    func getWeekDay(year: Int, month: Int, day: Int) -> Int {
        let dateComponents = NSDateComponents()
        dateComponents.year = year
        dateComponents.month = month + 1
        dateComponents.day = day
        let dayVal = NSCalendar.currentCalendar().dateFromComponents(dateComponents)!
        let dayValComponents = self.calendar.components([.Day , .Month , .Year, .Weekday], fromDate: dayVal)
        return dayValComponents.weekday-1
    }
    
}