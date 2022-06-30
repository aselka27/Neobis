//
//  Task.swift
//  MixTwoApps
//
//  Created by саргашкаева on 29.06.2022.
//

import Foundation

class Task {
    var taskName: String = ""
    var taskDescription: String
    var isClicked: Bool
    
    init(taskName: String, taskDescription: String, isClicked: Bool) {
        self.taskName = taskName
        self.taskDescription = taskDescription
        self.isClicked = isClicked
    }
}

extension Task: Equatable {
    static func == (lhs: Task, rhs: Task) -> Bool {
        lhs.isClicked == rhs.isClicked &&
        lhs.taskName == rhs.taskName &&
        lhs.taskDescription == rhs.taskDescription
    }
}
