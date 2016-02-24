//
//  FSBuilding.swift
//  FSCalendar
//
//  Created by Paul Andrew Gutib on 01/02/2016.
//  Copyright © 2016 rSchoolToday. All rights reserved.
//

import Foundation

class FSBuilding: FSModel {
    var id: String
    var name: String
    var abbr: String
    var online: String
    var address: String
    var city: String
    var state: String
    var zip: String
    var active: String
    var deleted: String
    var updated_on: String
    //var picture_file_id: String
    //var description: String
    var updated_by_id: String
    
    override init(modelAttr:[String:AnyObject]){
        self.id = modelAttr["id"] as! String
        self.name = modelAttr["name"] as! String
        self.abbr = modelAttr["abbr"] as! String
        self.online = modelAttr["online"] as! String
        self.address = modelAttr["address"] as! String
        self.city = modelAttr["city"] as! String
        self.state = modelAttr["state"] as! String
        self.zip = modelAttr["zip"] as! String
        self.active = modelAttr["active"] as! String
        self.deleted = modelAttr["deleted"] as! String
        self.updated_on = modelAttr["updated_on"] as! String
        //self.picture_file_id = modelAttr["picture_file_id"] as! String
        //self.description = modelAttr["description"] as! String
        self.updated_by_id = modelAttr["updated_by_id"] as! String
        
        super.init(modelAttr: modelAttr)
    }
}