//
//  ContainerViewController+Header.swift
//  PageView-with-Container
//
//  Created by NishiokaKohei on 2018/07/08.
//  Copyright © 2018年 Takumi. All rights reserved.
//

import UIKit

protocol HeaderCompatible {
    var name: String { get }
}

struct Station: HeaderCompatible {
    var name: String 

}

struct HeaderConfiguration {
    static let width: CGFloat            = 80.0
    static let height: CGFloat           = 50.0
    static let leftPadding: CGFloat      = 10.0
    static let rightPadding: CGFloat     = 10.0
    static let topPadding: CGFloat       = 5.0
    static let bottomPadding: CGFloat    = 0.0
}

class TitleLabel: UILabel {
    var index: Int = 0
    var offset: CGPoint = .zero
    var centerX: CGFloat = 0.0

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    func highlightTitle(_ didHighlightView: Bool) {
        if didHighlightView == true {
            backgroundColor = .white
        } else {
            backgroundColor = .clear
        }
    }
}

extension ContainerViewController: TitleScrollViewDelegate {

    public func updateHeaer<T: HeaderCompatible>(items: [T]) {

        self.titleScroller.titleDelegate = self

        let titles = items.map({ $0.name })
        let titleWidth = HeaderConfiguration.rightPadding + HeaderConfiguration.width + HeaderConfiguration.rightPadding

        var valueX: CGFloat = 0.0
        var index: Int = 0
        valueX += DeviceSize.screenWidth - titleWidth / 2.0

        for title in titles {

            valueX += HeaderConfiguration.leftPadding

            let frame = CGRect(x: valueX, y: HeaderConfiguration.topPadding,
                               width: HeaderConfiguration.width, height: HeaderConfiguration.height)
            let label = TitleLabel(frame: frame)
            label.text = title
            label.textAlignment = .center
            label.offset = CGPoint(x: valueX, y: HeaderConfiguration.topPadding)
            label.centerX = valueX + HeaderConfiguration.width / 2.0
            label.index = index

            self.titleScroller.titleLabels.append(label)

            self.titleScroller.addSubview(label)

            valueX += HeaderConfiguration.width
            valueX += HeaderConfiguration.rightPadding
            index += 1

        }

        self.titleScroller.contentSize = CGSize(width: valueX,
                                                height: self.titleScroller.bounds.height)
        scrollToView(at: 0, animated: false)
        self.titleScroller.titleLabels.first?.highlightTitle(true)

        let tap = UITapGestureRecognizer(target: self, action: #selector(scrollerTapped(_:)))
        self.titleScroller.addGestureRecognizer(tap)
    }

    // MARK: - Private methods

    @objc private func scrollerTapped(_ gesture: UITapGestureRecognizer) {
        let location = gesture.location(in: self.titleScroller)
        guard let index = titleScroller.titleLabels.index(where: { $0.frame.contains(location) })
            else { return }
        titleScroller.titleDelegate?.titleScrollerView(self.titleScroller, didSelectViewAt: index)
        scrollToView(at: index)
    }

    private func scrollToView(at index: Int, animated: Bool = true) {
        let contentView = titleScroller.titleLabels[index]
        let targetCenter = contentView.center
        let targetOffsetX = targetCenter.x - self.titleScroller.bounds.width / 2

        self.titleScroller.setContentOffset(CGPoint(x: targetOffsetX, y: 0), animated: animated)
    }

    private func showDataForTitle(at index: Int) {

        if -1 < index && index < titleScroller.titleLabels.count {

            // do something

        } else {

            // do something

        }

    }


    // MARK: - TitleScrollViewDelegate

    func titleScrollerView(_ titleScrollView: TitleScrollView, didSelectViewAt index: Int) {

        let previousAlbumView = titleScrollView.view(at: titleScrollView.currentTitleIndex)

        UIView.animate(withDuration: 0.8) {
            previousAlbumView.highlightTitle(false)
            self.titleScroller.currentTitleIndex = index

            let albumView = titleScrollView.view(at: titleScrollView.currentTitleIndex)
            albumView.highlightTitle(true)
        }

    }

}
