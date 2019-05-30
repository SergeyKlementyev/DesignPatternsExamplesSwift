//
//  Ledger.swift
//  TheMementoPatternExample
//
//  Created by Сергей Клементьев on 13/03/2019.
//  Copyright © 2019 Сергей Клементьев. All rights reserved.
//

import Foundation

class MyOriginator {
    private var somePrivateField: String
    
    init(field: String) {
        self.somePrivateField = field
    }
    
    func setField(_ text: String) {
        somePrivateField = text
    }
}

// MARK: - originator methods
extension MyOriginator {
    
    func createMemento() -> MyMemento {
        return MyMemento(somePrivateField: somePrivateField)
    }
    
    func apply(memento: MyMemento) {
        self.somePrivateField = memento.somePrivateField
    }
}

class MyMemento {
    fileprivate let somePrivateField: String
    
    init(somePrivateField: String) {
        self.somePrivateField = somePrivateField
    }
}
