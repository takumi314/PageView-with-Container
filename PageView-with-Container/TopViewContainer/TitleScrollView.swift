//
//  TitleScrollView.swift
//  PageView-with-Container
//
//  Created by NishiokaKohei on 2018/07/09.
//  Copyright © 2018年 Takumi. All rights reserved.
//

import UIKit

protocol TitleScrollViewDelegate: class {
    /// inform the delegate that the view at <index> has been selected
    func titleScrollerView(_ titleScrollView: TitleScrollView, didSelectViewAt index: Int)
}

class TitleScrollView: UIScrollView {

    var titleDelegate: TitleScrollViewDelegate?
    var currentTitleIndex: Int = 0

    var titleLabels: [TitleLabel] = []

    func view(at index: Int) -> TitleLabel {
        return titleLabels[index]
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
