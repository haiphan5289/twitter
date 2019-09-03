//
//  User.swift
//  TwiterFromLetBuild
//
//  Created by HaiPhan on 8/30/19.
//  Copyright © 2019 HaiPhan. All rights reserved.
//

import Foundation
import UIKit

struct User {
    var name: String
    var username: String
    var bioTextView: String
    var profileIMG: String
}

struct Tweet {
    var user: User
    var message: String
}
