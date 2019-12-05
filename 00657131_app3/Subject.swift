//
//  subject.swift
//  00657131_app3
//
//  Created by User07 on 2019/12/5.
//  Copyright © 2019 User07. All rights reserved.
//

import Foundation
struct Subject: Identifiable, Codable {
    var id = UUID()
    var name: String
    var type: String
    var time: String
    var trueHeart: Bool
}
