//
//  DetailCarViewController.swift
//  Carros
//
//  Created by Wladmir  on 23/09/20.
//

import UIKit

class DetailCarViewController: UIViewController {

    @IBOutlet weak var detailTableView: UITableView!
        
    var car: Car?
    var carDetails: [String] = ["Cor", "Acabamento", "Assento de couro", "Acabamento assento de couro Assento de couro"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        detailTableView.dataSource = self
        detailTableView.isScrollEnabled = false
        detailTableView.allowsSelection = false
        
        if let car = car {
            print(car)
        }
    }
}

extension DetailCarViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = carDetails[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        return cell
    }
}
