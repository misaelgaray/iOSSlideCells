//
//  UIColors.swift
//  SlideCells
//
//  Created by Misael Garay on 15/08/17.
//  Copyright © 2017 Misael Garay. All rights reserved.
//

import UIKit

public class UIColors {
    public static let btnSuccess : UIColor = UIColor.GetRGBColor(r: 31, g: 211, b: 67)
    public static let cellViewBorder : CGColor = UIColor.GetRGBColor(r: 242, g: 242, b: 242).cgColor
    public static let navbarColor : UIColor = UIColor.GetRGBColor(r: 46, g: 122, b: 169)
    public static let navbarColorDisable : UIColor = UIColor.GetRGBColor(r: 35, g: 105, b: 180)
    public static let divisorLine : UIColor = UIColor.GetRGBColor(r: 192, g: 201, b: 206)
    public static let textColor : UIColor = UIColor.GetRGBColor(r: 51, g: 51, b: 51)
}

extension UIColor {
    public static func GetRGBColor(r : Float, g : Float, b : Float) -> UIColor{
        return UIColor(colorLiteralRed: r / 255, green: g / 255, blue: b / 255, alpha: 1)
    }
}
