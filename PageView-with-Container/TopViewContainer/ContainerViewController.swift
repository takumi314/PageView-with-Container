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
}

class ContainerViewController: UIViewController {

    @IBOutlet weak var titleScroller: TitleScrollView!
    @IBOutlet weak var lineSegment: UISegmentedControl!
    @IBOutlet weak var contentScroller: ContentScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.themed.on(ThemeManager.current)

        let titles = [Station(name: "AAAA"), Station(name: "BBBBB"), Station(name: "CCCC"), Station(name: "DDDDDD")]
        updateHeader(items: titles)

        let bodies = [Content(name: "AAAA"), Content(name: "BBBBB"), Content(name: "CCCC"), Content(name: "DDDDDD")]
        updateBody(items: bodies)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension ContainerViewController: Refreshable { }
