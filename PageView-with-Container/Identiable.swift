//
//  Identiable.swift
//  PageView-with-Container
//
//  Created by NishiokaKohei on 2018/07/07.
//  Copyright © 2018年 Takumi. All rights reserved.
//

import UIKit

protocol Identiable {
    static var identifier: String { get }
}

extension Identiable where Self: UIViewController {

    static var identifier: String {
        return "\(self)"
    }

}

extension UIViewController: Identiable { }
