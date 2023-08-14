//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Anshu Vij on 14/08/23.
//

import SwiftUI
import FirebaseCore

@main
struct ToDoListApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
