//
//  SubjectList.swift
//  00657131_app3
//
//  Created by User07 on 2019/12/5.
//  Copyright © 2019 User07. All rights reserved.
//

import Foundation
import SwiftUI

struct SubjectList: View {
    @ObservedObject var subjectData = SubjectData()
    @State private var showEditsubject = false
    var body: some View {
        VStack{
        NavigationView {
            
            List {
                ForEach(subjectData.subjects) { (subject) in
                    NavigationLink(destination: SubjectEditor(
                        editSubject:subject, subjectData:self.subjectData)) {
                        SubjectRow(subject: subject)}
                }
                .onDelete { (indexSet) in
                self.subjectData.subjects.remove(atOffsets: indexSet)}
                .onMove { (indexSet, index) in
                    self.subjectData.subjects.move(fromOffsets: indexSet, toOffset: index)
                }
            }
          .navigationBarTitle("讀書紀錄")
          
          .navigationBarItems(leading: EditButton(),trailing: Button(action: {
            self.showEditsubject = true
          }, label: {
                Image(systemName: "plus.circle.fill")
          }))
          .sheet(isPresented: $showEditsubject) {
              NavigationView {
                SubjectEditor(subjectData: self.subjectData)}
          }
          }.foregroundColor(Color(red:242/255, green: 107/255, blue: 145/255))
        }
        .colorMultiply(Color(red:255/255, green: 231/255, blue: 230/255))
        
    }
}

struct SubjectList_Previews: PreviewProvider {
    static var previews: some View {
        SubjectList()
    }
}
