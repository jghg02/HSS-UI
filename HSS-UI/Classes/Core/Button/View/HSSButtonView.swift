//
//  HSSButtonView.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 14-12-23.
//

import Foundation

internal protocol HSSButtonView: UIControl {

    func enable()
    func disable()

    func touchUp()
    func touchDown()

    func setText(_ text: String)

    func startSpinnerAnimation()
    func stopSpinnerAnimation()

}
