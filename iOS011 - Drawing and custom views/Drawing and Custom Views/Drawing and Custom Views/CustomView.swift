//
//  CustomView.swift
//  Drawing and Custom Views
//
//  Created by Robert Kleniewski on 12/20/18.
//  Copyright © 2018 Robert Kleniewski. All rights reserved.
//

import UIKit

// (J) - @IBDesignable makes it available on the storyboard

@IBDesignable
class CustomView: UIView {
    
    // (C) - force to redraw shapes on change lineWith property
    // (J) - by adding @IBInspectable we will add this var to atribute list in attribute incpector
    
    @IBInspectable
    var lineWidth: Float    = 2.0       { didSet { setNeedsDisplay(); setNeedsLayout() } }
    @IBInspectable
    var cornerRadius: Float = 20.0      { didSet { setNeedsDisplay(); setNeedsLayout() } }
    @IBInspectable
    var emoji: String       = "🎱"      { didSet { setNeedsDisplay(); setNeedsLayout() } }
    @IBInspectable
    var text: String        = "ball"    { didSet { setNeedsDisplay(); setNeedsLayout() } }
    
    
    
    // Only override draw() if you perform custom drawing.
    override func draw(_ rect: CGRect) {
        // (D) - clipping view for rounded corners
        let roudedRect = UIBezierPath(roundedRect: bounds, // take bounds for entire view
            cornerRadius: CGFloat(cornerRadius))
        roudedRect.addClip()
        UIColor.white.setFill()
        roudedRect.fill()
        
        
        // (A) Drawing using CG - first get the context
        /*
        if let context = UIGraphicsGetCurrentContext() {
            // lets draw the circle at the middle of drawing area (a.k.a my custom view) using core graphics
            print("center of the view is at: x=\(bounds.midX) y=\(bounds.midY)")
            print("min coordinates are     : x=\(bounds.minX) y=\(bounds.minY)")
            print("max coordinates are     : x=\(bounds.maxX) y=\(bounds.maxY)")
            context.addArc(center: CGPoint(x: bounds.midX, y: bounds.midY),
                           radius: 80.0,
                           startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
            context.setLineWidth(5.0)
            UIColor.green.setFill()
            UIColor.red.setStroke()
            context.strokePath()  // strokePath "consumes" path - after invocation there is no Path
            context.fillPath()    //   that's why fillPath will not fill our circle :( - to fix we have to create path again!!
            //   conclusion: use Bezier path
        } */
        
        // drawing circle using Bezier path
        let path = UIBezierPath()
        path.addArc(withCenter: CGPoint(x: bounds.midX, y: bounds.midY),
                    radius: 60.0,
                    startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
        path.lineWidth = CGFloat(lineWidth)
        UIColor.green.setFill()
        UIColor.red.setStroke()
        path.stroke() // now the Path still exists as an object, so ..
        path.fill()   // will work just fine
        // (B) !!! dont forget to set "Content Mode" attribute to redraw - to force redraw when bounds are changed eg. by switching to landscape
        
        // drawing triangle
        path.removeAllPoints()
        path.move(to:    CGPoint(x: bounds.midX+50.0,  y: bounds.midY-50.0))
        path.addLine(to: CGPoint(x: bounds.midX+100.0, y: bounds.midY+50.0))
        path.addLine(to: CGPoint(x: bounds.midX,       y: bounds.midY+50.0))
        path.addLine(to: CGPoint(x: bounds.midX+50.0,  y: bounds.midY-50.0))
        path.close()
        path.lineWidth = CGFloat(lineWidth)
        UIColor.red.setStroke()
        UIColor.yellow.setFill()
        path.stroke()
        path.fill()
        
        // drawing box
        path.removeAllPoints()
        path.move(to:    CGPoint(x: bounds.midX-80.0,  y: bounds.midY-20.0))
        path.addLine(to:    CGPoint(x: bounds.midX-80.0+120.0,  y: bounds.midY-20.0))
        path.addLine(to:    CGPoint(x: bounds.midX-80.0+120.0,  y: bounds.midY-20.0+50.0))
        path.addLine(to:    CGPoint(x: bounds.midX-80.0,        y: bounds.midY-20.0+50))
        path.addLine(to:    CGPoint(x: bounds.midX-80.0,        y: bounds.midY-20.0))
        path.close()
        path.lineWidth = CGFloat(lineWidth)
        UIColor.red.setStroke()
        UIColor.blue.setFill()
        path.stroke()
        path.fill()
        
        // (I) draw an image without using subViews
        // this will not show an image in the storyboard --->>> if let myHandImage = UIImage(named: "hand4icon")
        if let myHandImage = UIImage(named: "hand4icon", in: Bundle(for: self.classForCoder), compatibleWith: traitCollection) { // <<--- ... but this will
            myHandImage.draw(at: CGPoint(x: bounds.minX, y: bounds.minY))
        }
    }
    
    
    
    
    // (F) placing own UILabel in the UIView
    private lazy var myEmojiTextLabel: UILabel = initMyEmojiTextLabel()
    
    private func initMyEmojiTextLabel() -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0 // use as many lines as you need
        addSubview(label) // it will be called once during (lazy) initialisation
        
        print("(A) number of subviews: \(subviews.count)")
        return label
    }
    
    
    // !!!! this is the function where we should position subviews
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // lets position it
        myEmojiTextLabel.frame.origin = bounds.origin.offsetBy(dx: 200.0, dy: 45.0) // offsetBy is my extension of CGPoint see: bottom of this file
        // lets set the text
        myEmojiTextLabel.attributedText = _centeredAndScaledText(emoji+"\n"+text, fontSize: 16.0)
        // do size to fit to get rid of margins
        myEmojiTextLabel.frame.size = CGSize.zero // always set to zero before .sizeToFix()
        myEmojiTextLabel.sizeToFit()
        
        print("(B) number of subviews: \(subviews.count)")
    }
    // (F) placing own UILabel in the UIView
    
    // (H) trait called when bounds of font size (trait) has been changed
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        print("traits (features) has been changed.")
        setNeedsDisplay()
        setNeedsLayout()
    }
    
    
    private func _centeredAndScaledText(_ text: String, fontSize: CGFloat) -> NSAttributedString {
        // (E) attributed strings (attributes: alignment and font))
        let font = UIFont.preferredFont(forTextStyle: .body).withSize(fontSize)
        // scale for visual impaired
        let scalledFont = UIFontMetrics(forTextStyle: .body).scaledFont(for: font)
        
        // set paragraph as centered
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        
        // return attributed string with font and alignment attributes set
        return NSAttributedString(string: text,
                                  attributes: [ NSAttributedString.Key.paragraphStyle: paragraphStyle,
                                                NSAttributedString.Key.font: scalledFont ] )
    }
    
}

// (G) extension for CGPoint just to make additional method offsetBy
extension CGPoint {
    func offsetBy(dx: CGFloat, dy: CGFloat) -> CGPoint {
        return CGPoint(x: x+dx, y: y+dy)
        
    }
}
