//
//  Category.swift
//  MyToDoList
//
//  Created by Rosa Mejia on 1/9/19.
//  Copyright © 2019 Rosa Mejia. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name : String = ""
    let items = List<Item>()
    
}
