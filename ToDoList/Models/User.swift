//
//  User.swift
//  ToDoList
//
//  Created by Anshu Vij on 14/08/23.
//

import Foundation


struct User : Codable {
    
    let id : String
    let name : String
    let email : String
    let joined : TimeInterval
}
