//
//  NavigationController.swift
//  Morphu
//
//  Created by Dylan Wight on 4/12/16.
//  Copyright © 2016 Dylan Wight. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController, UINavigationBarDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let font = UIFont(name: "SF Cartoonist Hand", size: 24)!

        navigationBar.barTintColor = morhpuColor
        navigationBar.titleTextAttributes = [NSFontAttributeName : font, NSForegroundColorAttributeName: UIColor.whiteColor()]
        navigationBar.translucent = false
        
        self.navigationBar.tintColor = UIColor.whiteColor()
        setStatusBarBackgroundColor(morhpuColor)
    }

    func setStatusBarBackgroundColor(color: UIColor) {
        guard  let statusBar = UIApplication.sharedApplication().valueForKey("statusBarWindow")?.valueForKey("statusBar") as? UIView else {
            return
        }
        statusBar.backgroundColor = color
    }
}