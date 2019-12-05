//
//  PieChart.swift
//  00657131_app3
//
//  Created by User07 on 2019/12/5.
//  Copyright © 2019 User07. All rights reserved.
//

import Foundation
import SwiftUI

struct PieChart: View {
    var subjectData : SubjectData
    var percentages : [Double]
    var angles : [Angle]
    var types = ["國文", "英文", "數學", "自然", "社會", "美術"]
    var colors :[Color]
    var totalCount : Int = 0
    
    init(subjectData : SubjectData){
        self.subjectData  = subjectData
        if subjectData.subjects.count == 0{
            self.colors = [Color.white,Color.white,Color.white,Color.white,Color.white,Color.white]
            self.percentages = [1.0]
            self.angles = [.degrees(0),.degrees(0),.degrees(0),.degrees(0),.degrees(0),.degrees(0)]
        }
        else{
            percentages = [0.0,0.0,0.0,0.0,0.0,0.0]
            angles = [Angle]()
            colors = [Color.blue,Color.red,Color.yellow,Color.green,Color.orange,Color.purple]

            for data in self.subjectData.subjects{
                totalCount += 1;
                for index in 0...5{
                    if(types[index] == data.type){
                        percentages[index] += 1
                    }
                }
            }
            var startDegree : Double = 0
            for index in 0...5{
                percentages[index] /= Double(totalCount)
                angles.append(.degrees(startDegree))
                startDegree += 360 * percentages[index]
            }
        }
    }
    var body: some View {
        ZStack{
            ForEach(angles.indices){ (index) in
                ExtractedView(index:index,angles: self.angles,colors: self.colors)
            }
        }
    }
}

struct PieChart_Previews: PreviewProvider {
    static var previews: some View {
        PieChart(subjectData: SubjectData())
    }
}


struct ExtractedView: View {
    var index : Int
    var angles : [Angle]
    var colors : [Color]
    var body: some View {
        ZStack{
            if index == (angles.count-1){
                MyChart(startAngle: angles[index], endAngle: .degrees(360)).fill(colors[index])
            }
            else{
                MyChart(startAngle: angles[index], endAngle: angles[index+1]).fill(colors[index])
            }
        }.frame(width :250,height: 250)
    }
}

struct MyChart : Shape{
    var startAngle : Angle
    var endAngle : Angle

    func path(in rect :CGRect)-> Path{
        Path{(path) in
            let center = CGPoint(x:rect.midX,y:rect.midY)
            path.move(to:center)
            path.addArc(center:center,radius:rect.midX,startAngle: startAngle,endAngle: endAngle,clockwise: false)
        }
    }
}
