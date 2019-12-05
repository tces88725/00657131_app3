//
//  SubjectEditor.swift
//  00657131_app3
//
//  Created by User07 on 2019/12/5.
//  Copyright © 2019 User07. All rights reserved.
//

import Foundation
import SwiftUI

struct SubjectEditor: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var name = ""
    @State private var type = ""
    @State private var time = ""
    @State private var trueHeart = false
    @State private var showAlert = false
    var editSubject: Subject?
    var subjectData: SubjectData
    var body: some View {
        VStack{
            Form {
                TextField("名字", text: $name)
                profileType(selectedType: self.$type)
                TextField("學習時長(分鐘)", text: $time)
                .keyboardType(.numberPad)
                Toggle("是否完成", isOn: $trueHeart)
            }
            .navigationBarTitle(editSubject == nil ? "增加學習紀錄" : "編輯紀錄")
            .navigationBarItems(trailing: Button("儲存") {
            let subject = Subject(name: self.name, type: self.type, time: self.time, trueHeart: self.trueHeart)
            if let editSubject = self.editSubject {
                let index = self.subjectData.subjects.firstIndex {
                return $0.id == editSubject.id
            }!
            self.subjectData.subjects[index] = subject
            } else {
                self.subjectData.subjects.insert(subject, at: 0)
            }
            self.presentationMode.wrappedValue.dismiss()
         })
            .onAppear {
                if let editSubject = self.editSubject{
                    self.name = editSubject.name
                    self.type = editSubject.type
                    self.time = editSubject.time
                    self.trueHeart = editSubject.trueHeart
                }
            }
        }
        .padding(.top)
        .foregroundColor(Color(red:242/255, green: 107/255, blue: 145/255))
        .colorMultiply(Color(red:255/255, green: 231/255, blue: 230/255))
    }
}

struct SubjectEditor_Previews: PreviewProvider {
    static var previews: some View {
        SubjectEditor(subjectData: SubjectData())
    }
}

struct profileType: View
{
    @Binding var selectedType: String
    var types = ["國文", "英文", "數學", "自然", "社會", "美術"]
    var body: some View
    {
        Picker(selection: $selectedType, label: Text("類型"))
        {
            ForEach(types, id: \.self)
            {
                (type) in
                Text(type)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
    }
}
