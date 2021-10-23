//
//  ViewController.swift
//  PlistDemo
//
//  Created by Adriana González Martínez on 2/25/19.
//  Copyright © 2019 Adriana González Martínez. All rights reserved.
//

import UIKit

struct Houses: Decodable {
    let house: String
    let member: String
    
    enum CodingKeys: String, CodingKey {
        case house = "House"
        case member = "Member"
    }
}
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var table: UITableView!
    var houses : [Houses] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
       
        //TODO: Get the list of scores coming from your plist
        
        let bundle = Bundle.main
        guard let charactersPlistURL = bundle.url(forResource: "Characters", withExtension: "plist") else { return }
        
        let fileManager = FileManager.default
        guard let characterPListData = fileManager.contents(atPath: charactersPlistURL.path) else { return }
        
        let decoder = PropertyListDecoder()
        guard let houses = try? decoder.decode([Houses].self, from: characterPListData) else {return}
        
        //TODO: Add two entries by code
        
        print(houses)
        self.houses = houses
        table.reloadData()
        //TODO: Display the complete list of scores in the table view
        
    }
    
    // MARK: Table setup
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return houses.count
        
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Game of Thrones"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath)
        let item = houses[indexPath.row]
        
        let house = item.house
        let member = item.member
        
        cell.textLabel?.text = "House: \(house)         Member: \(member)"
        
        //TODO: Make sure to display the score and name
        return cell
        
    }
    
    //MARK: Plist handling
    //TODO: Keep your file clean by adding helper methods to handle the plist.
    
    

    
    
}
