//
//  DetailViewController.swift
//  ParsingApp
//
//  Created by  Mikhail on 11.05.2020.
//  Copyright © 2020  Mikhail. All rights reserved.
//

import UIKit

class DetailViewController: UITableViewController {
    private var rowsNumber = 0
    private var heroes : [Heroe] = []
    
    private let jsonURL = "https://gist.githubusercontent.com/mariodev12/a923f2b651a005ca3ca7f851141efcbc/raw/39b06a32e4a58fc1fe63c7478a97edccd21138f1/superheroes.json"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowsNumber
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath)
        cell.textLabel?.text = heroes[indexPath.row].superhero
        cell.detailTextLabel?.text = heroes[indexPath.row].publisher
        cell.imageView?.image = #imageLiteral(resourceName: "heroes")
        
        return cell
    }
    func fetchData() {
        guard let url = URL(string: jsonURL) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            
            do {
                let heroes = try JSONDecoder().decode([Heroe].self, from: data)
                self.rowsNumber = heroes.count
                for heroe in heroes {
                    self.heroes.append(heroe)
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                 
            } catch let error {
                print(error.localizedDescription)
            }
            
            
        }.resume()
       
    }
    

}
