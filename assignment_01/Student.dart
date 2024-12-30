import 'Person.dart';

class Student extends Person {
  final String _studentId;
  final double _grade;
  final List<double> _courseScroes;

  Student(
      {required String studentId,
      required double grade,
      required List<double> courseScroes,
      required String name,
      required int age,
      String? address})
      : _studentId = studentId,
        _grade = grade,
        _courseScroes = courseScroes,
        super(
          name: name,
          age: age,
          address: address,
        );

  String get studentId => _studentId;
  double get grade => _grade;
  List<double> get courseScroes => _courseScroes;
  @override
  void displayRole() {
    print('Role: Student');
  }

  void displayStudentInfo() {
    displayRole();
    print('Name: $name\n'
        'Age: $age\n'
        'Grade: $_grade\n'
        'Address: ${address != null ? address : 'No address'}\n'
        'Course Scores: ${calculateAverageScore()}\n');
  }

  double calculateAverageScore() {
    double totalScore = 0;
    for (double score in _courseScroes) {
      totalScore += score;
    }
    return double.parse((totalScore / _courseScroes.length).toStringAsFixed(2));
  }
}
