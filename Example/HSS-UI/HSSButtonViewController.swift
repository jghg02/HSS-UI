//
//  HSSButtonViewController.swift
//  HSS-UI_Example
//
//  Created by Josue German Hernandez Gonzalez on 15-12-23.
//  Copyright © 2023 CocoaPods. All rights reserved.
//

import UIKit
import HSS_UI

class HSSButtonViewController: UIViewController {

    @IBOutlet weak var defaultButton: HSSButton!
    @IBOutlet weak var disableButton: HSSButton!
    @IBOutlet weak var largeQuiet: HSSButton!
    @IBOutlet weak var largeLoud: HSSButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "HSS Buttom Component"
        setupButtons()
    }

    func setupButtons() {
        defaultButton.text = "This is the title"
        disableButton.isEnabled = false
        disableButton.text = "Disable button"
    }

}
