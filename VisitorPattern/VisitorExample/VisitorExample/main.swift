//
//  main.swift
//  VisitorExample
//
//  Created by Сергей Клементьев on 29/05/2019.
//  Copyright © 2019 Сергей Клементьев. All rights reserved.
//

import Foundation

let shapes: [ShapeVisitable] = [Circle(radius: 5), Square(length: 2), Rectangle(x: 3, y: 4)]

let edgeCountingShapeVisitor = EdgeCountingShapeVisitor()
shapes.forEach {
    $0.accept(visitor: edgeCountingShapeVisitor)
}

let shapeAreaCalculatingVisitor = AreaCalculatingVisitor()
shapes.forEach {
    $0.accept(visitor: shapeAreaCalculatingVisitor)
}
