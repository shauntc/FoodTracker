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
    
    var rating = 0 {
        didSet{
            setNeedsLayout()
        }
    }
    var ratingButtons = [UIButton]()
    let spacing = 5
    let starCount = 5
    
    let filledStarImage = UIImage(named: "filledStar")
    let emptyStarImage = UIImage(named: "emptyStar")
   
    
    //MARK: Initialization
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        for _ in 0..<starCount {
            let button = UIButton()
            button.setImage(emptyStarImage, for: .normal)
            button.setImage(filledStarImage, for: .selected)
            button.setImage(filledStarImage, for: [.highlighted, .selected])
            button.adjustsImageWhenHighlighted = false
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchDown)
            ratingButtons += [button]
            addSubview(button)
        }
        
    }
    
    override func layoutSubviews() {
        let buttonSize = Int(frame.size.height)
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        
        for (index, button) in ratingButtons.enumerated() {
            buttonFrame.origin.x = CGFloat(index * (buttonSize + 5))
            button.frame = buttonFrame
        }
        
        updateButtonSelectionStates()
    }
    
    override public var intrinsicContentSize: CGSize {
        get {
            let buttonSize = Int(frame.size.height)
            let width = (buttonSize * starCount) + (spacing * (starCount - 1))
            
            return CGSize(width: width, height: buttonSize)
        }
    }
    
    //MARK: Button Action
    func ratingButtonTapped(button:UIButton) {
        if let i = ratingButtons.index(of: button){
            rating = i + 1
        }
        
        updateButtonSelectionStates()
    }
    
    func updateButtonSelectionStates(){
        for(index, button) in ratingButtons.enumerated() {
            button.isSelected = index < rating
        }
    }
    
    
   

}

