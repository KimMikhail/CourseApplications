//
//  FirstViewController.swift
//  SwiftBook
//
//  Created by  Mikhail on 08.05.2020.
//  Copyright © 2020  Mikhail. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController{
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
        
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ViewController
        destinationVC.colorFromMainVC = view.backgroundColor
    }
    
    
    @IBAction func unwindSegue(for segue: UIStoryboardSegue) {
        let colorVC = segue.source as! ViewController
        colorVC.delegate = self
        colorVC.setColor()
    }

}

extension FirstViewController : ColorDelegate {
    func setColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}
