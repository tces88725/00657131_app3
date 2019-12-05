//
//  subjectData.swift
//  00657131_app3
//
//  Created by User07 on 2019/12/5.
//  Copyright © 2019 User07. All rights reserved.
//

import Foundation
class SubjectData: ObservableObject{
    
    @Published var subjects = [Subject](){
        didSet{
            let encoder = JSONEncoder()
            if let data = try? encoder.encode(subjects){
                UserDefaults.standard.set(data, forKey:"subjects")
            }
        }
    }
    
    init(){
        if let data =
            UserDefaults.standard.data(forKey:"subjects"){
            let decoder = JSONDecoder()
            if let decodedData = try? decoder.decode([Subject].self, from:data){
                subjects = decodedData
            }
        }
    }
    
}
