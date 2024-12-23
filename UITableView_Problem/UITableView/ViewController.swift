//
//  ViewController.swift
//  UITableView
//
//  Created by Andy Do on 12/19/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
   
    @IBOutlet weak var tableView: UITableView!
    
    // The Matrix that is going to be displayed
    private var matrix: [[String]] = [
        ["1", "2", "3"],
        ["X", "Y", "Z"],
        ["2", "3", "4"],
        ["A", "B", "C"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Connect delegate and data source
        tableView.delegate = self
        tableView.dataSource = self
        
        // Setup default cell type
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    // Returns number of rows
    func numberOfSections(in tableView: UITableView) -> Int {
        return matrix.count
    }
    
    // Returns number of columns
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matrix[section].count
    }
    
    // Configures each cell with matrix data
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let value = matrix[indexPath.section][indexPath.row]
        
        // Configure cell to show multiple lines
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.lineBreakMode = .byWordWrapping
        
        // Display position and value in cell
        cell.textLabel?.text = "Cell: \(indexPath.section) \(indexPath.row)\n\(value)"
        
        return cell
    }
}

