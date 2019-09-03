//
//  HomeController.swift
//  TwiterFromLetBuild
//
//  Created by HaiPhan on 8/30/19.
//  Copyright © 2019 HaiPhan. All rights reserved.
//

import UIKit
import SnapKit
import TRON
import SwiftyJSON

class HomeController: UIViewController {

    var collect: UICollectionView!
    var arUsersFinal: [User] = [User]()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews(){
        self.setupNavigation()
        setupCollection()
        fecthHomeFeed()
        
    }
    
    //import Tron library
    //truyển url vào tron.init
    //khỏi tạo tron
    let tron = TRON.init(baseURL: "http://www.json-generator.com/api/json/get/cgfvZaotiW?indent=2")
    
    //tạo biến Json để hứng dữ liệu API trả về
    //Biến thành congnf
    class Home: JSONDecodable {
        //tạo biếng mảng user để truyền giái trị
        var arrayUsers: [User] = [User]()
        required init(json: JSON) throws {
            var arrtemp = [User]()
            //tạo 1 biến để hứng mảng user trong json
            var ar = json["user"].array
            for i in ar! {
                let name = i["name"].stringValue
                let username = i["username"].stringValue
                let bio = i["bio"].stringValue
                let imgStr = i["profileIMGUrl"].stringValue
                let user: User = User(name: name, username: username, bioTextView: bio, profileIMG: imgStr)
                arrtemp.append(user)
            }
            self.arrayUsers = arrtemp
        }
    }
    
    //biến thất bại
    class JSonErr: JSONDecodable {
        required init(json: JSON) throws {
            print("error")
        }
    }
    
    fileprivate func fecthHomeFeed(){
        //tạo 1 biên request với suceess = Home, failure = JSonerr
        let request: APIRequest<Home,JSonErr> = tron.swiftyJSON.request("")
        request.perform(withSuccess: { (home) in
            //láy giái trị mảng User dể truyền vào mảng của CollectionView
            self.arUsersFinal = home.arrayUsers
            print(self.arUsersFinal.count)
            DispatchQueue.main.async {
                self.collect.reloadData()
            }
            
        }) { (err) in
            print("err", err.localizedDescription)
        }
    }
    

    
    func setupCollection(){
        collect = self.craeteCollectionView()
        collect.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalToSuperview()
        }
        collect.backgroundColor = ColorBR.share.ColorBRSetup(type: .View)
        collect.delegate = self
        collect.dataSource = self
        collect.register(HomeCell.self, forCellWithReuseIdentifier: "cell")
        collect.register(TwitterCell.self, forCellWithReuseIdentifier: "twittercell")
        collect.register(HomeHeaderCell.self,
                         forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                         withReuseIdentifier: "header")
        collect.register(HomeFooterCell.self,
                         forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                         withReuseIdentifier: "footer")
        
    }
    
    func createArrayDemo() -> [User]{
        var ar: [User] = [User]()
        let a = User(name: "Hải Phan", username: "@Mot",
                        bioTextView: "Bộ phận hỗ trợ Vé Máy Bay sẽ tiếp nhận và liên hệ lại trong thời gian sớm nhất, anh vui lòng kiểm tra thông tin trên và phản hồi email này nếu cần thay đổi yêu cầu",
                        profileIMG: "profile" )
        let b = User(name: "Hải Phan", username: "@Mot",
                        bioTextView: "Bộ phận hỗ trợ Vé Máy Bay sẽ tiếp nhận và liên hệ lại trong thời gian sớm nhất, anh vui lòng kiểm tra thông tin trên và phản hồi email này nếu cần thay đổi yêu cầu",
                        profileIMG: "profile" )
        let c = User(name: "Hải Phan", username: "@Mot",
                        bioTextView: """
            Tạo ra LeadInstrument phù hợp với Equatable. Nó có chứa một thuộc tính là brand và một phương thức tune().
            Overide tune() trong Keyboard là "Keyboard standard tuning."
            Overide tune() trong Guitar là "Guitar standard tuning.
            Bộ phận hỗ trợ Vé Máy Bay sẽ tiếp nhận và liên hệ lại trong thời gian sớm nhất, anh vui lòng kiểm tra thông tin trên và phản hồi email này nếu cần thay đổi yêu cầu
            """,
                        profileIMG: "profile" )
        ar.append(a)
        ar.append(b)
        ar.append(c)
        return ar
        
    }
    func createArrayTweet() -> [Tweet]{
        var ar: [Tweet] = [Tweet]()
        let c = User(name: "Hải Phan", username: "@Mot",
                     bioTextView: "Bộ phận hỗ trợ Vé Máy Bay sẽ tiếp nhận và liên hệ lại trong thời gian sớm nhất, anh vui lòng kiểm tra thông tin trên và phản hồi email này nếu cần thay đổi yêu cầu",
                     profileIMG: "profile" )
        let d = User(name: "Hải Phan", username: "@Mot",
                     bioTextView: "Bộ phận hỗ trợ Vé Máy Bay sẽ tiếp nhận và liên hệ lại trong thời gian sớm nhất, anh vui lòng kiểm tra thông tin trên và phản hồi email này nếu cần thay đổi yêu cầu",
                     profileIMG: "profile" )
        var a = Tweet(user: c,
                      message: "Bộ phận hỗ trợ Vé Máy Bay sẽ tiếp nhận và liên hệ lại trong thời gian sớm nhất, anh vui lòng kiểm tra thông tin trên và phản hồi email này nếu cần thay đổi yêu cầu")
        var b = Tweet(user: d,
                      message: "Bộ phận hỗ trợ Vé Máy Bay sẽ tiếp nhận và liên hệ lại trong thời gian sớm nhất, anh vui lòng kiểm tra thông tin trên và phản hồi email này nếu cần thay đổi yêu cầu")
        
        ar.append(a)
        ar.append(b)
        return ar
    }
    
    func EstimateSizeForText(text: String) -> CGRect{
        let size = CGSize(width: self.view.frame.width - 12 - 50 - 8, height: 1000)
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        let attributeString = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16)]
        
        return NSString(string: text).boundingRect(with: size, options: options, attributes: attributeString, context: nil)
    }


}
extension HomeController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 1{
            return 2
        }
        return self.arUsersFinal.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var arrayTweet = self.createArrayTweet()
//        print(self.arUsersFinal[0])
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeCell
            cell.message = self.arUsersFinal[indexPath.row]
            return cell
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "twittercell", for: indexPath) as! TwitterCell
            cell.mess = arrayTweet[indexPath.row]
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var arrayDemo = self.createArrayDemo()
        let height = EstimateSizeForText(text: arrayDemo[indexPath.row].bioTextView).height
        return CGSize(width: self.view.bounds.width, height: height + 66 )
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                         withReuseIdentifier: "header",
                                                                         for: indexPath) as! HomeHeaderCell
    
            return header
        case UICollectionView.elementKindSectionFooter:
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                         withReuseIdentifier: "footer",
                                                                         for: indexPath) as! HomeFooterCell

            return footer
        default:
            assert(false, "Unexpected element kind")
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 1 {
            return .zero
        }
        return CGSize(width: self.view.bounds.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 1 {
            return .zero
        }
        return CGSize(width: self.view.bounds.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    //Cơ chế autolayout collect cho landcape
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collect.collectionViewLayout.invalidateLayout()
    }
    
}
