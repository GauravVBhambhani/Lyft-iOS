//
//  RideHistoryViewController.swift
//  RideSharer
//
//

import UIKit

class RideHistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var historyTbl: UITableView!
    
    let rideHistory = [("Driver: Joe, 12/29/2021", "$26.50"),
                       ("Driver: Sandra, 01/03/2022", "$13.10"),
                       ("Driver: Hank, 01/11/2022", "$16.20"),
                       ("Driver: Michelle, 01/19/2022", "$8.50")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        historyTbl.delegate = self
        historyTbl.dataSource = self
        
        historyTbl.register(UITableViewCell.self, forCellReuseIdentifier: "historyCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.rideHistory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "historyCell", for: indexPath)
        
        cell.textLabel?.text = self.rideHistory[indexPath.row].0
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "Price", message: self.rideHistory[indexPath.row].1, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
}
