//
//  UserManager.swift
//  swiftC
//
//  Created by xc106d3 on 2018-03-23.
//  Copyright © 2018 xc106d3. All rights reserved.
//

import UIKit

class UserManager {
    //let defaults = UserDefault.s
    func getCurrentUser() -> User {
        let name = UserDefaults.standard.string(forKey: "nameKey")
        let birthDay = UserDefaults.standard.object(forKey: "birthDayKey") as? Date
        let user = User(name: name, birthDay: birthDay, avatar: nil)
        return user
    }
    func changeUser(_ user: User) {
        UserDefaults.standard.set(user.name, forKey: "nameKey")
        UserDefaults.standard.set(user.birthDay, forKey: "birthDayKey")
    }
}
