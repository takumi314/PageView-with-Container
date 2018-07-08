//
//  ThemeManager.swift
//  PageView-with-Container
//
//  Created by NishiokaKohei on 2018/07/08.
//  Copyright © 2018年 Takumi. All rights reserved.
//

import UIKit

class ThemeManager {
    static var current = ThemeManager()

    var color: UIColor {
        return ThemeManager.current.isNormal ? .blue : .red
    }
    var image: UIImage {
        return UIImage()
    }

    var settings: Bool {
        get {
            return ThemeManager.current.isNormal
        }
    }

    private var isNormal = true

    func useNormal() {
        ThemeManager.current.isNormal = true
    }

    func useSpecific() {
        ThemeManager.current.isNormal = false
    }

}

