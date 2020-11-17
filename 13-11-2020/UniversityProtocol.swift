import Foundation

class University {
	var name: String
	var address: String
	var colleges: [SendUniversityProtocol & ReceiveUniversityProtocol]

	init(name: String, address: String) {
		self.name = name
		self.address = address
		self.colleges = [SendUniversityProtocol & ReceiveUniversityProtocol]()
	}

	func addCollege(collegeName: College) {
		self.colleges.append(collegeName)
	}

	func sendExamTimetable(tt: [String: String]) {
		for college in colleges {
			college.examTimetable(timeTable: tt)
		}
	}

	func sendHolidayList(days: [String: String]) {
		for college in colleges {
			college.holidaylist(holidays: days)
		}
	}
	
	func requests()  {
	    for college in colleges {
			print(college.requests())
		}
	}
}

class College {
	var name: String
	var branches: [SendCollegeProtocol & RecieveCollegeProtocol]
	var timeTable: [String: String]
	var holidays: [String: String]
	weak var university: University?

	init(name: String) {
		self.name = name
		self.branches = [SendCollegeProtocol & RecieveCollegeProtocol]()
		self.timeTable = [String: String]()
		self.holidays = [String: String]()
	}

	func addBranch(branchName: Branch) {
		branches.append(branchName)
	}
	
	func sendFestivalDetails(fest: [String: String]) {
	    for branch in branches {
			branch.festivalDetails(date: fest)
		}
	}
	
	func sendCircular(message: String) {
		for branch in branches {
			branch.circular(notice:message )
		}
	}

	func numberOfLab() {
        for branch in branches {
            print(branch.numberOfLab())
        }
    }
}

extension College: SendUniversityProtocol {
	func examTimetable(timeTable: [String: String]) {
		print("Exam timetable for \(self.name) is \n\(timeTable) \n")
	}

	func holidaylist(holidays: [String: String]) {
		print("Holiday list for \(self.name) is ")
		print("\(holidays) \n")
	}
}

extension College: ReceiveUniversityProtocol {
    func requests() -> String {
        return "College \(self.name) have requested for lab examination dates and syllabus copy"
    }
}

class Branch  {
	var name: String
	var students: [SendBranchProtocol & ReceiveBranchProocol]
	var numberOfLabs: Int 
	weak var college: College?

	init(name: String, numberOfLabs: Int) {
		self.name = name
        self.numberOfLabs = numberOfLabs
		self.students = [SendBranchProtocol & ReceiveBranchProocol]()
	}

	func addStudent(studentName: Student) {
		students.append(studentName)
	}

	func conductInternalExam(day: [String: String]) {
		for student in students {
			student.internalExam(date: day)
		}
	}

	func otherProgramsOrActivities(activity: String) {
		for student in students {
			student.programs(description: activity)
		}
	}

	func assignments() { 
        for student in students {
            print(student.assignments())
        }
    }

    func projectReport() {
        for student in students {
            print(student.projectReport())
        }
    }
	
}

extension Branch: SendCollegeProtocol {
	func festivalDetails(date: [String: String]) {
		print("The \(self.name) department will have following function")
		print("\(date) \n")
	}

	func circular(notice: String) {
		print("The circular for \(self.name) department:")
		print("\(notice) \n")
	}
}

extension Branch: RecieveCollegeProtocol {
	func numberOfLab() -> Int {
        return numberOfLabs
    }
}

class Student  {
	var name: String
	var usn: String
	var assignment: String
    var report: String
	weak var branch: Branch?

	init(name: String, usn: String, assignment: String, report: String) {
		self.name = name
		self.usn = usn
		self.assignment = assignment
		self.report = report
	}
	
}

extension Student: SendBranchProtocol {
	func internalExam(date: [String: String]) {
		print("Hi \(self.name), you have internal exam on :")
		print("\(date) \n")
	}

