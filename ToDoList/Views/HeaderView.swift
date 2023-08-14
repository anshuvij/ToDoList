//
//  HeaderView.swift
//  ToDoList
//
//  Created by Anshu Vij on 14/08/23.
//

import SwiftUI

struct HeaderView: View {
    
    let title : String
    let subTitle : String
    let angle : Double
    let backgroundColor : Color
    
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(backgroundColor).opacity(0.8)
                .rotationEffect(Angle(degrees: angle))
               
            VStack {
                Text(title)
                    .foregroundColor(.white)
                    .font(.system(size: 50))
                    .bold()
                
                Text(subTitle)
                    .foregroundColor(.white)
                    .font(.system(size: 30))
            }
            .padding(.top, 80)
            
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 350)
        .offset(y : -150)
        
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "Title", subTitle: "SubTitle", angle: 15, backgroundColor: .blue)
    }
}
