//
//  ViewController.swift
//  WeeklyFinder
//
//  Created by  Mikhail on 27.04.2020.
//  Copyright © 2020  Mikhail. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var dayTF: UITextField!
    @IBOutlet weak var monthTF: UITextField!
    @IBOutlet weak var yearTF: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    
    
    @IBAction func findDay(_ sender: UIButton) {
    
        let calendar = Calendar.current
        guard let day = dayTF.text, let month = monthTF.text, let year = yearTF.text else { return }
        var dateComponents = DateComponents()
        dateComponents.day = Int(day)
        dateComponents.month = Int(month)
        dateComponents.year = Int(year)
        
        let dateformatter = DateFormatter()
        dateformatter.locale = Locale(identifier: "ru_Ru")
        dateformatter.dateFormat = "EEEE"
        
        guard let date = calendar.date(from: dateComponents)  else { return }
        
        let weekDay = dateformatter.string(from: date)
        
        let capitalizedDay = weekDay.capitalized
        
        resultLabel.text = capitalizedDay

        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
}

