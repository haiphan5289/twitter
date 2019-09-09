//
//  Service.swift
//  TwiterFromLetBuild
//
//  Created by HaiPhan on 9/4/19.
//  Copyright © 2019 HaiPhan. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON
import TRON

class Service {
    static let share = Service()
    
    func fetchHomeFeed(completion: @escaping ([User]?, [Tweet]?, Error?) -> ()){
        //tạo 1 biên request với suceess = Home, failure = JSonerr
        let request: APIRequest<Home,JSonErr> = tron.swiftyJSON.request("")
        request.perform(withSuccess: { (home) in
            //láy giái trị mảng User dể truyền vào mảng của CollectionView
            completion(home.arrayUsers, home.arTws, nil)
        }) { (err) in
            completion(nil, nil, err)
        }
    }
    //import Tron library
    //truyển url vào tron.init
    //khỏi tạo tron
    let tron = TRON.init(baseURL: "http://www.json-generator.com/api/json/get/bVGgQYlqqa?indent=2")
    
    //tạo biến Json để hứng dữ liệu API trả về
    //Biến thành congnf
    class Home: JSONDecodable {
        //tạo biếng mảng user để truyền giái trị
        var arrayUsers: [User] = [User]()
        var arTws: [Tweet] = [Tweet]()
        required init(json: JSON) throws {
//            var arrtemp = [User]()
//            var arTempTweet = [Tweet]()
            //tạo 1 biến để hứng mảng user trong json
            var arUser = json["user"].array
            //biến self.arrayUsers sẽ = arUser
            //Cách tốt nhất
            //Và mỗi phần tử trong arUser sẽ biến đổi thanh biến User
            self.arrayUsers = arUser!.map({
                User(json: $0)
            })
            //biến arTws sẽ = arTweet
            //Và mỗi phần tử trong arTweet sẽ biến đổi thanh biến Tweet
            var arTweet = json["tweet"].array
            self.arTws = arTweet!.map({
                Tweet(json: $0)
            })
            //Cách 2
            //duyệt từng phần tử trong mảng arUser
            //tạo biến để hứng từng phần tủ của User
            //và add tùng phần từ User vào mảng temp của User
            //cho mảng self.arrayUsers = arrtemp
//            for i in arUser! {
//                let name = i["name"].stringValue
//                let username = i["username"].stringValue
//                let bio = i["bio"].stringValue
//                let imgStr = i["profileIMGUrl"].stringValue
//                let user: User = User(name: name, username: username, bioTextView: bio, profileIMG: imgStr)
//                let user: User = User(json: i)
//                arrtemp.append(user)
//            }
            //duyệt từng phần tử trong mảng arTwetter
            //tạo biến để hứng từng phần tủ của Tweet
            //và add tùng phần từ Tweet vào mảng temp của Tweet
            //cho mảng self.arTws = arTempTweet
//            var arTwetter = json["tweet"].array!
//            for i in arTwetter {
//                let arUser = i["user"]
//                let user: User = User(json: arUser)
//                let mess = i["message"].stringValue
//                let tw: Tweet = Tweet(user: user, message: mess)
//                arTempTweet.append(tw)
//                let name = arUser!["name"] as! String
//                let username = arUser!["username"] as! String
//                let bio = arUser!["bio"] as! String
//                let imgStr = arUser!["profileIMGUrl"] as! String
//                let user: User = User(name: name, username: username, bioTextView: bio, profileIMG: imgStr)
//
//            }
//            self.arrayUsers = arrtemp
//            self.arTws = arTempTweet
        }
    }
    
    //biến thất bại
    class JSonErr: JSONDecodable {
        required init(json: JSON) throws {
            print("error")
        }
    }
}
