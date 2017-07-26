//
//  Assessment.swift
//  GPACalcSecond
//
//  Created by Najia Haider on 2/11/17.
//  Copyright © 2017 Najia Haider. All rights reserved.
//

import Foundation

class Assessment {

    func AssessmentCalc(Point: Double, Max: Double, Percent: Double) -> Double {
        
        let FinalPer = Point/Max * Percent
        
        
    return FinalPer
        
    
    }

    func Grade(Assignments: Double, Midterm: Double, Final: Double) -> Double {
        
        let finalGrade = Assignments + Midterm + Final
    
    return finalGrade
        
    }


    func credits_dividend(grades: [Double]) -> Double {
      
        var credits = 0.0
        for i in grades {
            credits = credits + i
            
        }
            return credits
}
}
