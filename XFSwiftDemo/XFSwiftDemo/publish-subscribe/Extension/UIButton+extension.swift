//
//  UIButton+extension.swift
//  XFSwiftDemo
//
//  Created by Aron.Li on 2024/9/13.
//

import Foundation
import UIKit


extension UIButton {
   @objc public var buryId: String? {
        get {
            return objc_getAssociatedObject(self, &XFBuryKeys.controlKey) as? String
        }
        set {
            objc_setAssociatedObject(self, &XFBuryKeys.controlKey, newValue, .OBJC_ASSOCIATION_COPY)
        }
    }
}
