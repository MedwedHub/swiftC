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
//    private var user: User!
    private var userManager: UserManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
        configureDate()
        birthField.inputView = datePicker
        userManager = UserManager()
        user = userManager.getCurrentUser()
        nameField.text = user.name
        let dateToString: String
        if let date = user.birthDay {
            let dateFormatter = DateFormatter()
            dateToString = dateFormatter.string(from: date)
            birthField.text = dateToString
        } else {
            birthField.text = ""
        }
    }
    func configureDate() {
        datePicker = UIDatePicker(frame: CGRect.zero)
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(onDatePickerChanged), for: UIControlEvents.valueChanged)
        let accView = UIView()
        accView.frame = CGRect(x: 0, y: 0, width: 0, height: 30)
        accView.layer.backgroundColor = UIColor.lightGray.cgColor
        let accButton = UIButton()
        accButton.setTitle("Done", for: .normal)
        accButton.frame = CGRect(x: self.view.frame.width - 70, y: 5, width: 50, height: 20)
        accButton.addTarget(self, action: #selector(birthFieldDidEndEditing), for: .touchUpInside)
        accView.addSubview(accButton)
        birthField.inputAccessoryView = accView
        
        if let name = UserDefaults.standard.string(forKey: "nameKey"){
            print(name)
        } else {
            print("There is no name in database")
        }    }
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
            print("Username changed")
            if let name = UserDefaults.standard.string(forKey: "nameKey"){
            print(name)
            } else {
                print("There is no name in database")
            }
        }
    }
    @objc func birthFieldDidEndEditing(sender: Any) {
        self.view.endEditing(true)
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
