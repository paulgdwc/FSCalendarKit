//
//  FSBuildingType.swift
//  FSCalendar
//
//  Created by Paul Andrew Gutib on 30/01/2016.
//  Copyright © 2016 rSchoolToday. All rights reserved.
//

import Foundation

class FSBuildingType: FSModel {
    var id: String
    var buildingtypes_name: String
    
    override init(modelAttr:[String:AnyObject]){
        self.id = modelAttr["id"] as! String
        self.buildingtypes_name = modelAttr["buildingtypes_name"] as! String
        
        super.init(modelAttr: modelAttr)
    }
}