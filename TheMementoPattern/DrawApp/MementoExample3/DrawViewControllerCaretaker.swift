//
//  DrawViewControllerCaretaker.swift
//  MementoExample3
//
//  Created by Сергей Клементьев on 30/05/2019.
//  Copyright © 2019 Сергей Клементьев. All rights reserved.
//

import Foundation

class DrawViewControllerCaretaker {
    static let shared = DrawViewControllerCaretaker()
    
    private init() {}
    
    var drawViewControllerMemento: DrawViewControllerMemento?
}
