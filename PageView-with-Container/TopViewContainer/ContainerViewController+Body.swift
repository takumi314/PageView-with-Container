//
//  ContainerViewController+Body.swift
//  PageView-with-Container
//
//  Created by NishiokaKohei on 2018/07/09.
//  Copyright © 2018年 Takumi. All rights reserved.
//

import UIKit

protocol BodyCompatible {
    var name: String { get }
}

struct Content: BodyCompatible {
    var name: String

}

struct BodyConfiguration {
    static let width: CGFloat            = DeviceSize.screenWidth
    static let height: CGFloat           = 200.0
    static let leftPadding: CGFloat      = 0.0
    static let rightPadding: CGFloat     = 0.0
    static let topPadding: CGFloat       = 0.0
    static let bottomPadding: CGFloat    = 0.0
}

class BodyView: UIView {

    // MARK: - IBOutlts

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var bodyLabel: UILabel!
    
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


extension ContainerViewController {

    public func updateBody<U: BodyCompatible>(items: [U]) {

        guard !items.isEmpty else {
            return
        }

        self.contentScroller.contentDelegate = self
        self.contentScroller.delegate = self

        var valueX: CGFloat = 0.0
        var index: Int = 0

        for item in items {

            valueX += BodyConfiguration.leftPadding

            let frame = CGRect(x: valueX,
                               y: BodyConfiguration.topPadding,
                               width: BodyConfiguration.width,
                               height: BodyConfiguration.height)

            let nib = UINib(nibName: "BodyView", bundle: Bundle.main)
            let body = nib.instantiate(withOwner: self, options: nil).first! as! BodyView

            body.frame = frame
            body.index = index
            body.bodyLabel.text = "\(index) - \(item.name)"
            body.offset = CGPoint(x: valueX, y: BodyConfiguration.topPadding)

            body.centerX = valueX + BodyConfiguration.width / 2.0


            self.contentScroller.bodyViews.append(body)
            self.contentScroller.addSubview(body)

            valueX += BodyConfiguration.width
            valueX += BodyConfiguration.rightPadding
            index += 1

        }


        self.contentScroller.contentSize = CGSize(width: valueX, height: contentScroller.bounds.height)
        contentScrollToView(at: 0, animated: false)
        self.contentScroller.bodyViews.first?.highlightTitle(true)

        let tap = UITapGestureRecognizer(target: self, action: #selector(contentScrollerTapped(_:)))
        self.contentScroller.addGestureRecognizer(tap)
    }

    func contentScrollToView(at index: Int, animated: Bool = true) {
        let bodyView = contentScroller.bodyViews[index]
        let targetCenter = bodyView.center
        let targetOffsetX = targetCenter.x - self.contentScroller.bounds.width / 2

        self.contentScroller.setContentOffset(CGPoint(x: targetOffsetX, y: 0), animated: animated)
    }


    // MARK: - Private methods

    @objc private func contentScrollerTapped(_ gesture: UITapGestureRecognizer) {
        let location = gesture.location(in: self.contentScroller)
        guard let index = contentScroller.bodyViews.index(where: { $0.frame.contains(location) })
            else { return }
        contentScroller.contentDelegate?.contentScrollerView(self.contentScroller, didSelectViewAt: index)

        contentScroller.didTapBody = true
        scrollToView(at: index)

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.contentScroller.didTapBody = false
        }

    }

}

extension ContainerViewController: ContentScrollViewDelegate {

    func contentScrollerView(_ contentScrollView: ContentScrollView, didSelectViewAt index: Int) {

    }

}
