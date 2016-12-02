//
//  Users.swift
//  WowAppTest
//
//  Created by Syafiq on 11/24/16.
//  Copyright © 2016 Syafiq. All rights reserved.
//

import SwiftyJSON

class Users {
    var pictureURL: String!
    var username: String!
    
    required init(json: JSON) {
        pictureURL = json["picture"]["medium"].stringValue
        username = json["email"].stringValue
    }
}
