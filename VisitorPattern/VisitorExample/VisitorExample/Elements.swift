//
//  Elements.swift
//  VisitorExample
//
//  Created by Сергей Клементьев on 29/05/2019.
//  Copyright © 2019 Сергей Клементьев. All rights reserved.
//

import Foundation

protocol ShapeVisitable {
    func accept(visitor: ShapeVisitor)
}

class Circle: ShapeVisitable {
    let radius: Float
    init(radius: Float) {
        self.radius = radius;
    }
    
    func accept(visitor: ShapeVisitor) {
        visitor.visit(self)
    }
}

class Square: ShapeVisitable {
    let length: Float
    init(length: Float) {
        self.length = length;
    }
    
    func accept(visitor: ShapeVisitor) {
        visitor.visit(self)
    }
}

class Rectangle: ShapeVisitable {
    let xLen: Float
    let yLen: Float
    
    init(x: Float, y: Float) {
        self.xLen = x;
        self.yLen = y;
    }
    
    func accept(visitor: ShapeVisitor) {
        visitor.visit(self)
    }
}
