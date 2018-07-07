//
//  LoadingViewController.swift
//  PageView-with-Container
//
//  Created by NishiokaKohei on 2018/07/07.
//  Copyright © 2018年 Takumi. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .clear

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        // UIVisualEffectViewを生成する
        let visualEffectView = UIVisualEffectView(frame: self.view.frame)

        // エフェクトの種類を設定
        visualEffectView.effect = UIBlurEffect(style: .light)

        // エフェクトを反映
        self.view.insertSubview(visualEffectView, at: 0)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
