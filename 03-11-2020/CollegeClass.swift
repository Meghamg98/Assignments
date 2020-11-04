import Foundation

class Element {
    let name: String
    var address: String = " "
    var phoneNumber: Int = 0
    
    init(name: String, address: String, phoneNumber: Int){
        self.name = name
        self.address = address
        self.phoneNumber = phoneNumber
    }
}

class Person: Element {
    let dateOfBirth: String
    var age: Int = 0
    let gender: String
    
    override init(dateOfBirth: String, age: Int, gender: String){
        self.dateOfBirth = dateOfBirth
        self.age = age
        self.gender = gender
        super.init()
    }
    
    func leavesTaken() {
        // keep track of leaves
    }
}

class University: Element {
    var colleges: [College]
    var numberOfInstitutes: Int = 0
    var type : String
    
    override init(numberOfInstitutes: Int){
        self.numberOfInstitutes = numberOfInstitutes
        self.type = type
        super.init()
    }
    
    func advertisement() {
        // advertise about their institutes and the features provided
    }
}

class College: Element {
    var branches: [Branch]    
    var numberOfBranches: Int = 0
    var course: String
    
    override init(numberOfBranches: Int){
        self.numberOfBranches = numberOfBranches
        self.course = course
        super.init()
    }
    
    func admission() {
        // do admission for the new students
    }
    
    func fest() {
        // festival, anual day and other occassion celebrations
    }
    
    func library() {
        // organising books and updating digital library time to time
    }
    
    func office() {
        // fees collecting, student details 
    }
}

class Branch: Element {
    var students: [Student]
    var lecturers: [Lecturer]
    var HODName: String = " "
    var totalNumberOfStudents: Int = 0
    var totalNumberOfLecturers: Int = 0
    
    override init(HODName: String, totalNumberOfStudents: Int, totalNumberOfLecturers: Int){
        self.HODName = HODName
        self.totalNumberOfStudents = totalNumberOfStudents
        self.totalNumberOfLecturers = totalNumberOfLecturers
        super.init()
    }
    
    func branchActivities() {
        // Programs, quizes and many more activities
    }
    
    func lecturersPerformance() {
        // performance grapgh of each lecturer based on thier subject 
    }
    
    func studentsPerformance() {
        // performance grapgh of each lecturer based on thier subject 
    }
    
    func labs() {
        // equipments, lab room maintainance and other details
    }
    
    func timeTable() {
        // time table according to each class and lecturers
    }
}

class Lecturer: Person {
    let employeeId: String
    var degree: String = " "
    var salary: Int = 0
    var marks: [String: Int]
    
    override init(employeeId: String, degree: String, salary: Int){
        self.employeeId = employeeId
        self.degree = degree
        self.salary = salary
        super.init()
    }
    
    func numberOfSubjects() {
        // details of the subjects to be taken by individual lecturer
    }
    
    func numberOfClasses() {
        // details of the classes/hours to be taken by individual lecturer
    }
    
    func attendance() {
        // attendance given to each student for their class
    }
    
    func marksGiven() {
        // marks given to each student based on the subject they teach
    }
    
    private func salaryDetails() {
        // salary calculation according to classes taken and leaves taken
    }
}

class Student: Person {
    let usn: String
    var semester: Int = 1
    var marks: [String: Int]
    
    override init(usn: String, semester: Int){
        self.usn = usn
        self.semester = semester
        super.init()
    }
    
    func attendance() {
        // attendance obtained in each subject classes
    }
    
    func marksObtained() {
        // marks obtained in each subject 
    }

    func achievements() {
        // student achievements in various activities
    }
}
