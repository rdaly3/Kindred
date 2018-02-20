//
//  Activity.swift
//  Kindred
//
//  Created by Administrator on 2/13/18.
//  Copyright © 2018 Administrator. All rights reserved.
//

import Foundation
import RealmSwift

class Activity: Object {
    @objc dynamic var fbCreatorEmail: String = ""
    @objc dynamic var creatorName : String = ""
    @objc dynamic var title : String = ""
    @objc dynamic var eventDescription: String = ""
    @objc dynamic var timeCreated: String = ""
    @objc dynamic var eventLat: String = ""
    @objc dynamic var eventLong: String = ""
    let users = List<Member>()
    
}

