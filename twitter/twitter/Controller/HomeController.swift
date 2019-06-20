//
//  HomeController.swift
//  twitter
//
//  Created by HaiPhan on 6/20/19.
//  Copyright © 2019 HaiPhan. All rights reserved.
//

import UIKit



class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    let CellWithReuseIdentifier = "cell"
    // tạo cell header
    let headerID = "headerID"
    //tạo cell footer
    let footerID = "footerID"
    //tạo mảng
    var array_data: [User] = [User]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        collectionView.register(wordcell.self, forCellWithReuseIdentifier: CellWithReuseIdentifier)
        //đăng kí cell header trên uicollect cell
        collectionView.register(header_cell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerID)
        //đăng kí cell footer trên uicollect cell
        collectionView.register(footer_cell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footerID)
        
        //khởi tạo mảng
        let user1 = User(name: "Phan thanh hai", user_name: "@gmail.com", biotext: "We all love Autolayout, don't we? I had a less than ideal experience with it when I started. However, after continuous practice and ", profile_image: UIImageView.init(image: UIImage(named: "plus")))
        let user2 = User(name: "Phan thanh hai", user_name: "@gmail.com", biotext: "We all ", profile_image: UIImageView.init(image: UIImage(named: "plus")))
        self.array_data.append(user1)
        self.array_data.append(user2)
        
        self.setup_navigation_item()
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.array_data.count
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellWithReuseIdentifier, for: indexPath) as! wordcell
        cell.user_cell = self.array_data[indexPath.row]
        cell.layer.borderColor = UIColor(red: 61/255, green: 167/255, blue: 244/255, alpha: 1).cgColor
        cell.layer.borderWidth = 1
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let user = self.array_data[indexPath.row]
        var height = estimate_lenght_for_text(text: user.biotext).height + 20 + 62
        return CGSize(width: self.view.frame.width, height: height)
    }
    
    //estiamte width & height của cell
    func estimate_lenght_for_text(text: String) -> CGRect {
        let size = CGSize(width: self.view.frame.width - 66 , height: 1000)
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        return NSString(string: text).boundingRect(with: size, options: options, attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16)], context: nil)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    //khơi tạo cell header & footer
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerID, for: indexPath) as! header_cell
            header.backgroundColor = UIColor.white
            return header
        }
        else {
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerID, for: indexPath) as! footer_cell
            footer.backgroundColor = UIColor.white
            return footer
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 80)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 100)
    }
    
    
}

