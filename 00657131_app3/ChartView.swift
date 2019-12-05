//
//  ChartView.swift
//  00657131_app3
//
//  Created by User07 on 2019/12/5.
//  Copyright © 2019 User07. All rights reserved.
//

import Foundation
import SwiftUI

struct ChartView: View {
    @ObservedObject var subjectData = SubjectData()
    var body: some View {
        ZStack{
            Color(red:255/255, green: 231/255, blue: 230/255)
            .edgesIgnoringSafeArea(.all)

        VStack{
            PieChart(subjectData: self.subjectData).frame(width:300,height: 300)
            CircleChart(subjectData: self.subjectData).frame(width:300,height: 300)
            }
        }
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
    }
}
