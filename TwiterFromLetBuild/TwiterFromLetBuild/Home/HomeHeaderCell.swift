//
//  HomeHeaderCell.swift
//  TwiterFromLetBuild
//
//  Created by HaiPhan on 8/31/19.
//  Copyright © 2019 HaiPhan. All rights reserved.
//

import Foundation
import UIKit

class HomeHeaderCell: BaseCell {
    override func setupInitial() {
        super.setupInitial()
        self.backgroundColor = ColorBR.share.ColorBRSetup(type: .NavigationBar)
        setupViews()
    }
    
    func setupViews(){
        let lb = UILabel()
        lb.text = "WHO TO FOLLOW"
        lb.font = UIFont.boldSystemFont(ofSize: 16)
        self.addSubview(lb)
        
        lb.snp.makeConstraints { (make) in
            make.left.top.right.bottom.equalToSuperview()
        }
    }
}

class HomeFooterCell: BaseCell {
    override func setupInitial() {
        super.setupInitial()
        self.backgroundColor = ColorBR.share.ColorBRSetup(type: .View)
        setupViews()
    }
    
    func setupViews(){
        let lb = UILabel()
        lb.text = "Show me more"
        lb.textColor = ColorBR.share.ColorBRSetup(type: .TextButtonFollow)
        lb.font = UIFont.boldSystemFont(ofSize: 16)
        self.addSubview(lb)
        
        lb.snp.makeConstraints { (make) in
            make.left.top.right.bottom.equalToSuperview()
        }
    }
}
