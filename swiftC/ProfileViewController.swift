//
//  ProfileViewController.swift
//  swiftC
//
//  Created by xc106d3 on 2018-03-23.
//  Copyright © 2018 xc106d3. All rights reserved.
//

import UIKit


class ProfileViewController: UIViewController {

    @IBOutlet weak var birthField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    private var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
        configureDate()
        birthField.inputView = datePicker
    }
    func configureDate() {
        datePicker = UIDatePicker(frame: CGRect.zero)
        datePicker.datePickerMode = .date
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension ProfileViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true)
        return true
    }
}
