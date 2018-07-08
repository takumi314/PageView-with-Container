//
//  TopViewController.swift
//  PageView-with-Container
//
//  Created by NishiokaKohei on 2018/07/07.
//  Copyright © 2018年 Takumi. All rights reserved.
//

import UIKit

class TopViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    
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

    @IBAction func onThppedSettings(_ sender: UIBarButtonItem) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: SettingViewController.identifier)
        present(vc, animated: true)
    }

    @IBAction func onTappedRefresh(_ sender: UIBarButtonItem) {
        guard let container = self.childViewControllers.compactMap({ $0 as? ContainerViewController }).first else {
            return
        }
        container.updateContent()
    }
    
}

