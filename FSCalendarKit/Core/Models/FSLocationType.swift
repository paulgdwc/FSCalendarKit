//
//  FSLocationType.swift
//  FSCalendar
//
//  Created by Paul Andrew Gutib on 02/02/2016.
//  Copyright © 2016 rSchoolToday. All rights reserved.
//

import Foundation

class FSLocationType: FSModel {
    var id: String
    var name: String
    var capacity: String
    var hourly: String
    var daily: String
    var account_code_id: String
    //var set_up: String
    //var tear_down: String
    var deleted: String
    var updated_on: String
    var updated_by_id: String
    
    override init(modelAttr:[String:AnyObject]){
        self.id = modelAttr["id"] as! String
        self.name = modelAttr["name"] as! String
        self.capacity = modelAttr["capacity"] as! String
        self.hourly = modelAttr["hourly"] as! String
        self.daily = modelAttr["daily"] as! String
        self.account_code_id = modelAttr["account_code_id"] as! String
        self.deleted = modelAttr["deleted"] as! String
        self.updated_on = modelAttr["updated_on"] as! String
        self.updated_by_id = modelAttr["updated_by_id"] as! String
        
        super.init(modelAttr: modelAttr)
    }
}