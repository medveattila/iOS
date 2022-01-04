//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Medveczky Attila on 2020. 09. 10..
//  Copyright © 2020. The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answer: String
    
    init(q: String, a:String) {
        text = q
        answer = a
    }
}
