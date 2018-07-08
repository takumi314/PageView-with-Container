//
//  ThemeManager.swift
//  PageView-with-Container
//
//  Created by NishiokaKohei on 2018/07/08.
//  Copyright © 2018年 Takumi. All rights reserved.
//

import UIKit

struct ThemeManager {
    static let current = ThemeManager()

    var color: UIColor {
        return .blue
    }
    var image: UIImage {
        return UIImage()
    }
}

