//
//  SettingViewController.swift
//  PageView-with-Container
//
//  Created by NishiokaKohei on 2018/07/08.
//  Copyright © 2018年 Takumi. All rights reserved.
//

import UIKit

class SettingViewController: UITableViewController {


    @IBOutlet weak var firstCheckedImage: UIImageView!
    @IBOutlet weak var secondCheckedImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        firstCheckedImage.isHidden = !ThemeManager.current.settings
        secondCheckedImage.isHidden = ThemeManager.current.settings
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        switch (indexPath.section, indexPath.row) {
        case (0, 0):
            firstCheckedImage.isHidden = false
            secondCheckedImage.isHidden = true
            ThemeManager.current.useNormal()
            break
        case (0, 1):
            firstCheckedImage.isHidden = true
            secondCheckedImage.isHidden = false
            ThemeManager.current.useSpecific()
            break
        case (1, 0):
            dismiss(animated: true) {
                // completion
            }
            break
        default:
            break
        }
    }

}
