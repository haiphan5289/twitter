//
//  user.swift
//  twitter
//
//  Created by HaiPhan on 6/20/19.
//  Copyright © 2019 HaiPhan. All rights reserved.
//

import UIKit

class User {
    var name: String!
    var user_name: String!
    var biotext: String
    var profile_image: UIImageView!
    
    init(name: String, user_name: String, biotext: String, profile_image: UIImageView) {
        self.name = name
        self.user_name = user_name
        self.biotext = biotext
        self.profile_image = profile_image
    }
}
