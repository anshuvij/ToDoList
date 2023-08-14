//
//  TLButton.swift
//  ToDoList
//
//  Created by Anshu Vij on 14/08/23.
//

import SwiftUI

struct TLButton: View {
    let title : String
    let bgColor : Color
    let action : () -> Void
    
    var body: some View {
        
        Button {
            //Actions
            action()
        } label :
        {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(bgColor)
                
                Text(title)
                    .foregroundColor(.white)
                    .bold()
            }
        }
    
    }
}

struct TLButton_Previews: PreviewProvider {
    static var previews: some View {
        TLButton(title: "Title", bgColor: .pink) {
            
        }
    }
}
