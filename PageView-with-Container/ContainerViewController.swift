//
//  ContainerViewController.swift
//  PageView-with-Container
//
//  Created by NishiokaKohei on 2018/07/07.
//  Copyright © 2018年 Takumi. All rights reserved.
//

import UIKit

protocol Refreshable {
    func updateContent()
}

extension Refreshable where Self: ContainerViewController {

    func updateContent() {

        let loadingVC = UIStoryboard(name: "Main", bundle: nil) .instantiateViewController(withIdentifier: LoadingViewController.identifier)

        // fit in the container view size
        self.view.frame = self.view.frame

        // add ChildViewController
        add(loadingVC)
        print("losding ...")

        // Loading
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
        loadingVC.remove()
        print("stop!")
        }

    }
}

class ContainerViewController: UIViewController {

    @IBOutlet private weak var titleScroller: UIScrollView!
    @IBOutlet private weak var lineSegment: UISegmentedControl!
    @IBOutlet private weak var contentScroller: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let loadingVC = UIStoryboard(name: "Main", bundle: nil) .instantiateViewController(withIdentifier: LoadingViewController.identifier)

        // fit in the container view size
        loadingVC.view.frame = self.view.frame

        // add ChildViewController
        add(loadingVC)
        print("losding ...")

        // Loading
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            loadingVC.remove()
            print("stop!")
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension ContainerViewController: Refreshable { }
