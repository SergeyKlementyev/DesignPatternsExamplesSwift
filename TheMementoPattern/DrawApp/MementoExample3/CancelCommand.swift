//
//  CancelCommand.swift
//  MementoExample3
//
//  Created by Сергей Клементьев on 27/03/2019.
//  Copyright © 2019 Сергей Клементьев. All rights reserved.
//

class ApplyMementoCommand {
    weak var reciever: DrawView?
    private let memento: DrawViewStateMemento
    
    init(reciever: DrawView, memento: DrawViewStateMemento) {
        self.reciever = reciever
        self.memento = memento
    }
    
    func execute() {
        reciever?.applyMemento(memento)
    }
}
