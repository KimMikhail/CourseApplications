//
//  ViewController.swift
//  GestureRecognizer
//
//  Created by  Mikhail on 02.05.2020.
//  Copyright © 2020  Mikhail. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        swipesObserver()
        tapObserver()
    }
    
    func swipesObserver() {
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
         
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeUp.direction = .up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeDown.direction = .down
        self.view.addGestureRecognizer(swipeDown)
        
    
        
    }
    
    func tapObserver() {
        let tripleTap = UITapGestureRecognizer(target: self, action: #selector(tripleTapAction))
        tripleTap.numberOfTapsRequired = 3
        self.view.addGestureRecognizer(tripleTap)
        
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(doubleTapAction))
        doubleTap.require(toFail: tripleTap)
        doubleTap.numberOfTapsRequired = 2
        self.view.addGestureRecognizer(doubleTap)
        
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(singleTapAction))
        singleTap.require(toFail: doubleTap)
        singleTap.require(toFail: tripleTap)
        self.view.addGestureRecognizer(singleTap)
        
    }
    
    @objc func singleTapAction(){
        label.text = "Tap"
    }
    @objc func tripleTapAction() {
        label.text = "Triple tap"
    }
    @objc func doubleTapAction() {
        label.text = "Double tap"
    }
    
    @objc func handleSwipes(gesture: UISwipeGestureRecognizer) {
        
        switch gesture.direction {
        case .right:
            label.text = "Right"
        case .left:
            label.text = "Left"
        case .down:
            label.text = "Down"
        case .up:
            label.text = "Up"
        default:
            break
        }
    }


}

