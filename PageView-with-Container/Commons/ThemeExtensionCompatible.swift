//
//  ThemeExtensionCompatible.swift
//  PageView-with-Container
//
//  Created by NishiokaKohei on 2018/07/08.
//  Copyright © 2018年 Takumi. All rights reserved.
//

import UIKit

protocol ThemeExtensionCompatible {
    associatedtype U
    var themed: TargetedExtension<U> { get }
}

extension ThemeExtensionCompatible {
    var themed: TargetedExtension<Self> {
        return TargetedExtension(self)
    }
}

extension UIView: ThemeExtensionCompatible { }
