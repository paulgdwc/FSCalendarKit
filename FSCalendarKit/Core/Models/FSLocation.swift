//
//  FSLocation.swift
//  FSCalendar
//
//  Created by Paul Andrew Gutib on 01/02/2016.
//  Copyright © 2016 rSchoolToday. All rights reserved.
//

import Foundation

class FSLocation: FSModel {
    var id: String
    var building_id: String
    var name: String
    var online: String
    var deleted: String
    var location_type_id: String
    var app_access: String
    var parent_location_id: String
    var updated_by_id: String
    var updated_on: String
    //var picture_file_id: String
    //var description: String
    var view: String
    //var event_id: String
    var building_name: String
    //var building_abbr: String
    //var location_type: String
    var capacity: String
    var booking_requester_rate: String
    var requester_rate: String
    var location_requester_rate_type: String
    
    override init(modelAttr:[String:AnyObject]){
        self.id = modelAttr["id"] as! String
        self.building_id = modelAttr["building_id"] as! String
        self.name = modelAttr["name"] as! String
        self.online = modelAttr["online"] as! String
        self.deleted = modelAttr["deleted"] as! String
        self.location_type_id = modelAttr["location_type_id"] as! String
        self.app_access = modelAttr["app_access"] as! String
        self.parent_location_id = modelAttr["parent_location_id"] as! String
        self.updated_by_id = modelAttr["updated_by_id"] as! String
        self.updated_on = modelAttr["updated_on"] as! String
        //self.picture_file_id = modelAttr["picture_file_id"] as! String
        //self.description = modelAttr["description"] as! String
        self.view = modelAttr["view"] as! String
        //self.event_id = modelAttr["updated_by_id"] as! String
        self.building_name = modelAttr["building_name"] as! String
        //self.building_abbr = modelAttr["building_abbr"] as! String
        //self.location_type = modelAttr["updated_by_id"] as! String
        self.capacity = modelAttr["capacity"] as! String
        self.booking_requester_rate = modelAttr["booking_requester_rate"] as! String
        self.requester_rate = modelAttr["requester_rate"] as! String
        self.location_requester_rate_type = modelAttr["location_requester_rate_type"] as! String
        
        super.init(modelAttr: modelAttr)
    }
}