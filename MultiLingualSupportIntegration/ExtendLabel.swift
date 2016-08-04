//
//  ExtendLabel.swift
//  MultiLingualSupportIntegration
//
//  Created by Admin on 04/08/16.
//  Copyright © 2016 Anush. All rights reserved.
//

import UIKit

@IBDesignable
extension UILabel
{
    //! Add Key for MultiLanguage text
    @IBInspectable var multiLanguageKey:String?{
        get{
            return ""; 
        }
        set{
            guard (MultiLanguage.sharedInstance.languageBundle != nil) else{
                return ;
            }
            self.text = MultiLanguage.sharedInstance.languageBundle!.localizedStringForKey(newValue!, value: nil, table: nil);
        }
        
    }
}

@IBDesignable
extension UIButton
{
    //! Add Key for MultiLanguage text
    @IBInspectable var multiLanguageKey:String?{
        get{
            return "";
        }
        set{
            guard (MultiLanguage.sharedInstance.languageBundle != nil) else{
                return ;
            }
            self.setTitle(MultiLanguage.sharedInstance.languageBundle!.localizedStringForKey(newValue!, value: nil, table: nil), forState: .Normal)
//            self.titleLabel?.text = MultiLanguage.sharedInstance.languageBundle!.localizedStringForKey(newValue!, value: nil, table: nil);
        }
        
    }
}
@IBDesignable
extension UITextField
{
    //! Add Key for MultiLanguage text
    @IBInspectable var multiLanguageKey:String?{
        get{
            return "";
        }
        set{
            guard (MultiLanguage.sharedInstance.languageBundle != nil) else{
                return ;
            }
            self.placeholder = MultiLanguage.sharedInstance.languageBundle!.localizedStringForKey(newValue!, value: nil, table: nil);
        }
        
    }
}

extension NSNumber
{
    func getLocalizedString() -> String
    {
        let numberFormatter = NSNumberFormatter();
        numberFormatter.locale = NSLocale(localeIdentifier: MultiLanguage.sharedInstance.userSelectedLanguage!);
        numberFormatter.numberStyle = .DecimalStyle;
        numberFormatter.maximumFractionDigits = 2;
        return numberFormatter.stringFromNumber(self) != nil ? numberFormatter.stringFromNumber(self)! : ""
        
    }
}
extension Float
{
    func getLocalizedString() -> String {
        return NSNumber(float: self).getLocalizedString();
    }
}

extension Double
{
    func getLocalizedString() -> String {
        return NSNumber(double: self).getLocalizedString();
    }
}
