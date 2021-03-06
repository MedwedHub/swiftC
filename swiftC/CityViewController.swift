//
//  CityViewController.swift
//  swiftC
//
//  Created by xc106d3 on 2018-03-20.
//  Copyright © 2018 xc106d3. All rights reserved.
//

import UIKit

class CityViewController: UIViewController {

    @IBOutlet weak var cityLabel: UILabel!
    
     internal var city: City!

    @IBAction func press(_ sender: Any) {
       
        Data.shared.changeFavourite(for: city)
        updateUI()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cityLabel.text = city.name
        
    }
    override func viewWillAppear(_ animated: Bool) {
        updateUI()
    }
  
    
    
    private func updateUI() {
        let favorite = Data.shared.isFavourite(city: city)
        let image: UIImage
        
        if favorite {
            image = UIImage(named: "Star_on")!
        } else {
            image = UIImage(named: "Star_off")!
        }
        navigationItem.rightBarButtonItem?.image = image
    }
}

