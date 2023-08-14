//
//  ToDoListItemViewViewModel.swift
//  ToDoList
//
//  Created by Anshu Vij on 14/08/23.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

//vm for single todo list item view
class ToDoListItemViewViewModel : ObservableObject {
    
    init() {
        
    }
    
    func toggleIsDone(item : ToDoListItem) {
        var itemCopy = item
        itemCopy.toggleDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
   
}
