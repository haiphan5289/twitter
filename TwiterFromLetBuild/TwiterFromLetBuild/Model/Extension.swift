//
//  Extension.swift
//  TwiterFromLetBuild
//
//  Created by HaiPhan on 8/30/19.
//  Copyright © 2019 HaiPhan. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

extension UIViewController {
    func craeteCollectionView() -> UICollectionView{
        let layout = UICollectionViewFlowLayout()
        let collect = UICollectionView(frame: .zero, collectionViewLayout: layout)
        self.view.addSubview(collect)
        return collect
    }
    

}
//tạo biến để lưu trư cache hình
let imgCache = NSCache<AnyObject, AnyObject>()
extension UIImageView {
    
    
    func loadIMG(text: String){
        //nếu cacche có dữ liệu hình thì chạy hàm này
        if let img = imgCache.object(forKey: text as AnyObject) {
            self.image = img as! UIImage
            return
        }
        let testIMG = text
        let url = URL(string: testIMG)
        do{
            let data = try Data(contentsOf: url!)
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
                //lưu dữ liệu cache theo biến text
                imgCache.setObject(self.image!, forKey: text as AnyObject)
            }
        }catch let err as NSError {
            print("\(err.localizedDescription)")
        }
        
    }
}
