//
//  UIHelper.swift
//  SightWordsTwoProgrammaticUI
//
//  Created by Stephanie Ballard on 2/23/21.
//

import UIKit

class UIHelper {

    static func configureShadow(view: UIView, color: CGColor) {
        view.layer.shadowColor = color
        view.layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        view.layer.shadowRadius = 5.0
        view.layer.shadowOpacity = 1.0
    }
}
