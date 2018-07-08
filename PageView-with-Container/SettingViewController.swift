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
        firstCheckedImage.isHidden = false
        secondCheckedImage.isHidden = true
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

//        firstCheckedImage.image = UIImage(contentsOfFile: "chcked_mark.png")
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        switch (indexPath.section, indexPath.row) {
        case (0, 0):
            firstCheckedImage.isHidden = false
            secondCheckedImage.isHidden = true
            break
        case (0, 1):
            firstCheckedImage.isHidden = true
            secondCheckedImage.isHidden = false
            break
        default:
            break
        }
    }

}
