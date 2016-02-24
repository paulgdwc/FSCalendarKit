//
//  FSEvent.swift
//  FSCalendar
//
//  Created by Paul Andrew Gutib on 11/02/2016.
//  Copyright © 2016 rSchoolToday. All rights reserved.
//

import Foundation

class FSEvent: FSModel {
    var id: String?
    var updated_on: String?
    var end_time: String?
    var reserve_space: String?
    var contact_name: String?
    var updated_by: String?
    var building_id: String?
    var calendar_view: String?
    var staff_name: String?
    var activity_name: String?
    var location_name: String?
    var client_name: String?
    var as_is_published: String?
    var shared_space: String?
    var app_source: String?
    var event_id: String?
    var is_entire_building: String?
    var all_day: String?
    var event_cancelled: String?
    var setup_time: String?
    var date: String?
    var location_id: String?
    var building_abbr: String?
    var status: String?
    var teardown_time: String?
    var public_comment: String?
    var setup_notes: String?
    var client_id: String?
    var contact_email: String?
    var recurring: String?
    var cancelled: String?
    var start_time: String?
    var facility_name: String?
    var building_name: String?
    var building_type: String?
    var calendar_event_type: String?
    var permit: String?
    var allow_bookings: String?
    var expected_attendance: String?
    
    
    override init(modelAttr:[String:AnyObject]){
        self.id = modelAttr["id"] as? String
        self.updated_on = modelAttr["updated_on"] as? String
        self.end_time = modelAttr["end_time"] as? String
        self.reserve_space = modelAttr["reserve_space"] as? String
        self.contact_name = modelAttr["contact_name"] as? String
        self.updated_by = modelAttr["updated_by"] as? String
        self.building_id = modelAttr["building_id"] as? String
        self.calendar_view = modelAttr["calendar_view"] as? String
        self.staff_name = modelAttr["staff_name"] as? String
        self.activity_name = modelAttr["activity_name"] as? String
        self.location_name = modelAttr["location_name"] as? String
        self.client_name = modelAttr["client_name"] as? String
        self.as_is_published = modelAttr["as_is_published"] as? String
        self.shared_space = modelAttr["shared_space"] as? String
        self.app_source = modelAttr["app_source"] as? String
        self.event_id = modelAttr["event_id"] as? String
        self.is_entire_building = modelAttr["is_entire_building"] as? String
        self.all_day = modelAttr["all_day"] as? String
        self.event_cancelled = modelAttr["event_cancelled"] as? String
        self.setup_time = modelAttr["setup_time"] as? String
        self.date = modelAttr["date"] as? String
        self.location_id = modelAttr["location_id"] as? String
        self.building_abbr = modelAttr["building_abbr"] as? String
        self.status = modelAttr["status"] as? String
        self.teardown_time = modelAttr["teardown_time"] as? String
        self.public_comment = modelAttr["public_comment"] as? String
        self.teardown_time = modelAttr["teardown_time"] as? String
        self.setup_notes = modelAttr["setup_notes"] as? String
        self.client_id = modelAttr["client_id"] as? String
        self.contact_email = modelAttr["contact_email"] as? String
        self.recurring = modelAttr["recurring"] as? String
        self.cancelled = modelAttr["cancelled"] as? String
        self.start_time = modelAttr["start_time"] as? String
        self.facility_name = modelAttr["facility_name"] as? String
        self.building_name = modelAttr["building_name"] as? String
        self.calendar_event_type = modelAttr["calendar_event_type"] as? String
        self.permit = modelAttr["permit"] as? String
        self.allow_bookings = modelAttr["allow_bookings"] as? String
        self.expected_attendance = modelAttr["expected_attendance"] as? String
        
        super.init(modelAttr: modelAttr)
    }
}