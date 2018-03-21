//
//  ViewController.swift
//  swiftC
//
//  Created by xc106d3 on 2018-03-20.
//  Copyright © 2018 xc106d3. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        Data.shared.appendCity()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Data.shared.cities.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 45.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath) as! CustomTableViewCell
        let city = Data.shared.cities[indexPath.row]
        let favourite = Data.shared.isFavourite(city: city)
        
        cell.cityLabel.text = "\(city.name)" + " with \(city.id)"
        cell.favCityImage.image = UIImage(named: "Star_on")!
        
        if !favourite {
            cell.favCityImage.isHidden = true            
        } else {
            cell.favCityImage.isHidden = false
        }
        
        return cell
    }
    override func viewWillAppear(_ animated: Bool) {
        
        tableView.reloadData()
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let cityVC: CityViewController? = segue.destination as? CityViewController
        let indexPath = tableView.indexPathForSelectedRow
        let city = Data.shared.cities[indexPath!.row]
        
        cityVC?.city = city
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

