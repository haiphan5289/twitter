//
//  ColorBackGround.swift
//  TwiterFromLetBuild
//
//  Created by HaiPhan on 8/30/19.
//  Copyright © 2019 HaiPhan. All rights reserved.
//

import Foundation
import UIKit

enum BRColor {
    case View, TextCellUserName, TextButtonFollow , Orange, NavigationBar
}

class ColorBR {
    public static let share = ColorBR()
    
    func ColorBRSetup(type: BRColor) -> UIColor{
        let bg = type
        switch bg {
        case .View:
            return UIColor(red: 239/255, green: 238/255, blue: 243/255, alpha: 1)
        case .TextCellUserName:
            return UIColor(red: 130/255, green: 130/255, blue: 130/255, alpha: 1)
        case .TextButtonFollow:
            return UIColor(red: 61/255, green: 167/255, blue: 244/255, alpha: 1)
        case .NavigationBar:
            return UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        default:
            return UIColor(red: 230/255, green: 30/255, blue: 31/255, alpha: 1)
        }
    }
    

}
