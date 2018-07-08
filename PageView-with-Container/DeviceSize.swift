//
//  DeviceSize.swift
//  PageView-with-Container
//
//  Created by NishiokaKohei on 2018/07/07.
//  Copyright © 2018年 Takumi. All rights reserved.
//

import UIKit

struct DeviceSize {

    //デバイスのCGRectを取得
    static var bounds: CGRect {
        return UIScreen.main.bounds
    }

    //デバイスの画面の横サイズを取得
    static var screenWidth: Int {
        return Int(UIScreen.main.bounds.size.width)
    }

    //デバイスの画面の縦サイズを取得
    static var screenHeight: Int {
        return Int(UIScreen.main.bounds.size.height)
    }

}
