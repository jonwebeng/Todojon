//
//  Item.swift
//  Todojon
//
//  Created by JON SKYNET on 25/12/2017.
//  Copyright © 2017 JON SKYNET. All rights reserved.
//

import Foundation
class Item: Encodable, Decodable {
    var title: String = ""
    var done: Bool = false
}
