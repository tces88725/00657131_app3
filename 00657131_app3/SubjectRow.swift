//
//  SubjectRow.swift
//  00657131_app3
//
//  Created by User07 on 2019/12/5.
//  Copyright © 2019 User07. All rights reserved.
//

import Foundation
import SwiftUI

struct SubjectRow: View {
    var subject: Subject
    var body: some View {
        HStack{
            Text(subject.name)
            Spacer()
            Text("\(subject.type)科")
            Text("\(subject.time)分鐘")
            Image(systemName: subject.trueHeart ? "star.fill" :"star")
        }
        .background(Color(red: 1,green: 205/255, blue:201/255))
    }
}

struct SubjectRow_Previews: PreviewProvider {
    static var previews: some View {
        SubjectRow(subject: Subject(name:"小明", type: "國文", time: "60", trueHeart: true))
    }
}
