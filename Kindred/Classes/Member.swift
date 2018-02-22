//
//  Member.swift
//  Kindred
//
//  Created by Administrator on 2/21/18.
//  Copyright © 2018 Administrator. All rights reserved.
//

import Foundation
import RealmSwift

class Member: Object {
    @objc dynamic var name : String = ""
    @objc dynamic var email : String = ""
    
}
