//
//  ButtonWithUL.swift
//  TinyToastSample
//
//  Created by keygx on 2017/08/14.
//  Copyright © 2017年 keygx. All rights reserved.
//

import UIKit

class ButtonWithUL: UIButton {
    let blue = UIColor(red: 10.0/255.0, green: 126.0/255.0, blue: 255.0/255.0, alpha: 1.0)
    let white = UIColor.white
    
    override func draw(_ rect: CGRect) {
        clipsToBounds = true
        setTitleColor(blue, for: .normal)
        setTitleColor(white, for: .highlighted)
        setBackgroundImage(createViewToImage(color: white), for: .normal)
        setBackgroundImage(createViewToImage(color: blue), for: .highlighted)
        layer.cornerRadius = 6.0
        layer.borderWidth = 1.0
        layer.borderColor = blue.cgColor
        
        // Underline
        let text: String = (titleLabel?.text)!
        let attributeText = NSMutableAttributedString(string: text)
        attributeText.addAttribute(NSAttributedStringKey.underlineStyle, value: NSUnderlineStyle.styleSingle.rawValue, range: NSMakeRange(0, attributeText.length))
        titleLabel?.attributedText = attributeText
    }
    
    func createViewToImage(color: UIColor, frame: CGRect? = nil) -> UIImage? {
        // View
        var rect = CGRect()
        rect = {
            if let f = frame {
                return f
            } else {
                return CGRect(x: 0, y: 0, width: 100, height: 100)
            }
        }()
        
        let view = UIView(frame: rect)
        view.backgroundColor = color
        // Image
        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(view.frame.size, false, scale)
        guard let context: CGContext = UIGraphicsGetCurrentContext() else {
            return nil
        }
        view.layer.render(in: context)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
}
