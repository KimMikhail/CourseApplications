//
//  DescriptionViewController.swift
//  Notes List
//
//  Created by  Mikhail on 09.05.2020.
//  Copyright © 2020  Mikhail. All rights reserved.
//

import UIKit

class DescriptionViewController: UIViewController {
    @IBOutlet weak var titleTF: UITextField!
    @IBOutlet weak var descriptionTF: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionTF.layer.cornerRadius = 10
        descriptionTF.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
