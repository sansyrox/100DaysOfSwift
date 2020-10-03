//
//  Alert.swift
//  MediaPicker
//
//  Created by Rasyadh Abdul Aziz on 03/10/20.
//  Copyright © 2020 Rasyadh Abdul Aziz. All rights reserved.
//

import UIKit

class Alert: NSObject {
    
    static func displayAlert(title: String, message: String? = nil, sender: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: LocaleString.ok, style: .default, handler: nil))
        sender.present(alert, animated: true, completion: nil)
    }
    
    static func displayConfirmation(
        title: String,
        message: String? = nil,
        confirmTitle: String,
        cancelTitle: String = LocaleString.cancel,
        sender: UIViewController,
        isDestructive: Bool = false,
        onConfirm: (() -> Void)? = nil,
        onCancel: (() -> Void)? = nil
    ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: cancelTitle, style: .cancel, handler: { _ in
            guard onCancel != nil else { return }
            onCancel?()
        }))
        if isDestructive {
            alert.addAction(UIAlertAction(title: confirmTitle, style: .destructive, handler: { _ in
                guard onConfirm != nil else { return }
                onConfirm?()
            }))
        } else {
            alert.addAction(UIAlertAction(title: confirmTitle, style: .default, handler: { _ in
                guard onConfirm != nil else { return }
                onConfirm?()
            }))
        }
        sender.present(alert, animated: true, completion: nil)
    }
}
