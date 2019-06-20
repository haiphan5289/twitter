//
//  Home_Naivigation.swift
//  twitter
//
//  Created by HaiPhan on 6/20/19.
//  Copyright © 2019 HaiPhan. All rights reserved.
//

import UIKit

extension HomeController {
    
    func setup_navigation_item(){
        left_bar_button()
        right_bar_button()
        title_view_navigation()
    }
    //setup - right barbutton
    //add 2 button bên right
    func right_bar_button(){
        let search: UIButton = UIButton(type: .custom)
        search.setImage(UIImage(named: "search")?.withRenderingMode(.alwaysOriginal), for: .normal)
        search.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        
        
        let compose: UIButton = UIButton(type: .custom)
        compose.setImage(UIImage(named: "compose")?.withRenderingMode(.alwaysOriginal), for: .normal)
        compose.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: compose), UIBarButtonItem(customView: search)]
    }
    
    //setup -ttileview
    func title_view_navigation(){
        let image = UIImageView(image: UIImage(named: "twitter")?.withRenderingMode(.alwaysOriginal))
        image.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        image.contentMode = .scaleAspectFit
        navigationItem.titleView = image
        
        navigationController?.navigationBar.backgroundColor = UIColor.white
        navigationController?.navigationBar.isTranslucent = false
    }
    
    //Setup left bar button
    func left_bar_button(){
        //chế độ custom mới hiện hình đc, systm sẽ hiển thị background màu xanh
        let contact: UIButton = UIButton(type: .custom)
        //luôn lấy hiinh gốc
        contact.setImage(UIImage(named: "new_contact")?.withRenderingMode(.alwaysOriginal), for: .normal)
        contact.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: contact)
    }
}
