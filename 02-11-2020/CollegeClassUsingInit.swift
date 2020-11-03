import Foundation

class College {
    var collegeName: String
    var address: String
    
    init() {
        self.collegeName = "Srinivas School of Enginering"
        self.address = "Mangalore "
    }
    
    func admission() {
        //do new student admissions
    }
    
    func studentDetails() {
        //manage all the student related informations
    }
    
    func placements() {
        //student placements
    }
}

class Branch: College {
    var branchName: String
    var numberOfLecturers: Int 
    var branchCode: String

    override init() {
        self.branchName = "CSE"
        self.numberOfLecturers = 10
        self.branchCode = "CSE2020"
    }
    
    func subjects() {
        // details of the subjects in the department
    }
    
    func branchPerformance() {
        // calculating overall performance of the branch
    }
}

class Lecturer: Branch {
    var lecturerName: String
    var numberOfStudents: Int 
    var degree: String 

    override init() {
        self.lecturerName = "Mr.ABC"
        self.numberOfStudents = 60
        self.degree = "MTech"
    }
    
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

class Student: Branch {
    var studentName:String = " "
    var semester: Int 
    var rollNumber: Int 
    var gender: String 
    
    override init() {
        self.studentName = "Megha"
        self.semester = 8
        self.rollNumber = 038
        self.gender = "Female"    
    }
    
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
