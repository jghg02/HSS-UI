//
//  HSSLabelViewController.swift
//  HSS-UI_Example
//
//  Created by Josue German Hernandez Gonzalez on 18-12-23.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import UIKit
import HSS_UI

class HSSLabelViewController: UIViewController {

    @IBOutlet weak var sampleLabel: HSSLabel!
    @IBOutlet weak var titleLabel: HSSLabel!
    @IBOutlet weak var bodyLabel: HSSLabel!
    @IBOutlet weak var linksLabel: HSSLabel!

    private var bodyLink: HSSBodyLink?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "HSS Label"
        sampleLabel.text = "Nomarl Label"


        titleLabel.text = "Title Label"
        let titleConfig = HSSLabelTitleConfig(titleSize: .titleL, color: .blue, bodyLinks: nil)
        titleLabel.setStyleAsTitle(titleConfig: titleConfig)

        bodyLabel.text = "Body Label"
        let bodyConfig = HSSLabelBodyConfig(bodySize: .bodyS, HSSColor: .caution, bodyLinks: nil, bodyBolds: nil)
        bodyLabel.setStyleAsBody(bodyConfig: bodyConfig)



    }


}
