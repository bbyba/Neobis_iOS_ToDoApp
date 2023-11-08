//
//  Task.swift
//  Neobis_iOS_ToDoApp
//

import Foundation

struct TaskModel: Codable {
    var title:String
    var details: String
    var isCompleted: Bool
}
