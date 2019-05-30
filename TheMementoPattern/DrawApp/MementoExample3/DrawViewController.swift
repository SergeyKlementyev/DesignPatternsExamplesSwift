//
//  ViewController.swift
//  MementoExample3
//
//  Created by Сергей Клементьев on 27/03/2019.
//  Copyright © 2019 Сергей Клементьев. All rights reserved.
//

import UIKit

class DrawViewController: UIViewController {

    @IBOutlet weak var drawView: DrawView!
    @IBOutlet weak var pickedColorView: UIView!
    var currentStrokeColor: UIColor?
    
    var applyMementoCommands: [ApplyMementoCommand] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStroke(color: UIColor.black)
        drawView.delegate  = self
        if let sceneMemento = DrawViewControllerCaretaker.shared.drawViewControllerMemento {
            applyMemento(sceneMemento)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        applyMementoCommands.append(drawView.createApplyMementoCommand()) 
        DrawViewControllerCaretaker.shared.drawViewControllerMemento = createMemento()
    }
    
    @IBAction func eraseButtonTouched(_ sender: UIButton) {
        applyMementoCommands.append(drawView.createApplyMementoCommand())
        drawView.erase()
    }
    
    @IBAction func cancelButtonTouched(_ sender: UIButton) {
        let lastIndex = applyMementoCommands.count - 1
        guard lastIndex >= 0 else {
            return
        }
        applyMementoCommands.remove(at: lastIndex).execute()
    }
    
    @IBAction func colorTouched(_ sender: UIButton) {
        setStroke(color: sender.backgroundColor ?? UIColor.black)
    }
    
    private func setStroke(color: UIColor) {
        currentStrokeColor = color
        pickedColorView.backgroundColor = color
        drawView.setStrokeColor(color.cgColor)
    }
    
    // MARK: - memento implementing
    
    func createMemento() -> DrawViewControllerMemento {
        let memento = DrawViewControllerMemento(strokeColor: currentStrokeColor, applyMementoCommands: self.applyMementoCommands)
        return memento
    }
    
    func applyMemento(_ memento: DrawViewControllerMemento) {
        if let strokeColor = memento.strokeColor {
            setStroke(color: strokeColor)
        }
        self.applyMementoCommands = memento.applyMementoCommands
        applyMementoCommands.forEach { $0.reciever = drawView }
        applyMementoCommands.last?.execute()
    }
}

class DrawViewControllerMemento {
    let strokeColor: UIColor?
    let applyMementoCommands: [ApplyMementoCommand]
    
    init(strokeColor: UIColor?, applyMementoCommands: [ApplyMementoCommand]) {
        self.strokeColor = strokeColor
        self.applyMementoCommands = applyMementoCommands
    }
}

extension DrawViewController: DrawViewDelegate {
    
    func drawViewDrawWillBegin(_ drawView: DrawView) {
        applyMementoCommands.append(drawView.createApplyMementoCommand())
    }
}
