//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Shaun Campbell on 2016-10-10.
//  Copyright © 2016 Shaun Campbell. All rights reserved.
//

import UIKit

class RatingControl: UIView {

    //MARK: Properties
    
    var rating = 0
    var ratingButtons = [UIButton]()
    let spacing = 5
    let starCount = 5
    let buttonSize = Int(frame.size.height)
    
    //MARK: Initialization
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        for i in 0..<starCount {
            let button = UIButton(frame: CGRect(x: i*(44 + spacing), y: 0, width: 44, height: 44))
            button.backgroundColor = UIColor.red
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchDown)
            ratingButtons += [button]
            addSubview(button)
        }
        
    }
    
    override public var intrinsicContentSize: CGSize {
        get {
            return CGSize(width: 240, height: 44)
        }
    }
    
    //MARK: Button Action
    func ratingButtonTapped(button:UIButton) {
        print("Button Tapped")
    }
    
    
   

}

