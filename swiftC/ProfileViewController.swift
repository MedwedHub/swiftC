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
    private var user: User!
    private var userManager: UserManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
        configureDate()
        birthField.inputView = datePicker
        userManager = UserManager()
        user = userManager.getCurrentUser()
    }
    func configureDate() {
        datePicker = UIDatePicker(frame: CGRect.zero)
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(onDatePickerChanged), for: UIControlEvents.valueChanged)
    }
    @objc func onDatePickerChanged(_ datePicker: UIDatePicker) {
        let date = datePicker.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        birthField.text = dateFormatter.string(from: date)
        user.birthDay = date
        userManager.changeUser(user)
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let text = textField.text, text.count > 0 {
            user.name = text
            userManager.changeUser(user)        
        }
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
