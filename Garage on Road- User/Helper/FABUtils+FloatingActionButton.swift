//
//  FABUtils+FloatingActionButton.swift
//  TestSegueRouteDemo
//
//  Created by Anil Kumar on 5/9/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import UIKit
import SnapKit
import LiquidFloatingActionButton


class FabUtils {
//        var rect: CGRect
//        var style: LiquidFloatingActionButtonAnimateStyle
//        
//        lazy var button: LiquidFloatingActionButton = {
//            (frame, style) in
//            let floatingActionButton = CustomDrawingActionButton(frame: frame)
//             floatingActionButton.animateStyle = style
//            return floatingActionButton
//            }()
//        
//        init(rect: CGRect, style: LiquidFloatingActionButtonAnimateStyle) {
//            self.rect = rect
//            self.style = style
//        }
    }



public class CustomCell : LiquidFloatingCell {
    var name: String = "sample"

    init(icon: UIImage, name: String) {
        self.name = name
        super.init(icon: icon)
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func setupView(_ view: UIView) {
        super.setupView(view)
        let label = UILabel()
        label.text = name
        label.textColor = UIColor.white
        label.font = UIFont(name: "Helvetica-Neue", size: 12)
        addSubview(label)
        label.snp.makeConstraints { make in
            make.left.equalTo(self).offset(-80)
            make.width.equalTo(75)
            make.top.height.equalTo(self)
        }
    }
}


public class CustomDrawingActionButton: LiquidFloatingActionButton {
    
    override public func createPlusLayer(_ frame: CGRect) -> CAShapeLayer {
        
        let plusLayer = CAShapeLayer()
        plusLayer.lineCap = kCALineCapRound
        plusLayer.strokeColor = UIColor.white.cgColor
        plusLayer.lineWidth = 3.0
        
        let w = frame.width
        let h = frame.height
        
        let points = [
            (CGPoint(x: w * 0.25, y: h * 0.35), CGPoint(x: w * 0.75, y: h * 0.35)),
            (CGPoint(x: w * 0.25, y: h * 0.5), CGPoint(x: w * 0.75, y: h * 0.5)),
            (CGPoint(x: w * 0.25, y: h * 0.65), CGPoint(x: w * 0.75, y: h * 0.65))
        ]
        
        let path = UIBezierPath()
        for (start, end) in points {
            path.move(to: start)
            path.addLine(to: end)
        }
        
        plusLayer.path = path.cgPath
        return plusLayer
    }
}

