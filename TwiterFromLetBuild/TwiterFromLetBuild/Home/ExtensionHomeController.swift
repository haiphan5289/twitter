//
//  ExtensionHomeController.swift
//  TwiterFromLetBuild
//
//  Created by HaiPhan on 9/1/19.
//  Copyright © 2019 HaiPhan. All rights reserved.
//

import UIKit

extension HomeController {
    func setupNavigation(){
        self.view.backgroundColor = ColorBR.share.ColorBRSetup(type: .View)
        setupRemainNavigationItem()
        setupLeftNavigationItem()
        setupRightNavigationItems()
    }
    
    private func setupRemainNavigationItem(){
        let img: UIImageView = UIImageView()
        img.image = UIImage(named: "twitter")?.withRenderingMode(.alwaysOriginal)
        img.contentMode = .scaleAspectFit
        img.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        self.navigationItem.titleView = img
        
        self.navigationController?.navigationBar.backgroundColor = ColorBR.share.ColorBRSetup(type: .View)
        self.navigationController?.navigationBar.isTranslucent = false
        //remove border navigation
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    
    }
    
    private func setupLeftNavigationItem(){
        let btLeft = UIButton(type: .system)
        btLeft.setImage(UIImage(named: "plus")?.withRenderingMode(.alwaysOriginal), for: .normal)
        btLeft.imageView?.contentMode = .scaleAspectFit
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btLeft)
    }
    private func setupRightNavigationItems(){
        let btSearch = UIButton(type: .system)
        btSearch.setImage(UIImage(named: "search")?.withRenderingMode(.alwaysOriginal), for: .normal)
        btSearch.imageView?.contentMode = .scaleAspectFit
        
        let btCompose = UIButton(type: .system)
        btCompose.setImage(UIImage(named: "compose")?.withRenderingMode(.alwaysOriginal), for: .normal)
        btCompose.imageView?.contentMode = .scaleAspectFit
        
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: btCompose),
                                                   UIBarButtonItem(customView: btSearch)]
    }
}
