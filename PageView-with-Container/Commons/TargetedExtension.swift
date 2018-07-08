//
//  TargetedExtension.swift
//  PageView-with-Container
//
//  Created by NishiokaKohei on 2018/07/08.
//  Copyright © 2018年 Takumi. All rights reserved.
//

import UIKit

class TargetedExtension<T> {
    private let base: T
    init(_ base: T) {
        self.base = base
    }
}

// MARK: - UIView

extension TargetedExtension where T == UIView {
    func on(_ configure: ThemeManager) {
        base.backgroundColor = configure.color
    }
}

// MARK: - UIImageView

extension TargetedExtension where T == UIImageView {
    func on(_ configure: ThemeManager) {
        base.backgroundColor = configure.color
        base.image          = configure.image
    }
}

// MARK: - UIButton

extension TargetedExtension where T == UIButton {
    func on(_ configure: ThemeManager) {
        base.backgroundColor = configure.color
        base.setBackgroundImage(configure.image, for: .normal)
    }
}

// MARK: - UINavigationBar

extension TargetedExtension where T == UINavigationBar {
    func on(_ configure: ThemeManager) {
        base.backgroundColor = configure.color
        base.barStyle = .default
        base.setBackgroundImage(configure.image, for: .top, barMetrics: .compact)
    }
}
