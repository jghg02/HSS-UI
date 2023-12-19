//
//  HSSTextAreaDelegate.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 18-12-23.
//

import Foundation
@objc public protocol HSSTextAreaDelegate {
    @objc optional func hssTextAreaShouldBeginEditing(_ textArea: HSSTextArea) -> Bool
    @objc optional func hssTextAreaShouldEndEditing(_ textArea: HSSTextArea) -> Bool
    @objc optional func hssTextAreaDidBeginEditing(_ textArea: HSSTextArea)
    @objc optional func hssTextAreaDidEndEditing(_ textArea: HSSTextArea)
    @objc optional func hssTextArea(_ textArea: HSSTextArea, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    @objc optional func hssTextAreaDidChangeSelection(_ textArea: HSSTextArea, selectedRange range: UITextRange?)
    @objc optional func hssTextAreaDidChange(_ textArea: HSSTextArea)
}
