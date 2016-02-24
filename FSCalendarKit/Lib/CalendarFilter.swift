//
//  CalendarFilter.swift
//  FSCalendar
//
//  Created by Paul Andrew Gutib on 08/02/2016.
//  Copyright © 2016 rSchoolToday. All rights reserved.
//

import Foundation
import Alamofire
import SwiftSpinner
import SwiftyJSON

class CalendarFilter {
    
    static let instance = CalendarFilter()
    
    var viewtype: String?
    var location_id = "0"
    var building_id = "0"
    var month_year: String?
    var showTitleLocation = "0"
    var showTitleActivity = "0"
    var showTitleEndTime = "0"
    var showExpectedAttendance = "0"
    var showSetupTeardownTime = "0"
    var showCancelledPermit = "0"
    var sortby: String?
    var fromtime: String?
    var totime: String?
    
    var selectedBuildingsIndex = [Int]()
    var selectedLocationsIndex = [Int]()
    
    var eventList = [FSEvent]()
    
    init(){
        
    }
    
    func getcalendarevents() {
        SwiftSpinner.show("Loading...");
        Alamofire.request(Router.getcalendarevents(viewtype: "1", location_id: self.location_id, building_id: self.building_id, month_year: "022016", showTitleLocation: self.showTitleLocation, showTitleActivity: self.showTitleActivity, showTitleEndTime: self.showTitleEndTime, showExpectedAttendance: self.showExpectedAttendance, showSetupTeardownTime: self.showSetupTeardownTime, showCancelledPermit: self.showCancelledPermit, sortby: "time", fromtime: "", totime: "")).responseJSON { response in
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
            for event in responseData["activities"] {
                self.eventList.append(FSEvent(modelAttr: event.1.dictionaryObject!))
            }
            SwiftSpinner.hide()
        }
    }
    
}