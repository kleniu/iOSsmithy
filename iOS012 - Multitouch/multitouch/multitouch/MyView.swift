//
//  MyView.swift
//  multitouch
//
//  Created by Robert Kleniewski on 12/23/18.
//  Copyright © 2018 Robert Kleniewski. All rights reserved.
//

import UIKit

@IBDesignable
class MyView: UIView {
    
    @IBInspectable
    var myEmoji: String = "🦊" { didSet { setNeedsDisplay(); setNeedsLayout() } }
    @IBInspectable
    var mySize: CGFloat = 120.0 { didSet { setNeedsDisplay(); setNeedsLayout() } }
    
    
    override func draw(_ rect: CGRect) {
        let roudedRect = UIBezierPath(roundedRect: bounds, // take bounds for entire view
            cornerRadius: CGFloat(16.0))
        roudedRect.addClip()
        UIColor.lightGray.setFill()
        roudedRect.fill()
    }
 
    // this is how we add labels as subviews
    private lazy var _myEmojiLabel = _initMyEmojiLabel()
    
    private func _initMyEmojiLabel() -> UILabel {
        let label = UILabel()
        
        label.numberOfLines = 0
        addSubview(label)
        return label
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        _myEmojiLabel.attributedText = _stringToAttrString(myEmoji, fontSize: mySize)
        // lets get rid of emoji margins
        _myEmojiLabel.frame.size = CGSize.zero // The frame rectangle, which describes the view’s location and size in its superview’s coordinate system.
        _myEmojiLabel.sizeToFit()
        
        // let's center
        // The bounds rectangle, which describes the view’s location and size in its own coordinate system.
        _myEmojiLabel.frame.origin = self.bounds.origin.offsetBy(dx: self.bounds.midX - _myEmojiLabel.bounds.midX,
                                                                 dy: self.bounds.midY - _myEmojiLabel.bounds.midY)
        
        // set clip to parent bounds
        self.clipsToBounds = true
    }
    
    private func _stringToAttrString(_ text: String, fontSize: CGFloat) -> NSAttributedString {
        // set and scale font
        let font = UIFont.preferredFont(forTextStyle: .body).withSize(fontSize)
        let scalledFont = UIFontMetrics(forTextStyle: .body).scaledFont(for: font) // scale for visual impaired
        
        // set paragraph as centered
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        
        // return attributed string with font and alignment attributes set
        return NSAttributedString(string: text,
                                  attributes: [ NSAttributedString.Key.paragraphStyle: paragraphStyle,
                                                NSAttributedString.Key.font: scalledFont ] )
    }
    
    
}

extension CGPoint {
    func offsetBy(dx: CGFloat, dy: CGFloat) -> CGPoint {
        return CGPoint(x: x+dx, y: y+dy)
        
    }
}
