//
//  TableViewController.swift
//  ParsingApp
//
//  Created by  Mikhail on 11.05.2020.
//  Copyright © 2020  Mikhail. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    let urlLink = "https://static-eu.insales.ru/images/products/1/7934/205324030/large_a8708e89f44334f99d1e8efef8c0d778fb775a78.jpg"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
  

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel?.text = "Comics Heroes"
        
        let url = URL(string: urlLink)
       
        let session = URLSession.shared
        
        session.dataTask(with: url!) { (data, _, _) in
            
            
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    cell.imageView?.image = image
                    cell.imageView?.reloadInputViews()
                    
                }
                
            }
        }.resume()
        
        cell.imageView?.layer.cornerRadius = (cell.imageView?.frame.width)! / 2 
        cell.imageView?.clipsToBounds = true
        

        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailVC = segue.destination as! DetailViewController
        detailVC.fetchData()
        
        
    }
    

}
