//
//  MainViewController.swift
//  Notes List
//
//  Created by  Mikhail on 09.05.2020.
//  Copyright © 2020  Mikhail. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {
    
    var notes : [Note] = Note.createList() {
        didSet {
            print(#function + "\(notes.count)")
        }
    }
    var titleText : String?
    var descriptionText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        print(#function)
        
    }
    

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return notes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = notes[indexPath.row].title
        cell.detailTextLabel?.text = notes[indexPath.row].description

    
        return cell
    }
    
    @IBAction func editButtonAction(_ sender: UIBarButtonItem) {
        if let indexPath = tableView.indexPathForSelectedRow {
        notes.remove(at: indexPath.row)
        tableView.reloadData()
        }
    }
    
    
    @IBAction func unwind(_ unwindSegue: UIStoryboardSegue) {
        let sourceViewController = unwindSegue.source as! DescriptionViewController
        notes.append(Note(title: sourceViewController.titleTF.text!, description: sourceViewController.descriptionTF.text!))
        tableView.reloadData()
        
        // Use data from the view controller which initiated the unwind segue
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
