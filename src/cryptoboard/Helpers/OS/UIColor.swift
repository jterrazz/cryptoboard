//
//  UIColor.swift
//  cryptoboard
//
//  Created by Jean Baptiste TERRAZZONI on 19/05/2018.
//  Copyright © 2018 terrazzoni. All rights reserved.
//

import Foundation
import UIKit

fileprivate let COLOR_MAX: CGFloat = 255.0

extension UIColor {
    
    enum theme {
        case bg, darkBg, border, textDark, textIntermediate, redClear, redDark, shadow, topBarEl, inputBg, blueClear, elemFront, elemBack, green, red, darkBgHover, textOnDark, grayBg, borderClear, blue
        case custom(hexString: String)

        func withAlpha(_ alpha: Double) -> UIColor {
            return self.value.withAlphaComponent(CGFloat(alpha))
        }
        
        var value: UIColor {
            switch self {
            case .bg:
                return UIColor(hex: "#F9FBFE")
            case .darkBg:
                return UIColor(hex: "#242b46")
            case .grayBg:
                return UIColor(hex: "#f1f0f5")
            case .darkBgHover:
                return UIColor(hex: "#303859")
            case .textOnDark:
                return UIColor(hex: "#636da3")
            case .inputBg:
                return UIColor(hex: "#ebeef4")
            case .border:
                return UIColor(hex: "#ECECEC")
            case .borderClear:
                return UIColor(hex: "#f3f3f3")
            case .textDark:
                return UIColor(hex: "#4A5D69")
            case .textIntermediate:
                return UIColor(hex: "#AAAAAA")
            case .green:
                return UIColor(hex: "#57af7d")
            case .red:
                return UIColor(hex: "#f75078")
            case .blue:
                return UIColor(hex: "#0c7cf9")
            case .redClear:
                return UIColor(hex: "#F46251")
            case .redDark:
                return UIColor(hex: "#FC5462")
            case .blueClear:
                return UIColor(hex: "#21d3fd")
            case .shadow:
                return UIColor(hex: "#464646")
            case .topBarEl:
                return UIColor(hex: "#2C3D55")
            case .elemFront:
                return UIColor(hex: "#3a404f")
            case .elemBack:
                return UIColor(hex: "#cbcbcb")
            case .custom(let hexValue):
                return UIColor(hex: hexValue)
            }
        }
    }
    
    enum gradients {
        case purple, bluepurple, black, darkPurple
        
        var cgColors: [CGColor] {
            return self.value.map { $0.cgColor }
        }
        
        var value: [UIColor] {
            switch self {
            case .purple:
                return [UIColor.init(hex: "#726db2"), UIColor.init(hex: "#8c92c2")]
            case .bluepurple:
                return [UIColor.init(hex: "#21d3fd"), UIColor.init(hex: "#b620ff")]
            case .black:
                return [UIColor.init(hex: "#656d77"), UIColor.init(hex: "#2f363f")]
            case .darkPurple:
                return [
                    UIColor.init(hex: "#0f0c29"),
                    UIColor.init(hex: "#302b63"),
                    UIColor.init(hex: "#24243e")
                ]
            }
        }
    }
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && green >= 0 && blue >= 0 && red <= 255 && green <= 255 && blue <= 255, "Color value should be between 0 and 255")
        
        self.init(red: CGFloat(red) / COLOR_MAX, green: CGFloat(green) / COLOR_MAX, blue: CGFloat(blue) / COLOR_MAX, alpha: 1.0)
    }
    
    // TODO: Go back on that
    convenience init(hex: String) {
        let hexString: String = (hex as NSString).trimmingCharacters(in: .whitespacesAndNewlines)
        let scanner = Scanner(string: hexString as String)
        
        if hexString.hasPrefix("#") {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        
        let red   = CGFloat(r) / COLOR_MAX
        let green = CGFloat(g) / COLOR_MAX
        let blue  = CGFloat(b) / COLOR_MAX
        self.init(red: red, green: green, blue: blue, alpha: 1)
    }
    
    
}
