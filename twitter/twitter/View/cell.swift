//
//  cell.swift
//  twitter
//
//  Created by HaiPhan on 6/20/19.
//  Copyright © 2019 HaiPhan. All rights reserved.
//

import UIKit

class wordcell : UICollectionViewCell {
    var twitter_blue: UIColor!
    
    var user_cell: User! {
        didSet {
            profile_image.image = user_cell.profile_image.image
            name_label.text = user_cell.name
            user_name.text = user_cell.user_name
            biotexxtview.text = user_cell.biotext
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        twitter_blue = UIColor(red: 61/255, green: 167/255, blue: 244/255, alpha: 1)
        setup_views()
    }
    
    func setup_views(){
        self.backgroundColor = .white
        
        addSubview(name_label)
        profile_image_autolayout()
        follow_autolayout()
        autolayout_name_label()
        user_name_autolayout()
        biotexxtview_autolaytout()
        
        
    }
    
    //add button Follow
    let follow_bt: UIButton = {
        let bt = UIButton()
        //        bt.backgroundColor = UIColor.blue
        bt.layer.cornerRadius = 5
        bt.clipsToBounds = true
        bt.setTitle("Follow", for: .normal)
        bt.setImage(UIImage(named: "plus"), for: .normal)
        bt.setTitleColor(UIColor(red: 61/255, green: 167/255, blue: 244/255, alpha: 1), for: .normal)
        bt.layer.borderColor = UIColor(red: 61/255, green: 167/255, blue: 244/255, alpha: 1).cgColor
        bt.layer.borderWidth = 1
        bt.imageEdgeInsets = UIEdgeInsets(top: 2, left: -8, bottom: 2, right: 0)
        bt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        bt.contentMode = UIImageView.ContentMode.scaleAspectFit
        return bt
    }()
    //autolayout follow bt
    func follow_autolayout(){
        addSubview(follow_bt)
        follow_bt.translatesAutoresizingMaskIntoConstraints = false
        
        follow_bt.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        follow_bt.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        follow_bt.widthAnchor.constraint(equalToConstant: 120).isActive = true
        follow_bt.heightAnchor.constraint(equalToConstant: 35).isActive = true
    }
    
    //add textview
    let biotexxtview : UITextView = {
        let des = UITextView()
        //        des.backgroundColor = UIColor.yellow
        des.text = "(Ghẹ xanh Thiên Nhiên mới về) ❤ Gía : 650,000 đ /1kg (size 5-6 con /kg)"
        des.font = UIFont.boldSystemFont(ofSize: 15)
        return des
    }()
    //add autolay out text view
    
    func biotexxtview_autolaytout(){
        addSubview(biotexxtview)
        biotexxtview.translatesAutoresizingMaskIntoConstraints = false
        
        biotexxtview.leftAnchor.constraint(equalTo: user_name.leftAnchor, constant: 0).isActive = true
        biotexxtview.topAnchor.constraint(equalTo: user_name.bottomAnchor, constant: 8).isActive = true
        biotexxtview.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        biotexxtview.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 8).isActive = true
    }
    
    //add username
    let user_name: UILabel = {
        let label = UILabel()
        label.text = " @gmail.com"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = UIColor(red: 130/255, green: 130/255, blue: 130/255, alpha: 1)
        //        label.backgroundColor = UIColor.purple
        return label
    }()
    
    //add autolayout username
    func user_name_autolayout(){
        addSubview(user_name)
        user_name.translatesAutoresizingMaskIntoConstraints = false
        
        user_name.leftAnchor.constraint(equalTo: profile_image.rightAnchor, constant: 8).isActive = true
        user_name.topAnchor.constraint(equalTo: name_label.bottomAnchor, constant: 8).isActive = true
        user_name.rightAnchor.constraint(equalTo: follow_bt.leftAnchor, constant: -8).isActive = true
        user_name.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    //add profile image
    let profile_image: UIImageView = {
        let img = UIImageView()
        //        img.backgroundColor = UIColor.red
        img.image = UIImage(named: "profile")
        img.layer.cornerRadius = 5
        img.clipsToBounds = true
        return img
    }()
    
    //Autolayout profile_image
    func profile_image_autolayout(){
        addSubview(profile_image)
        profile_image.translatesAutoresizingMaskIntoConstraints = false
        
        profile_image.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        profile_image.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        profile_image.widthAnchor.constraint(equalToConstant: 50).isActive = true
        profile_image.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    //add label cho cell
    let name_label: UILabel = {
        let label = UILabel()
        label.text = "hihihi"
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        //        label.backgroundColor = UIColor.green
        return label
    }()
    
    //setup aulayout label
    func autolayout_name_label(){
        name_label.translatesAutoresizingMaskIntoConstraints = false
        
        name_label.leftAnchor.constraint(equalTo: profile_image.rightAnchor, constant: 8).isActive = true
        name_label.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        name_label.rightAnchor.constraint(equalTo: follow_bt.leftAnchor, constant: -8).isActive = true
        name_label.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//khởi tạo cell cho header
class header_cell : UICollectionViewCell {
    var twitter_blue: UIColor = UIColor(red: 61/255, green: 167/255, blue: 244/255, alpha: 1)
    let header_text : UILabel = {
        let label = UILabel()
        label.text = "Who to Follow"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(header_text)
        
        header_text.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-12-[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": header_text]))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": header_text]))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//khơi tạo cell cho footer
class footer_cell: UICollectionViewCell {
    let footer_text: UILabel = {
        let t = UILabel()
        t.text = "Show me more"
        t.font = UIFont.boldSystemFont(ofSize: 15)
        t.textColor = UIColor(red: 61/255, green: 167/255, blue: 244/255, alpha: 1)
        return t
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(footer_text)
        
        footer_text.translatesAutoresizingMaskIntoConstraints = false
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-12-[v0]", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": footer_text]))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": footer_text]))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
