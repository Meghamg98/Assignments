import Foundation

class College {
    var collegeName: String = "Srinivas School of Engineering"
    var collegePhoneNumber = 9876543210
    var address: String = "Mukka, Mangalore"
 
    func admission() {
        //do new student admissions
    }
    
    func studentDetails() {
        //manage all the student realted informations
    }
    
    func placements() {
        //student placements
    }
}

/*
let myCollege = College()
print(myCollege.collegeName)
*/

class Branch: College {
    var branchName: String = "CSE"
    var numberOfLecturers: Int = 10
    var branchCode: String = "CSE2020"
    
    func subjects() {
        // details of the subjects in the department
    }
    
    func branchPerformance() {
        // calculating overall performance of the branch
    }
  
}

/*
let myBranch = Branch()
print(myBranch.branchCode)
print(myBranch.address)
*/

class Lecturer: Branch {
    var lecturerName: String = "Mr. ABC"
    var numberOfStudents: Int = 60
    var degree: String = "MTech"
    
    func subjectsToBeTaken() {
        // details of the subjects to be taught
    }
    
    func lecturerPerformance() {
        // calculating overall performance of individual lecturer
    }
    
    func classesAssigned() {
        // Details about number of classes assigned 
        // Details about number of students to be taught and semester
    }
}

/*
let myLecturer = Lecturer()
print(myLecturer.lecturerName)
print(myLecturer.branchName)
*/

class Student: Branch {
    var studentName: String = "Ms. Megha"
    var semester: Int = 8
    var rollNumber: Int = 038
    var gender: String = "Male"
    
    func subjectsChoosen() {
        // details of the subjects in current semester
        // optional subjects to choose
    }
    
    func studentPerformance() {
        // calculating overall performance of student
        // generating performance graphs
    }
    
    func marks() {
        // details regarding marks in each subject
        // total marks in each semester
    }
} 

let mySelf = Student()
print("----------Student details----------")
print("Name: \(mySelf.studentName)")
print("Roll Number: \(mySelf.rollNumber)")
print("Branch: \(mySelf.branchName)")
print("College: \(mySelf.collegeName)")
print("Address: \(mySelf.address)")
