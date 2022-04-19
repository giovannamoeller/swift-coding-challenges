/*:
 ## Grading Students
 HackerLand University has the following grading policy:
 - Every student receives a grade in the inclusive range from 0 to 100.
 - Any grade less than 40 is a failing grade.
 
 Sam is a professor at the university and likes to round each student's grade according to these rules:
 - If the difference between the grade and the next multiple of 5 is less than 3, round grade up to the next multiple of 5.
 - If the value of grade is less than 38, no rounding occurs as the result will still be a failing grade.
 ### Solution
 */
import UIKit

func gradingStudents(grades: [Int]) -> [Int] {
  var newGrades: [Int] = []
  var gradeTest: Int = 0

  for grade in grades {
    if grade >= 38 {
      gradeTest = grade + (5 - (grade % 5))
      if (gradeTest - grade) < 3 {
        newGrades.append(gradeTest)
      } else {
        newGrades.append(grade)
      }
    } else {
      newGrades.append(grade)
    }
  }
  
  return newGrades
}

gradingStudents(grades: [84, 29, 57])
