//
//  DrawView.swift
//  MementoExample3
//
//  Created by Сергей Клементьев on 27/03/2019.
//  Copyright © 2019 Сергей Клементьев. All rights reserved.
//

import UIKit

protocol DrawViewDelegate: class {
    func drawViewDrawWillBegin(_ drawView: DrawView)
}

class DrawViewStateMemento {
    fileprivate let strokes: [Stroke]
    
    init(strokes: [Stroke]) {
        self.strokes = strokes
    }
}

class DrawView: UIView {
    //MARK: - Private properties
    private var isDrawing = false
    private var lastPoint: CGPoint!
    private var strokeColor: CGColor = UIColor.black.cgColor
    private var strokes = [Stroke]()
    //MARK: -
    weak var delegate: DrawViewDelegate?
    //MARK: - Originator confirmance
    func createMemento() -> DrawViewStateMemento {
        return DrawViewStateMemento(strokes: self.strokes)
    }
    
    func applyMemento(_ memento: DrawViewStateMemento) {
        self.strokes = memento.strokes
        setNeedsDisplay()
    }
    //MARK: - interface methods
    func createApplyMementoCommand() -> ApplyMementoCommand {
        return ApplyMementoCommand(reciever: self, memento: createMemento())
    }
    
    func setStrokeColor(_ color: CGColor) {
        strokeColor = color
    }
    
    func erase() {
        strokes = []
        setNeedsDisplay()
    }
    //MARK: -
    override func awakeFromNib() {
        layer.shadowOpacity = 1
        layer.shadowRadius = 10
        layer.shadowOffset = CGSize(width: 1, height: 1)
        layer.shadowColor = UIColor.black.cgColor
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        delegate?.drawViewDrawWillBegin(self)
        guard  !isDrawing else { return }
        isDrawing = true
        guard let touch = touches.first else { return }
        let currentPoint = touch.location(in: self)
        lastPoint = currentPoint
        setNeedsDisplay()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard isDrawing else { return}
        guard let touch = touches.first else { return }
        let currentPoint = touch.location(in: self)
        let stroke = Stroke(startPoint: lastPoint, endPoint: currentPoint, color: strokeColor)
        strokes.append(stroke)
        lastPoint = currentPoint
        setNeedsDisplay()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard isDrawing else { return }
        isDrawing = false
        guard let touch = touches.first else { return }
        let currentPoint = touch.location(in: self)
        let stroke = Stroke(startPoint: lastPoint, endPoint: currentPoint, color: strokeColor)
        strokes.append(stroke)
        lastPoint = currentPoint
        setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        let context =  UIGraphicsGetCurrentContext()
        context?.setLineWidth(5)
        context?.setLineCap(.round)
        for stroke in strokes {
            context?.beginPath()
            context?.move(to: stroke.startPoint)
            context?.addLine(to: stroke.endPoint)
            context?.setStrokeColor(stroke.color)
            context?.strokePath()
        }
    }
}
