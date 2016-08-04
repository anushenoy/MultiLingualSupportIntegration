//
//  MultiLanguage.swift
//  MultiLingualSupportIntegration
//
//  Created by Admin on 04/08/16.
//  Copyright © 2016 Anush. All rights reserved.
//

import Foundation


class MultiLanguage {
    static let sharedInstance = MultiLanguage();
    ///  Language selected by Current user, if the user didn't select any language then it is set to English
    var userSelectedLanguage:String?{
        get{
            var language = NSUserDefaults.standardUserDefaults().objectForKey("MyAppLanguage") as? String;
            if  language == nil {
                language = "en";
            }
            return language!
        }
        set{
            NSUserDefaults.standardUserDefaults().setObject(newValue, forKey: "MyAppLanguage");
        }
    }
    /// NSBundle of user selected language path
    var languageBundle:NSBundle?{
        let path:String? = NSBundle.mainBundle().pathForResource(self.userSelectedLanguage!, ofType: "lproj");
        guard (path != nil) else{
            return nil;
        }
        return NSBundle(path:path!);
    }
    
    class func languageString(key:String) -> String?{
        return   self.sharedInstance.languageBundle!.localizedStringForKey(key, value: nil, table: nil)
    }
    
    
    
}