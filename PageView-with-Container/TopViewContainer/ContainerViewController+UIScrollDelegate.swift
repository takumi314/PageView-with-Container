//
//  ContainerViewController+UIScrollDelegate.swift
//  PageView-with-Container
//
//  Created by NishiokaKohei on 2018/07/09.
//  Copyright © 2018年 Takumi. All rights reserved.
//

import UIKit

extension ContainerViewController: UIScrollViewDelegate {

    // MARK: - UIScrollViewDelegate

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset)
        let centerX = scrollView.bounds.width / 2.0
        let centerTitleX = scrollView.contentOffset.x + centerX
        let centerTitleY = scrollView.contentOffset.y

        if !self.titleScroller.didTapTitle {
            guard let titleScroller = scrollView as? TitleScrollView else {
                return
            }

            let location = CGPoint(x: centerTitleX + 5.0, y: centerTitleY + 10.0)
            guard let index = titleScroller.titleLabels.index(where: { $0.frame.contains(location) }) else {
                return
            }

            titleScroller.titleDelegate?.titleScrollerView(self.titleScroller, didSelectViewAt: index)
        }

    }

}
