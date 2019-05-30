//
//  Protocols.swift
//  VisitorExample
//
//  Created by Сергей Клементьев on 29/05/2019.
//  Copyright © 2019 Сергей Клементьев. All rights reserved.
//

import Foundation

protocol ShapeVisitor {
    func visit(_ circle: Circle)
    func visit(_ square: Square)
    func visit(_ rectangle: Rectangle)
}

final class EdgeCountingShapeVisitor: ShapeVisitor {

    func visit(_ circle: Circle) {
        print("Circle edge count 1")
    }
    
    func visit(_ square: Square) {
        print("Square edge count 4")
    }
    
    func visit(_ rectangle: Rectangle) {
        print("Rectangle edge count 4")
    }
}

final class AreaCalculatingVisitor: ShapeVisitor {

    func visit(_ circle: Circle) {
        print("Circle with area \(Float.pi * circle.radius * circle.radius)")
    }

    func visit(_ square: Square) {
        print("Square with area \(square.length * square.length)")
    }

    func visit(_ rectangle: Rectangle) {
        print("Rectangle with area \(rectangle.xLen * rectangle.yLen)")
    }
}

