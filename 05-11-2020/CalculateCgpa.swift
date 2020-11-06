//Create University
//Create 2 colleges and store the colleges inside University

//Create branches for the colleges and add it into the array of branches in the college
//Create 3 students per branch and store it in the branch. The storage should be done via the admin() function
//Add marks for each student
//Student should be able to fetch the CGPA based on his marks.

import Foundation

class Entity {
    var name: String
    var address: String
    var phoneNumber: Int

    init(name: String, address: String, phoneNumber: Int) {
        self.name = name
        self.address = address
        self.phoneNumber = phoneNumber
    }
}

class Person {
    var personDetails: Entity
    let dateOfBirth: String
    var age: Int 
    let gender: String
    
    init(dateOfBirth: String, age: Int, gender: String, personDetails: Entity){
        self.dateOfBirth = dateOfBirth
        self.age = age
        self.gender = gender
        self.personDetails = personDetails
    }
    
    func leavesTaken() {
        // keep track of leaves
    }
}

class University {
    var universityDetails: Entity
    var typeOfInstitute : String
    var colleges = [College]()
    
    init(typeOfInstitute: String, universityDetails: Entity) {
        self.typeOfInstitute = typeOfInstitute
        self.universityDetails = universityDetails
    }

    func admin(collegeDetails: College) {
        //adding college to university
        colleges.append(collegeDetails)
    }
    func advertisement() {
        // advertise about their institutes and the features provided
    }

    func locationAndFeatures() {
        //location of various institutes under the univeristy and their features
    }
}

class College {
    var collegDetails: Entity
    var branches = [Branch]()    
    var courseOffered: String
    
    init(courseOffered: String, collegDetails: Entity){
        self.courseOffered = courseOffered
        self.collegDetails = collegDetails
    }
    
