//
//  main.swift
//  TheMementoPatternExample
//
//  Created by Сергей Клементьев on 13/03/2019.
//  Copyright © 2019 Сергей Клементьев. All rights reserved.
//

import Foundation

let myOriginator = MyOriginator(field: "1")
let memento: MyMemento = myOriginator.createMemento()
myOriginator.setField("2")
myOriginator.apply(memento: memento)

