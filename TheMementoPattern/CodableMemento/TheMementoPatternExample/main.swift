//
//  main.swift
//  TheMementoPatternExample
//
//  Created by Сергей Клементьев on 13/03/2019.
//  Copyright © 2019 Сергей Клементьев. All rights reserved.
//

import Foundation

let encoder = JSONEncoder()
encoder.outputFormatting = .prettyPrinted
let decoder  = JSONDecoder()
//
let myOriginator = MyOriginator(field: "1")
let memento: MyMemento = myOriginator.createMemento()
let encodedMemento: Data = try encoder.encode(memento)
//
myOriginator.setField("2")
//
let decodedMemento: MyMemento = try decoder.decode(MyMemento.self, from: encodedMemento)
myOriginator.apply(memento: decodedMemento)
