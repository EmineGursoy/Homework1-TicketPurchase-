//
//  UIViewExtensions.swift
//  TicketPurchaseApp
//
//  Created by Emine Sinem on 2.04.2023.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return self.cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
