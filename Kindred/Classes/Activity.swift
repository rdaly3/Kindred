//
//  File.swift
//  Kindred
//
//  Created by Administrator on 2/21/18.
//  Copyright © 2018 Administrator. All rights reserved.
//

import Foundation
import RealmSwift

class Activity: Object {
    @objc dynamic var name : String = ""
    @objc dynamic var activityDescription : String = ""
    @objc dynamic var timeCreated : String = ""
    let items = List<Member>()
    
}
