//
//  AppView.swift
//  00657131_app3
//
//  Created by User07 on 2019/12/5.
//  Copyright © 2019 User07. All rights reserved.
//

import Foundation
import SwiftUI

struct AppView: View {
    var body: some View {
        TabView{
            SubjectList()
                .tabItem{
                    Image(systemName:"flag.fill")
                    Text("學習")
                }
            ChartView(subjectData:SubjectData())
                .tabItem {
                      Image(systemName: "questionmark")
                      Text("分析")
                }
        }.accentColor(Color(red:242/255, green: 107/255, blue: 145/255))
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
