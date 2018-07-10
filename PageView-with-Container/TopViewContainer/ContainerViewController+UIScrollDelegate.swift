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

        let centerX = scrollView.bounds.width / 2.0
        let centerTitleX = scrollView.contentOffset.x + centerX
        let centerTitleY = scrollView.contentOffset.y

        // For ContentScrollView
        if let contentScrollView = scrollView as? ContentScrollView {
            let index = currentPageIndex(at: contentScrollView)
            if index == contentScroller.currentContentIndex {
                return
            }
            contentScroller.currentContentIndex = index
            
            scrollToView(at: index, animated: false)
            return
        }

        // For TitleScrollView and being tapped on UILabel
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

    // MARK: - Private

    // スクロール位置より現在のページ番号を返す
    func currentPageIndex(at scrollView: ContentScrollView) -> Int {

        // width of a page
        let width = scrollView.frame.size.width

        // maximum page index
        let maxPageIndex = CGFloat(scrollView.bodyViews.count - 1)

        // current display position
        let positionX = scrollView.contentOffset.x + width / 2.0
        // 375

        var paging = positionX / width

        paging = (paging >= 0.0) ? paging : 0.0
        paging = (paging <= maxPageIndex) ? paging : maxPageIndex

        return Int(paging)
    }

}
