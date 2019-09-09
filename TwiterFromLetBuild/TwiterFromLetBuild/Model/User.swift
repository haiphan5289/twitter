//
//  User.swift
//  TwiterFromLetBuild
//
//  Created by HaiPhan on 8/30/19.
//  Copyright © 2019 HaiPhan. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON
import TRON

struct User: JSONDecodable {
    var name: String
    var username: String
    var bioTextView: String
    var profileIMG: String
    //khởi tạo 1 hàm init với biến là Json gồn các thuộc tính khởi tạo
    init(json: JSON) {
        self.name = json["name"].stringValue
        self.username = json["username"].stringValue
        self.bioTextView = json["bio"].stringValue
        self.profileIMG = json["profileIMGUrl"].stringValue
    }
}

struct Tweet: JSONDecodable {
    var user: User
    var message: String
    //khởi tạo 1 hàm init với biến là Json gồn các thuộc tính khởi tạo
    init(json: JSON) {
        let userJson = json["user"]
        self.user = User(json: userJson)
        self.message = json["message"].stringValue
    }
}
