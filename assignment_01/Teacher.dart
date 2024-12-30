import 'Person.dart';

class Teacher extends Person {
  late String _teacherID;
  late List<String>? _coursesTaught;

  Teacher({
    required String name,
    required int age,
    required String address,
    required String teacherID,
    List<String>? coursesTaught,
  })  : _teacherID = teacherID,
        _coursesTaught = coursesTaught,
        super(
          name: name,
          age: age,
          address: address,
        );

  String get teacherID => _teacherID;
  List<String>? get coursesTaught => _coursesTaught;

  @override
  void displayRole() {
    print('Role: Teacher');
  }

  void displayCoursesTaughtByTeacher() {
    if (_coursesTaught != null) {
      print('Courses taught:');
      for (String course in _coursesTaught!) {
        print('- $course');
      }
    } else {
      print('No courses taught.');
    }
  }

  void displayTeacherInfo() {
    displayRole();
    print('Name: $name\n'
        'Age: $age\n'
        'Address: ${address != null ? address : 'No address'}');
    displayCoursesTaughtByTeacher();
  }
}
