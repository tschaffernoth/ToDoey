//
//  Category.swift
//  Todoey
//
//  Created by Thomas G Schaffernoth on 11/15/18.
//  Copyright © 2018 Thomas G Schaffernoth. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var title: String = ""
    let items = List<Item>()
    
}
