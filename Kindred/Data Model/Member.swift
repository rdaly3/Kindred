//
//  User.swift
//  Kindred
//
//  Created by Administrator on 2/13/18.
//  Copyright © 2018 Administrator. All rights reserved.
//

import Foundation
import RealmSwift

class Member: Object {
    @objc dynamic var memberEmail: String = ""
    @objc dynamic var memberName : String = ""
    var parentCategory = LinkingObjects(fromType: Activity.self, property: "members")
}
