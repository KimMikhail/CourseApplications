//
//  ViewController.swift
//  SwiftBook
//
//  Created by  Mikhail on 05.05.2020.
//  Copyright © 2020  Mikhail. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var redTF: UITextField!
    @IBOutlet weak var greenTF: UITextField!
    @IBOutlet weak var blueTF: UITextField!
    @IBOutlet weak var navigationBar: UINavigationItem!
    
    var delegate : ColorDelegate?
    var colorFromMainVC : UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        colorView.backgroundColor = colorFromMainVC
        colorView.layer.cornerRadius = 10
        redTF.layer.cornerRadius = 5
        greenTF.layer.cornerRadius = 5
        blueTF.layer.cornerRadius = 5
        redLabel.text = "Red"
        greenLabel.text = "Green"
        blueLabel.text = "Blue"
        
        let ciColor = CIColor(color: colorFromMainVC!)
        redSlider.value = Float(ciColor.red)
        greenSlider.value = Float(ciColor.green)
        blueSlider.value = Float(ciColor.blue)
        redTF.text = "\(redSlider.value)"
        greenTF.text = "\(greenSlider.value)"
        blueTF.text = "\(blueSlider.value)"
        redTF.delegate = self
        greenTF.delegate = self
        blueTF.delegate = self
        
       

        

    }
    
    @IBAction func redSliderAction(_ sender: UISlider) {
        colorView.backgroundColor = UIColor.init(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
        redTF.text = "\(redSlider.value)"
        greenTF.text = "\(greenSlider.value)"
        blueTF.text = "\(blueSlider.value)"
    }
    @IBAction func greenSliderAction(_ sender: UISlider) {
        colorView.backgroundColor = UIColor.init(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
        redTF.text = "\(redSlider.value)"
        greenTF.text = "\(greenSlider.value)"
        blueTF.text = "\(blueSlider.value)"
    }
    @IBAction func blueSliderAction(_ sender: UISlider) {
        colorView.backgroundColor = UIColor.init(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
        redTF.text = "\(redSlider.value)"
        greenTF.text = "\(greenSlider.value)"
        blueTF.text = "\(blueSlider.value)"
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        redSlider.value = Float(redTF.text!) ?? 0.5
        greenSlider.value = Float(greenTF.text!) ?? 0.5
        blueSlider.value = Float(blueTF.text!) ?? 0.5
        colorView.backgroundColor = UIColor.init(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        redSlider.value = Float(redTF.text!) ?? 0.5
        greenSlider.value = Float(greenTF.text!) ?? 0.5
        blueSlider.value = Float(blueTF.text!) ?? 0.5
        colorView.backgroundColor = UIColor.init(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
        view.endEditing(true)
        return true
    }
    
    func setColor(){
        let color = UIColor.init(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
        delegate?.setColor(color)
    }
    
}



