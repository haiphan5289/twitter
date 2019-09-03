//
//  BaseCell.swift
//  TwiterFromLetBuild
//
//  Created by HaiPhan on 8/30/19.
//  Copyright © 2019 HaiPhan. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupInitial()
    }
    
    func setupInitial(){
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
