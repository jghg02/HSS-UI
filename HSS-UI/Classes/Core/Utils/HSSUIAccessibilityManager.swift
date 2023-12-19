//
//  HSSUIAccessibilityManager.swift
//  HSS-UI
//
//  Created by Josue German Hernandez Gonzalez on 14-12-23.
//

import Foundation
import AVFoundation
import UIKit

enum AccessibilityAnnouncement {
    case vibration
    case message(message: String)
    case custom(notification: UIAccessibility.Notification, argument: Any?)
}

protocol HSSUIAccessibleView {
    var accessibilityManager: HSSUIAccessibilityManager? { get set}
}

protocol HSSUIAccessibilityManager {
    init(view: UIView)
    func viewUpdated()
    func accessibilityActivated()
    func makeAnnouncement(type: AccessibilityAnnouncement)
}

extension HSSUIAccessibilityManager {

    func makeAnnouncement(type: AccessibilityAnnouncement) {
        guard UIAccessibility.isVoiceOverRunning else { return }
        switch type {
        case .vibration:
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
        case .message(let message):
            sendMessage(message)
        case .custom(let notification, let argument):
            sendCustomMessage(notification, argument)
        }
    }

    private func sendMessage(_ message: String) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            if #available(iOS 11.0, *) {
//                let notificationArgument = NSAttributedString(string: message,
//                                                              attributes: [NSAttributedString.Key.accessibilitySpeechQueueAnnouncement: true])
//                UIAccessibility.post(notification: .announcement, argument: notificationArgument)
            } else {
//                UIAccessibility.post(notification: .announcement, argument: message)
            }
        }
    }

    private func sendCustomMessage(_ notification: UIAccessibility.Notification, _ argument: Any?) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
//            UIAccessibility.post(notification: notification, argument: argument)
        }
    }
}