	func programs(description: String) {
		print("Hi \(self.name), you are invited :\n \(description) \n")
	}
}

extension Student: ReceiveBranchProocol {
	func assignments() -> String {
        return "Student: \(self.name) have submitted assignment-  \(assignment)"
    }

    func projectReport() -> String {
        return "Student: \(self.name) have submitted report- \(report)"
    }
}

/*---------------------------------------------------------------*/

protocol SendUniversityProtocol {
	func examTimetable(timeTable: [String: String])
	func holidaylist(holidays: [String: String])
}

protocol ReceiveUniversityProtocol {
    func requests() -> String
}


protocol SendCollegeProtocol {
	func festivalDetails(date: [String: String])
	func circular(notice: String)
}

protocol RecieveCollegeProtocol {
    func numberOfLab() -> Int
}


protocol SendBranchProtocol {
	func internalExam(date: [String: String])
	func programs(description: String)
}

protocol ReceiveBranchProocol {
    func assignments() -> String
    func projectReport() -> String
}

/*---------------------------------------------------------------*/
let university1 = University(name: "VTU", address: "Belgam")

let college1 = College(name: "SSE")
let college2 = College(name: "SIT")

let branch1 = Branch(name: "CSE", numberOfLabs: 13)
let branch2 = Branch(name: "CV", numberOfLabs: 10)
let branch3 = Branch(name: "EC", numberOfLabs: 17)
let branch4 = Branch(name: "ME", numberOfLabs: 14)

let student1 = Student(name:"Megha", usn:"4ES16CS038", assignment: "Assignment1", report: "Report1")
let student2 = Student(name:"Manya", usn:"4ES17CV046", assignment: "Assignment2", report: "Report2")

let student3 = Student(name:"Aryav", usn:"4ST19EC005", assignment: "Assignment3", report: "Report3")
let student4 = Student(name:"Amar", usn:"4ST18ME021", assignment: "Assignment4", report: "Report4")

/*---------------------------------------------------------------*/
university1.addCollege(collegeName: college1)
university1.addCollege(collegeName: college2)

college1.addBranch(branchName: branch1)
college1.addBranch(branchName: branch2)

college2.addBranch(branchName: branch3)
college2.addBranch(branchName: branch4)

branch1.addStudent(studentName: student1)
branch2.addStudent(studentName: student2)
branch3.addStudent(studentName: student3)
branch4.addStudent(studentName: student4)

/*---------------------------------------------------------------*/

university1.sendExamTimetable(tt: ["OOP": "25/11/2020", "C++": "27/11/2020"])
university1.sendHolidayList(days: ["14/11/2020": "Diwali","25/12/2020": "Chrismas"])


college1.sendFestivalDetails(fest: ["Diwali": "17/11/2020"])
college1.sendCircular(message: "There will be no classes on 17th Novemeber 2020 ")

branch1.conductInternalExam(day: ["18/11/2020": "OOP", "19/11/2020": "C++"])
branch1.otherProgramsOrActivities(activity: "There will be a quiz competition on 23/11/2020")

branch2.conductInternalExam(day: ["18/11/2020": "OOP", "19/11/2020": "C++"])
branch2.otherProgramsOrActivities(activity: "There will be a quiz competition on 23/11/2020")


college2.sendFestivalDetails(fest: ["Founders Day": "20/11/2020"])
college2.sendCircular(message: "All the students are here by requested to attend the Founder's day")

branch3.conductInternalExam(day: ["18/11/2020": "OOP", "19/11/2020": "C++"])
branch3.otherProgramsOrActivities(activity: "There will be a quiz competition on 23/11/2020")

branch4.conductInternalExam(day: ["18/11/2020": "OOP", "19/11/2020": "C++"])
branch4.otherProgramsOrActivities(activity: "There will be a quiz competition on 23/11/2020")

university1.requests()
college1.numberOfLab()
branch3.assignments()
branch4.projectReport()
