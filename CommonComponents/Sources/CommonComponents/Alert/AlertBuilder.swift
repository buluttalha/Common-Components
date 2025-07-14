//
//  AlertBuilder.swift
//  
//
//  Created by Talip on 11.04.2022.
//

import UIKit

public final class AlertBuilder {
    private var preferredStyle: UIAlertController.Style = .alert
    private var title: String?
    private var message: String?
    private var actions: [UIAlertAction] = []

    public init() {}

    public func preferredStyle(_ style: UIAlertController.Style) -> AlertBuilder {
        self.preferredStyle = style
        return self
    }

    public func withTitle(_ title: String?) -> AlertBuilder {
        self.title = title
        return self
    }

    public func withMessage(_ message: String?) -> AlertBuilder {
        self.message = message
        return self
    }

    public func addDefaultAction(with title: String,
                                 handler: ((UIAlertAction) -> Void)? = nil) -> AlertBuilder {
        return addAction(with: title, style: .default, handler: handler)
    }

    public func addDestructiveAction(with title: String,
                                     handler: ((UIAlertAction) -> Void)? = nil) -> AlertBuilder {
        return addAction(with: title, style: .destructive, handler: handler)
    }

    public func addCancelAction(with title: String,
                                handler: ((UIAlertAction) -> Void)? = nil) -> AlertBuilder {
        return addAction(with: title, style: .cancel, handler: handler)
    }

    func addAction(with title: String,
                   style: UIAlertAction.Style,
                   handler: ((UIAlertAction) -> Void)?) -> AlertBuilder {
        let action = UIAlertAction(title: title, style: style, handler: handler)
        actions.append(action)
        return self
    }

    public func build() -> UIAlertController {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: preferredStyle)
        actions.forEach { alertController.addAction($0)}
        actions.removeAll()
        return alertController
    }
}
