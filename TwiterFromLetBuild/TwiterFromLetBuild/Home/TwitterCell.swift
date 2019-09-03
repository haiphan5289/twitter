//
//  TwitterCell.swift
//  TwiterFromLetBuild
//
//  Created by HaiPhan on 9/1/19.
//  Copyright © 2019 HaiPhan. All rights reserved.
//

import UIKit

class TwitterCell: BaseCell {
    var mess: Tweet?{
        didSet{
            guard let mess = mess else { return }
            let attributeString = NSMutableAttributedString(string: mess.user.name,
                                                            attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)])
            let username = mess.user.username + "\n"
            attributeString.append(NSMutableAttributedString(string: username,
                                                             attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 15), NSAttributedString.Key.foregroundColor: ColorBR.share.ColorBRSetup(type: .TextCellUserName)]))
            let paraStyle = NSMutableParagraphStyle()
            paraStyle.lineSpacing = 4
            let range = NSMakeRange(0, attributeString.string.count)
            attributeString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paraStyle, range: range)
            attributeString.append(NSMutableAttributedString(string: mess.message,
                                                             attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)]))
            
            bioTextView.attributedText = attributeString
        }
    }
    var profileIMG: UIImageView!
    var bioTextView: UITextView!
    var btReply: UIButton = {
        let bt = UIButton(type: .system)
        bt.setImage(UIImage(named: "reply")?.withRenderingMode(.alwaysOriginal), for: .normal)
        return bt
    }()
    var btReTweet: UIButton = {
        let bt = UIButton(type: .system)
        bt.setImage(UIImage(named: "retweet")?.withRenderingMode(.alwaysOriginal), for: .normal)
        return bt
    }()
    var btLike: UIButton = {
        let bt = UIButton(type: .system)
        bt.setImage(UIImage(named: "like")?.withRenderingMode(.alwaysOriginal), for: .normal)
        return bt
    }()
    var btMess: UIButton = {
        let bt = UIButton(type: .system)
        bt.setImage(UIImage(named: "mess")?.withRenderingMode(.alwaysOriginal), for: .normal)
        return bt
    }()
    override func setupInitial() {
        super.setupInitial()
        setupViews()
    }
    func setupViews(){
        self.backgroundColor = ColorBR.share.ColorBRSetup(type: .View)
        setupProfileIMG()
        setupTextView()
        setupBottomButtons()
        
    }
    
    fileprivate func setupBottomButtons(){
        let viewReplyButton = UIView()

        let reTweetButton = UIView()

        let viewLikeButton = UIView()

        let viewMessButton = UIView()

        let stackViewButtons = UIStackView(arrangedSubviews: [viewReplyButton,
                                                              reTweetButton,
                                                              viewLikeButton,
                                                              viewMessButton])
        stackViewButtons.axis = .horizontal
        stackViewButtons.distribution = .fillEqually
        self.addSubview(stackViewButtons)
        self.addSubview(btReply)
        self.addSubview(btReTweet)
        self.addSubview(btLike)
        self.addSubview(btMess)
        
        stackViewButtons.snp.makeConstraints { (make) in
            make.left.equalTo(bioTextView)
            make.bottom.right.equalToSuperview()
            make.height.equalTo(20)
        }
        btReply.snp.makeConstraints { (make) in
            make.top.left.equalTo(viewReplyButton)
            make.width.height.equalTo(20)
        }
        btReTweet.snp.makeConstraints { (make) in
            make.top.left.equalTo(reTweetButton)
            make.width.height.equalTo(20)
        }
        btLike.snp.makeConstraints { (make) in
            make.top.left.equalTo(viewLikeButton)
            make.width.height.equalTo(20)
        }
        btMess.snp.makeConstraints { (make) in
            make.top.left.equalTo(viewMessButton)
            make.width.height.equalTo(20)
        }
        
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
    
    func setupTextView(){
        bioTextView = UITextView()
        bioTextView.text = "Bộ phận hỗ trợ Vé Máy Bay sẽ tiếp nhận và liên hệ lại trong thời gian sớm nhất, anh vui lòng kiểm tra thông tin trên và phản hồi email này nếu cần thay đổi yêu cầu."
        bioTextView.font = UIFont.systemFont(ofSize: 15)
        bioTextView.backgroundColor = ColorBR.share.ColorBRSetup(type: .View)
        self.addSubview(bioTextView)
        bioTextView.snp.makeConstraints { (make) in
            make.left.equalTo(profileIMG.snp.right)
            make.bottom.top.right.equalToSuperview()
        }
    }
}
