//
//  ViewController.swift
//  GPACalcSecond
//
//  Created by Najia Haider on 2/8/17.
//  Copyright © 2017 Najia Haider. All rights reserved.
//

import UIKit





class ViewController: UIViewController {
    
    
    //Course Text Field 
    
    @IBOutlet weak var CourseTextField: UITextField!
    
    //Assessment Text Fields 
    
    @IBOutlet weak var AssessPoints: UITextField!
    @IBOutlet weak var AssessMax: UITextField!
    @IBOutlet weak var AssessPer: UITextField!
    
    //Midterm Text Fields
    @IBOutlet weak var MidPoints: UITextField!
    @IBOutlet weak var MidMax: UITextField!
    @IBOutlet weak var MidPer: UITextField!
    
    //Final Text Fields 
    @IBOutlet weak var FinalPoints: UITextField!
    @IBOutlet weak var FinalMax: UITextField!
    @IBOutlet weak var FinalPer: UITextField!
    
    //Credit Text Field 
    @IBOutlet weak var credit: UITextField!
    
    //CHalkboard 
    
    
    @IBOutlet weak var ClassOneLabel: UILabel!
    @IBOutlet weak var ClassTwoLabel: UILabel!
    @IBOutlet weak var ClassThreeLabel: UILabel!
    @IBOutlet weak var ClassFourLabel: UILabel!
    
    
    @IBOutlet weak var ImageViewFirst: UIImageView!
    @IBOutlet weak var ImageViewSecond: UIImageView!
    @IBOutlet weak var ImageViewThird: UIImageView!
    @IBOutlet weak var ImageViewFourth: UIImageView!
    
    
    
    //Text Field for Class Delete
    @IBOutlet weak var DeleteClass: UITextField!
    
    
    //GPA Label 
    
