//
//  ContentScrollView.swift
//  PageView-with-Container
//
//  Created by NishiokaKohei on 2018/07/09.
//  Copyright © 2018年 Takumi. All rights reserved.
//

import UIKit

protocol ContentScrollViewDelegate {
    /// inform the delegate that the view at <index> has been selected
    func contentScrollerView(_ contentScrollView: ContentScrollView, didSelectViewAt index: Int)
}

class ContentScrollView: UIScrollView {

    var contentDelegate: ContentScrollViewDelegate?
    var currentContentIndex: Int = 0

    var bodyViews: [BodyView] = []

    func view(at index: Int) -> BodyView {
        return bodyViews[index]
    }

    var didTapBody: Bool = false


    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