    func addBranches(branchDetails: Branch) {
        // adding branches to college
        branches.append(branchDetails)
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

class Branch {
    var branchDetails: Entity
    var students = [Student]()
    var nameOfHod: String 
    
    init(nameOfHod: String, branchDetails: Entity){
        self.nameOfHod = nameOfHod
        self.branchDetails = branchDetails
    }
    
    func addStudents(studentDetails: Student) {
        // adding students to college
        students.append(studentDetails)
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

class Student {
    var studentDetails: Person
    let usn: String
    var semester: Int 
    var marks = [MarksOfStudent]()
    
    init(usn: String, semester: Int, studentDetails: Person) {
        self.usn = usn
        self.semester = semester
        self.studentDetails = studentDetails
    }
    
    func marksObtained(markDetails: MarksOfStudent) {
        marks.append(markDetails)
    }

    func cgpaCalculation() -> Int {
        var total = 0
        var cgpa = 0
		var marksArray = [Int]()

        for (_, value) in marks.enumerated() {
			for (_, value) in value.marksInEachSubject {
				marksArray.append(value)
			}
        }

		for value in marksArray {
            total += value
        }
        cgpa = (total / (marksArray.count)) / 9

        return cgpa
    }

    func attendance() {
        // attendance obtained in each subject classes
    }
    
    func achievements() {
        // student achievements in various activities
    }      
}

class MarksOfStudent {
    var marksInEachSubject = [String: Int]()

    init(marksInEachSubject: [String: Int]) {
        self.marksInEachSubject = marksInEachSubject
    }   
}

//Creating University
var university = University(typeOfInstitute: "Private", universityDetails: Entity(name: "Srinivas University", address: "Mangalore", phoneNumber:08202561294))

//Creating 1st college
var college1 = College(courseOffered: "B.E", collegDetails: Entity(name: "SSE", address: "Mukka, Mangalore", phoneNumber:08202571673))

//Creating 1st branch along with 3 student details
var branch1 = Branch(nameOfHod: "Mr.Abhijith", branchDetails: Entity(name: "CSE", address: "Block 1", phoneNumber:08202526437))

var student1 = Student(usn: "4ES16CS038", semester: 8, studentDetails: Person(dateOfBirth: "19/09/1998", age: 22, gender: "Female", personDetails: Entity(name: "Megha", address: "Udupi", phoneNumber: 9876543210)))
var student2 = Student(usn: "4ES18CS049", semester: 4, studentDetails: Person(dateOfBirth: "28/04/2000", age: 20, gender: "Male", personDetails: Entity(name: "Amar", address: "Mangalore", phoneNumber: 9753124680)))
var student3 = Student(usn: "4ES17CS064", semester: 6, studentDetails: Person(dateOfBirth: "15/11/1999", age: 21, gender: "Female", personDetails: Entity(name: "Aksha", address: "Bangalore", phoneNumber: 8642097531)))

//Creating 2nd branch along with 3 student details
var branch2 = Branch(nameOfHod: "Mr.Sudesh", branchDetails: Entity(name: "ECE", address: "Block 2", phoneNumber:08202545632))

var student4 = Student(usn: "4ES18EC001", semester: 4, studentDetails: Person(dateOfBirth: "01/02/2000", age: 20, gender: "Female", personDetails: Entity(name: "Manya", address: "Udupi", phoneNumber: 91065765432)))
var student5 = Student(usn: "4ES117EC002", semester: 6, studentDetails: Person(dateOfBirth: "21/06/1999", age: 21, gender: "Male", personDetails: Entity(name: "Aaryav", address: "Bangalore", phoneNumber: 9762474611)))
var student6 = Student(usn: "4ES16EC003", semester: 8, studentDetails: Person(dateOfBirth: "11/01/1998", age: 22, gender: "Female", personDetails: Entity(name: "Ankitha", address: "Mysore", phoneNumber: 96274514545)))

//Creating marks
var mark1 = MarksOfStudent(marksInEachSubject: ["Phy": 90, "Chem": 72])
var mark2 = MarksOfStudent(marksInEachSubject: ["Phy": 65, "Chem": 68])
var mark3 = MarksOfStudent(marksInEachSubject: ["Phy": 49, "Chem": 35])
var mark4 = MarksOfStudent(marksInEachSubject: ["Maths": 77, "Lab": 74])
var mark5 = MarksOfStudent(marksInEachSubject: ["Maths": 95, "Lab": 78])
var mark6 = MarksOfStudent(marksInEachSubject: ["Maths": 86, "Lab": 82])


//Creating 2nd college
var college2 = College(courseOffered: "B.E", collegDetails: Entity(name: "SIT", address: "Valacchil, Mangalore", phoneNumber:08202520011))

//Creating 1st branch along with 3 student details
var branch3 = Branch(nameOfHod: "Mrs.Shifana", branchDetails: Entity(name: "CSE", address: "Block 7", phoneNumber:08202521237))

var student7 = Student(usn: "4ES16CS010", semester: 8, studentDetails: Person(dateOfBirth: "22/03/1998", age: 22, gender: "Female", personDetails: Entity(name: "Megha", address: "Udupi", phoneNumber: 9876543210)))
var student8 = Student(usn: "4ES18CS077", semester: 4, studentDetails: Person(dateOfBirth: "09/12/2000", age: 20, gender: "Male", personDetails: Entity(name: "Amar", address: "Mangalore", phoneNumber: 9753124680)))
var student9 = Student(usn: "4ES17CS096", semester: 6, studentDetails: Person(dateOfBirth: "29/01/1999", age: 21, gender: "Female", personDetails: Entity(name: "Aksha", address: "Bangalore", phoneNumber: 8642097531)))

//Creating 2nd branch along with 3 student details
var branch4 = Branch(nameOfHod: "Mr.Santhosh", branchDetails: Entity(name: "ECE", address: "Block 5", phoneNumber:08202565632))

var student10 = Student(usn: "4ES18EC062", semester: 4, studentDetails: Person(dateOfBirth: "08/09/2000", age: 20, gender: "Male", personDetails: Entity(name: "Ananth", address: "Shimoga", phoneNumber: 8970082930)))
var student11 = Student(usn: "4ES17EC035", semester: 6, studentDetails: Person(dateOfBirth: "02/08/1999", age: 21, gender: "Male", personDetails: Entity(name: "Ankush", address: "Madikeri", phoneNumber: 9751735856)))
var student12 = Student(usn: "4ES16EC091", semester: 8, studentDetails: Person(dateOfBirth: "10/10/1998", age: 22, gender: "Female", personDetails: Entity(name: "Ananya", address: "Puttur", phoneNumber: 9825738451)))

//Creating marks
var mark7 = MarksOfStudent(marksInEachSubject: ["Phy": 75, "Chem": 65])
var mark8 = MarksOfStudent(marksInEachSubject: ["Phy": 57, "Chem": 87])
var mark9 = MarksOfStudent(marksInEachSubject: ["Phy": 68, "Chem": 67])
var mark10 = MarksOfStudent(marksInEachSubject: ["Maths": 78, "Lab": 98])
var mark11 = MarksOfStudent(marksInEachSubject: ["Maths": 77, "Lab": 89])
var mark12 = MarksOfStudent(marksInEachSubject: ["Maths": 97, "Lab": 67])


//College1 details
university.admin(collegeDetails: college1)

college1.addBranches(branchDetails: branch1)
branch1.addStudents(studentDetails: student1)
branch1.addStudents(studentDetails: student2)
branch1.addStudents(studentDetails: student3)

student1.marksObtained(markDetails: mark1)
student2.marksObtained(markDetails: mark2)
student3.marksObtained(markDetails: mark3)

college1.addBranches(branchDetails: branch2)
branch2.addStudents(studentDetails: student4)
branch2.addStudents(studentDetails: student5)
branch2.addStudents(studentDetails: student6)

student4.marksObtained(markDetails: mark4)
student5.marksObtained(markDetails: mark5)
student6.marksObtained(markDetails: mark6)

//College2 details
university.admin(collegeDetails: college2)

college2.addBranches(branchDetails: branch3)
branch3.addStudents(studentDetails: student7)
branch3.addStudents(studentDetails: student8)
branch3.addStudents(studentDetails: student9)

student7.marksObtained(markDetails: mark7)
student8.marksObtained(markDetails: mark8)
student9.marksObtained(markDetails: mark9)

college2.addBranches(branchDetails: branch4)
branch4.addStudents(studentDetails: student10)
branch4.addStudents(studentDetails: student11)
branch4.addStudents(studentDetails: student12)

student10.marksObtained(markDetails: mark10)
student11.marksObtained(markDetails: mark11)
student12.marksObtained(markDetails: mark12)


var myCgpa = student2.cgpaCalculation()
print(myCgpa)