    @IBOutlet weak var GPAlabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Turn text fields into numbers for calculations
        
        
        
    }
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    var course = courses()
    var grade = courses()
    var cred = courses()
    var grade_points = courses()
    
    
    //Button to Calculate Grades and Display 
    
    
    var i = 1
    
    
    @IBAction func CalculateGradeClass(_ sender: Any) {
        
        
        
        //Figure out grade for each class 
        if course.courseArray.count < 5 {
            
           
            
        var AssessmentPoints = Double(AssessPoints.text!)
        var AssessmentMax = Double(AssessMax.text!)
        var AssessmentPercent = Double(AssessPer.text!)
        
        var AssessFinal = Assessment()
        
        var assess = AssessFinal.AssessmentCalc(Point: AssessmentPoints!, Max: AssessmentMax!, Percent: AssessmentPercent!)

       // ClassOneLabel.text = " \(assess) "
        
        
        var MidtermPoint = Double(MidPoints.text!)
        var MidtermMax = Double(MidMax.text!)
        var MidtermPercent = Double(MidPer.text!)
        
        var midterm = AssessFinal.AssessmentCalc(Point: MidtermPoint!, Max: MidtermMax!, Percent: MidtermPercent!)
        
        // ClassOneLabel.text = " \(midterm) "

        
        var FinPoints = Double(FinalPoints.text!)
        var FinMax = Double(FinalMax.text!)
        var FinPer = Double(FinalPer.text!)
        
        
        var final = AssessFinal.AssessmentCalc(Point: FinPoints!, Max: FinMax!, Percent: FinPer!)
        
        
        
        //Calculate Grade for a single class 
        
        var gradePerClass = AssessFinal.Grade(Assignments: assess, Midterm: midterm, Final: final)
            
         var weight = Double(MidtermPercent!) + Double(AssessmentPercent!) + Double(FinPer!)
            
            
            
            if MidtermPoint! > MidtermMax! || FinPoints! > FinMax! || AssessmentPoints! > AssessmentMax! || gradePerClass > 100  || weight > 100  {
                var alert_total = UIAlertController(title: "Mathmatic Error", message: "These numbers don't make sense. Do it again.", preferredStyle: UIAlertControllerStyle.alert)
                
                alert_total.addAction(UIAlertAction(title: "kay", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert_total, animated: true, completion: nil)
            
            
            
            
            }
            
            else {
            
            
            
            var letter_grade = " "
            var gp = 0.0
            
            
            if gradePerClass >= 90 && gradePerClass <= 100 {
                letter_grade = "A"
                gp = 4.0
            }
            
            
            if gradePerClass >= 80 && gradePerClass < 90 {
                letter_grade = "B"
                    gp = 3.0
                }
            
            if gradePerClass >= 70 && gradePerClass < 80 {
                letter_grade = "C"
                gp = 2.0
            }
            
            if gradePerClass >= 60 && gradePerClass < 70 {
            
                letter_grade = "D"
                gp = 1.0
            }
            
            
            if gradePerClass < 60 {
                letter_grade = "F"
                gp = 0.0
            }
            
            
            grade.grades.append(letter_grade)
            
            
//            
//            if CourseTextField.text == course.courseArray[i-1] {
//                //course.courseArray.append("\(CourseTextField.text!)")
//                var alert = UIAlertController(title: "Class Error", message: "Duplicate Class, change the name", preferredStyle: UIAlertControllerStyle.alert)
//                
//                alert.addAction(UIAlertAction(title: "kay", style: UIAlertActionStyle.default, handler: nil))
//                self.present(alert, animated: true, completion: nil)
//
//                
//                
//            }
//
           
            course.courseArray.append("\(CourseTextField.text!)")
            
            
            cred.credits.append(Double(credit.text!)!)
            course.grade_points.append(gp)
//            
//           var why = grade.grades[i]
//            
//            print(why)
            
            if i == 1 {
                //ClassOneLabel.text = " \(gradePerClass)"
                ClassOneLabel.text = " \(course.courseArray[1]) \(cred.credits[1])"
                
                if gradePerClass <= 100 && gradePerClass >= 90 {
                    ImageViewFirst.image = #imageLiteral(resourceName: "grade_a")
                    
                    
                }
                
                if gradePerClass < 90 && gradePerClass >= 80 {
                    ImageViewFirst.image = #imageLiteral(resourceName: "grade_b")
                    
                }
                
                if gradePerClass < 80 && gradePerClass >= 70 {
                    ImageViewFirst.image = #imageLiteral(resourceName: "grade_c")
                    
                }
                
                if gradePerClass < 70 && gradePerClass >= 60 {
                    ImageViewFirst.image = #imageLiteral(resourceName: "grade_d")
                    
                }
                
                if gradePerClass < 60 {
                    ImageViewFirst.image = #imageLiteral(resourceName: "grade_f")
                                }
            
            }
            
            
            if i == 2 {
                ClassTwoLabel.text = " \(course.courseArray[2]) \(cred.credits[2])"
                //ImageViewSecond.image = #imageLiteral(resourceName: "grade_b")
                
                if gradePerClass <= 100 && gradePerClass >= 90 {
                    ImageViewSecond.image = #imageLiteral(resourceName: "grade_a")
                    
                }
                
                if gradePerClass < 90 && gradePerClass >= 80 {
                    ImageViewSecond.image = #imageLiteral(resourceName: "grade_b")
                    
                }
                
                if gradePerClass < 80 && gradePerClass >= 70 {
                    ImageViewSecond.image = #imageLiteral(resourceName: "grade_c")
                    
                }
                
                if gradePerClass < 70 && gradePerClass >= 60 {
                    ImageViewSecond.image = #imageLiteral(resourceName: "grade_d")
                    
                }
                
                if gradePerClass < 60 {
                    ImageViewSecond.image = #imageLiteral(resourceName: "grade_f")
                    
                }
      
                
            
            }
            
            
            if i == 3 {
                
              
                
                ClassThreeLabel.text = "\(course.courseArray[3]) \(cred.credits[3])"
                //ImageViewThird.image = #imageLiteral(resourceName: "grade_c")
                if gradePerClass <= 100 && gradePerClass >= 90 {
                    ImageViewThird.image = #imageLiteral(resourceName: "grade_a")
                }
                
                if gradePerClass < 90 && gradePerClass >= 80 {
                    ImageViewThird.image = #imageLiteral(resourceName: "grade_b")
                    
                }
                
                if gradePerClass < 80 && gradePerClass >= 70 {
                    ImageViewThird.image = #imageLiteral(resourceName: "grade_c")
                    
                }
                
                if gradePerClass < 70 && gradePerClass >= 60 {
                    ImageViewThird.image = #imageLiteral(resourceName: "grade_d")
                    
                }
                
                if gradePerClass < 60 {
                    ImageViewThird.image = #imageLiteral(resourceName: "grade_f")
                    
                }

                
                
                
                
            
            }
            
            
            if i == 4 {
                ClassFourLabel.text = " \(course.courseArray[4]) \(cred.credits[4])"
                //ImageViewFourth.image = #imageLiteral(resourceName: "grade_a")
                if gradePerClass <= 100 && gradePerClass >= 90 {
                    ImageViewFourth.image = #imageLiteral(resourceName: "grade_a")
                }
                
                if gradePerClass < 90 && gradePerClass >= 80 {
                    ImageViewFourth.image = #imageLiteral(resourceName: "grade_b")
                    
                }
                
                if gradePerClass < 80 && gradePerClass >= 70 {
                    ImageViewFourth.image = #imageLiteral(resourceName: "grade_c")
                    
                }
                
                if gradePerClass < 70 && gradePerClass >= 60 {
                    ImageViewFourth.image = #imageLiteral(resourceName: "grade_d")
                    
                }
                
                if gradePerClass < 60 {
                    ImageViewFourth.image = #imageLiteral(resourceName: "grade_f")
                    
                }

                
                
                
                
            
            }
            
            
            
       // ClassOneLabel.text = " \(gradePerClass) "
        
 //////////////////////////////////////////////////////////
        
            
            //cred.grade_points
            
           
            
             var gpa_top = course.grade_points[i] * cred.credits[i]
                //print(gpa_top)
                cred.grade_points.append(gpa_top)
            print(course.grade_points[i])
          //  print(cred.credits[i])
            //print(cred.grade_points[i])
            
            
            
                //print(cred.grade_points[i])
            
                        var top = AssessFinal.credits_dividend(grades: cred.grade_points)
                    //print(top)
                        var divdend = AssessFinal.credits_dividend(grades: cred.credits)
                        var gpa_to_display = top/divdend
            
                //grade.credits.append(gpa_to_display)
            
                if gpa_to_display == 0.0/0.0 {
                    gpa_to_display = 0.0
                    
                }
                

            
            
            
            
            GPAlabel.text = "GPA: \(gpa_to_display)"
                
                if gpa_to_display <= 4 && gpa_to_display >= 3 {
                    GPAlabel.textColor = UIColor.green
                } else if gpa_to_display <= 2.99 && gpa_to_display >= 2 {
                    GPAlabel.textColor = UIColor.orange
                
                } else if gpa_to_display < 2.0 {
                    GPAlabel.textColor = UIColor.red
                
                }
                
//
            
            
            
        
                 i+=1
           // print(i)
         //   print(course.courseArray.count)
            
            
        }
        }
     
        else {
            
        var alert_class_max = UIAlertController(title: "Class Error", message: "Only four classes", preferredStyle: UIAlertControllerStyle.alert)
            
            alert_class_max.addAction(UIAlertAction(title: "kay", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert_class_max, animated: true, completion: nil)
            
        }
        
        
        
        
        
    }
    

    
    
   
    
    @IBAction func DeleteMember(_ sender: Any) {
        
        
     
        
        
        
        
        
        
        var class_to_del = Int(DeleteClass.text!)
        
        if class_to_del! >= course.courseArray.count {
            var alert_del = UIAlertController(title: "Delete Error ", message: "Nothing to Delete, put classes in", preferredStyle: UIAlertControllerStyle.alert)
            
                        alert_del.addAction(UIAlertAction(title: "kay", style: UIAlertActionStyle.default, handler: nil))
                        self.present(alert_del, animated: true, completion: nil)
        
        
        }
        
        else {
        var AssessFinal = Assessment()
        course.courseArray.remove(at: class_to_del!)
        grade.grades.remove(at: class_to_del!)
        
        
        
        cred.credits.remove(at: class_to_del!)
        cred.grade_points.remove(at:class_to_del!)
        course.grade_points.remove(at:class_to_del!)
//        
//     //
        var top = AssessFinal.credits_dividend(grades: cred.grade_points)
       // print(top)
        var divdend = AssessFinal.credits_dividend(grades: cred.credits)
        var gpa_to_display = top/divdend
            
            if gpa_to_display == 0.0/0.0 {
                gpa_to_display = 0.0
            
            }
       

         GPAlabel.text = "GPA: \(gpa_to_display) "
        if gpa_to_display <= 4 && gpa_to_display >= 3 {
            GPAlabel.textColor = UIColor.green
        } else if gpa_to_display <= 2.99 && gpa_to_display >= 2 {
            GPAlabel.textColor = UIColor.orange
            
        } else if gpa_to_display < 2.0 {
            GPAlabel.textColor = UIColor.red
            
        }

        
        
        
        
        
        if course.courseArray.count == 4 {
            ClassOneLabel.text = " \(course.courseArray[1]) \(cred.credits[1])"
            
            
     /////////
            if grade.grades[1] == "A" {
                ImageViewFirst.image = #imageLiteral(resourceName: "grade_a")
            }else if grade.grades[1] == "B" { ImageViewFirst.image = #imageLiteral(resourceName: "grade_b") } else if grade.grades[1] == "C" { ImageViewFirst.image = #imageLiteral(resourceName: "grade_c") } else if grade.grades[1] == "D" { ImageViewFirst.image = #imageLiteral(resourceName: "grade_d") } else { ImageViewFirst.image = #imageLiteral(resourceName: "grade_f")}
            
     ////////
            
            ClassTwoLabel.text = "\(course.courseArray[2]) \(cred.credits[2])"
            
            
    //////
            
            if grade.grades[2] == "A" {
                ImageViewSecond.image = #imageLiteral(resourceName: "grade_a")
            }else if grade.grades[2] == "B" { ImageViewSecond.image = #imageLiteral(resourceName: "grade_b") } else if grade.grades[2] == "C" { ImageViewSecond.image = #imageLiteral(resourceName: "grade_c") } else if grade.grades[2] == "D" { ImageViewSecond.image = #imageLiteral(resourceName: "grade_d") } else { ImageViewSecond.image = #imageLiteral(resourceName: "grade_f")}   //////
            
            ClassThreeLabel.text = "\(course.courseArray[3]) \(cred.credits[3])"
            
            if grade.grades[3] == "A" {
                ImageViewThird.image = #imageLiteral(resourceName: "grade_a")
            }else if grade.grades[3] == "B" { ImageViewThird.image = #imageLiteral(resourceName: "grade_b") } else if grade.grades[3] == "C" { ImageViewThird.image = #imageLiteral(resourceName: "grade_c") } else if grade.grades[3] == "D" { ImageViewThird.image = #imageLiteral(resourceName: "grade_d") } else { ImageViewThird.image = #imageLiteral(resourceName: "grade_f")}
            
            
            
            ClassFourLabel.text = " "
            ImageViewFourth.image = nil
            
        }
        
        
        if course.courseArray.count == 3 {
            ClassOneLabel.text = "\(course.courseArray [1]) \(cred.credits[1])"
            
            ////
            if grade.grades[1] == "A" {
                ImageViewFirst.image = #imageLiteral(resourceName: "grade_a")
            }else if grade.grades[1] == "B" { ImageViewFirst.image = #imageLiteral(resourceName: "grade_b") } else if grade.grades[1] == "C" { ImageViewFirst.image = #imageLiteral(resourceName: "grade_c") } else if grade.grades[1] == "D" { ImageViewFirst.image = #imageLiteral(resourceName: "grade_d") } else { ImageViewFirst.image = #imageLiteral(resourceName: "grade_f")}
            
            ////
            
            ClassTwoLabel.text = "\(course.courseArray[2]) \(cred.credits[2])"
            
            ///
            
            if grade.grades[2] == "A" {
                ImageViewSecond.image = #imageLiteral(resourceName: "grade_a")
            }else if grade.grades[2] == "B" { ImageViewSecond.image = #imageLiteral(resourceName: "grade_b") } else if grade.grades[2] == "C" { ImageViewSecond.image = #imageLiteral(resourceName: "grade_c") } else if grade.grades[2] == "D" { ImageViewSecond.image = #imageLiteral(resourceName: "grade_d") } else { ImageViewSecond.image = #imageLiteral(resourceName: "grade_f")}
            
            
            ///
            
            ClassThreeLabel.text = " "
            ClassFourLabel.text = " "
            ImageViewThird.image = nil
            ImageViewFourth.image = nil
        
        }
        
        if course.courseArray.count == 2 {
            ClassOneLabel.text = "\(course.courseArray[1]) \(cred.credits[1])"
            
            if grade.grades[1] == "A" {
                ImageViewFirst.image = #imageLiteral(resourceName: "grade_a")
            }else if grade.grades[1] == "B" { ImageViewFirst.image = #imageLiteral(resourceName: "grade_b") } else if grade.grades[1] == "C" { ImageViewFirst.image = #imageLiteral(resourceName: "grade_c") } else if grade.grades[1] == "D" { ImageViewFirst.image = #imageLiteral(resourceName: "grade_d") } else { ImageViewFirst.image = #imageLiteral(resourceName: "grade_f")}
            
            
            
            ClassTwoLabel.text = " "
            ClassThreeLabel.text = " "
            ClassFourLabel.text = " "
            ImageViewSecond.image = nil
            ImageViewThird.image = nil
            ImageViewFourth.image = nil
        }
        
        
        if course.courseArray.count == 1 {
            ClassOneLabel.text = " "
            ImageViewFirst.image = nil
            ClassTwoLabel.text = " "
            ImageViewSecond.image = nil
            ClassThreeLabel.text = " "
            ImageViewThird.image = nil
            ClassFourLabel.text = " "
            ImageViewFourth.image = nil
        }
        
        
        
        i = class_to_del!
        
        if class_to_del == 1 && course.courseArray.count == 4 {
            i = 4
        
        }
        
        if class_to_del == 1 && course.courseArray.count == 3 {
            i = 3
            
        }
        
        if class_to_del == 1 && course.courseArray.count == 2 {
            i = 2
            
        }
        
        
        if class_to_del == 2 && course.courseArray.count == 3 {
            i = 3
        }
        
        if class_to_del == 2 && course.courseArray.count == 4 {
            i = 4
        
        }
        
        if class_to_del == 3 && course.courseArray.count == 4 {
            i = 4
        }
        
       // print(i)
 
        
        
        }
        //print(course.courseArray.count)
}
   
  
    
    
    
}

