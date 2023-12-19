//
//  HSSLabelAccessibilityManager.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 15-12-23.
//

import Foundation

class HSSLabelAccessibilityManager: HSSUIAccessibilityManager {
    private var view: HSSLabel

    private var a11yText: String

    required init(view: UIView) {
        guard let accessibleView = view as? HSSLabel else {
            fatalError("HSSCheckboxAccessibilityManager should recieve an HSSCheckbox")
        }
        self.view = accessibleView
        self.a11yText = ""
    }

    func viewUpdated() {
//        view.accessibilityTraits = .staticText

        view.accessibilityLabel = self.a11yText
        view.accessibilityHint = view.bodyLinks?.links.count ?? 0 > 0 ? "Doble tap to show" : ""
    }

    func accessibilityActivated() {
        guard let links = view.bodyLinks?.links else { return }
        let topViewController = UIApplication.getTopViewController()
        let linksAlert = UIAlertController(title: "Links available", message: nil, preferredStyle: .actionSheet)

        for (index, link) in links.enumerated() {
            let range = NSRange(location: link.startIndex, length: link.endIndex - link.startIndex)
            let actionTitle = (view.text as NSString?)?.substring(with: range)
            linksAlert.addAction(UIAlertAction(title: actionTitle, style: .default, handler: { [weak view] _ in
                view?.bodyLinks?.listener(index)
            }))
        }

        linksAlert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { [weak linksAlert] _ in
            linksAlert?.dismiss(animated: true, completion: nil)
        }))

        topViewController?.present(linksAlert, animated: true, completion: nil)
    }

    public func clearA11yText() {
        self.a11yText = ""
        self.viewUpdated()
    }

    public func addToA11y(text: String) {
        self.a11yText = self.a11yText + text
        self.viewUpdated()

    }
}
