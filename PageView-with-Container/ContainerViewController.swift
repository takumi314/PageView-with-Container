//
//  ContainerViewController.swift
//  PageView-with-Container
//
//  Created by NishiokaKohei on 2018/07/07.
//  Copyright © 2018年 Takumi. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {

    @IBOutlet private weak var titleScroller: UIScrollView!
    @IBOutlet private weak var lineSegment: UISegmentedControl!
    @IBOutlet private weak var contentScroller: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()

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
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let _ = segue.destination
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
