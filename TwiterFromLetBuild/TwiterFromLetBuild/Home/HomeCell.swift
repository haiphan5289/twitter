//
//  HomeCell.swift
//  TwiterFromLetBuild
//
//  Created by HaiPhan on 8/30/19.
//  Copyright © 2019 HaiPhan. All rights reserved.
//

import UIKit

class HomeCell: BaseCell {
    var message: User?
    {
        didSet{
            guard let mess = message else { return }
            lblName.text = mess.name
            lbUserName.text = mess.username
            bioTextView.text = mess.bioTextView
            profileIMG.loadIMG(text: mess.profileIMG)
        }
    }
    var lblName: UILabel!
    var profileIMG: UIImageView!
    var btFollow: UIButton!
    var lbUserName: UILabel!
    var bioTextView: UITextView!
    override func setupInitial() {
        super.setupInitial()
        setupViews()
    }
    func setupViews(){
        self.backgroundColor = ColorBR.share.ColorBRSetup(type: .View)
        setupProfileIMG()
        setupFollowBT()
        setupName()
        setupUserName()
        setupTextView()
    }
    
    func setupProfileIMG(){
        profileIMG = UIImageView()
        profileIMG.image = UIImage(named: "profile")
        profileIMG.contentMode = .scaleAspectFit
        profileIMG.layer.cornerRadius = 5
        profileIMG.clipsToBounds = true
        self.addSubview(profileIMG)
        profileIMG.snp.makeConstraints { (make) in
            make.left.top.equalToSuperview().offset(12)
            make.width.height.equalTo(50)
        }
    }
    
    
    func setupFollowBT(){
        btFollow = UIButton(type: .system)
        btFollow.setTitle("Follow", for: .normal)
        btFollow.setTitleColor(ColorBR.share.ColorBRSetup(type: .TextButtonFollow), for: .normal)
        btFollow.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        btFollow.layer.cornerRadius = 5
        btFollow.clipsToBounds = true
        btFollow.layer.borderColor = ColorBR.share.ColorBRSetup(type: .TextButtonFollow).cgColor
        btFollow.layer.borderWidth = 1
        btFollow.setImage(UIImage(named: "star"), for: .normal)
        btFollow.imageView?.contentMode = .scaleAspectFit
        btFollow.imageEdgeInsets = UIEdgeInsets(top: 0, left: -8, bottom: 0, right: 0)
        self.addSubview(btFollow)
        btFollow.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(12)
            make.right.equalToSuperview().inset(12)
            make.width.equalTo(120)
            make.height.equalTo(34)
        }
    }
    
    func setupName(){
        lblName = UILabel()
        lblName.text = "Hải Phan"
        lblName.font = UIFont.boldSystemFont(ofSize: 16)
        self.addSubview(lblName)
        lblName.snp.makeConstraints { (make) in
            make.top.equalTo(profileIMG.snp.top)
            make.left.equalTo(profileIMG.snp.right).offset(8)
            make.right.equalTo(btFollow.snp.left).inset(-12)
            make.height.equalTo(20)
        }
    }
    func setupUserName(){
        lbUserName = UILabel()
        lbUserName.text = "@123456"
        lbUserName.font = UIFont.systemFont(ofSize: 14)
        lbUserName.textColor = ColorBR.share.ColorBRSetup(type: .TextCellUserName)
        self.addSubview(lbUserName)
        lbUserName.snp.makeConstraints { (make) in
            make.top.equalTo(lblName.snp.bottom)
            make.left.right.equalTo(lblName)
            make.height.equalTo(20)
        }
    }
    func setupTextView(){
        bioTextView = UITextView()
        bioTextView.text = "Bộ phận hỗ trợ Vé Máy Bay sẽ tiếp nhận và liên hệ lại trong thời gian sớm nhất, anh vui lòng kiểm tra thông tin trên và phản hồi email này nếu cần thay đổi yêu cầu."
        bioTextView.font = UIFont.systemFont(ofSize: 15)
        bioTextView.backgroundColor = ColorBR.share.ColorBRSetup(type: .View)
        self.addSubview(bioTextView)
        bioTextView.snp.makeConstraints { (make) in
            make.top.equalTo(lbUserName.snp.bottom).offset(-4)
            make.left.equalTo(lbUserName).offset(-4)
            make.bottom.right.equalToSuperview()
        }
    }
}
