//
//  ThemeSelectionViewController.swift
//  iOSPhotoCollection
//
//  Created by David Oliver Doswell on 8/2/18.
//  Copyright © 2018 David Oliver Doswell. All rights reserved.
//

import UIKit

class ThemeSelectionViewController: UIViewController {

    var themeHelper: ThemeHelper?
    
    @IBOutlet weak var selectThemeLabel: UILabel!
    
    
    @IBAction func selectDarkTheme(_ sender: Any) {
        themeHelper?.setThemePreferenceToDark()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectLightTheme(_ sender: Any) {
        themeHelper?.setThemePreferenceToYourColorHere()
        dismiss(animated: true, completion: nil)
    }
}
