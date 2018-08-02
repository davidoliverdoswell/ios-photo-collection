//
//  ThemeHelper.swift
//  iOSPhotoCollection
//
//  Created by David Oliver Doswell on 8/2/18.
//  Copyright © 2018 David Oliver Doswell. All rights reserved.
//

import Foundation

class ThemeHelper {
    let themePreferenceKey = "themePreferenceKey"
    
    let userDefaults = UserDefaults.standard
    
    func setThemePreferenceToDark() {
        userDefaults.set(themePreferenceKey, forKey: "Dark")
    }
    
    func setThemePreferenceToYourColorHere() {
        userDefaults.set(themePreferenceKey, forKey: "Light")
    }
    
    var themePreference : String? {
        return userDefaults.string(forKey: themePreferenceKey)
    }
    
    init() {
        if themePreference == nil {
            setThemePreferenceToDark()
        } 
    }
}
