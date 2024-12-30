import 'Student.dart';
import 'Teacher.dart';

void main() {
  Student student1 = Student(
    studentId: "ST-01",
    name: "John Doe",
    age: 20,
    address: "123 Main Stree",
    grade: 3.00,
    courseScroes: [90, 85, 82],
  );
  Teacher teacher1 = Teacher(
      teacherID: "TE-01",
      name: "Mrs. Smith",
      age: 35,
      address: "456 Oak St",
      coursesTaught: ["Math", "English", "Bangla"]);

  student1.displayRole();
  teacher1.displayRole();
  print("\n");
  student1.displayStudentInfo();
  teacher1.displayTeacherInfo();
}
