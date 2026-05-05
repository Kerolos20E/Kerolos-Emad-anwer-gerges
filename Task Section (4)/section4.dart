void main() {
  Set<String> students = {'Kerolos', 'Emad', 'Anwer'};

  addStudent(students, 'Kariem');
  addStudent(students, 'Kerolos');

  printStudents(students.toList());

  students.forEach((name) => print('• $name'));

  Set<String> newStudents = {'mohammed', 'Youssef', 'Kariem'};
  Set<String> allStudents = {...students, ...newStudents};

  allStudents.forEach((name) => print('• $name'));

  Map<String, Map<String, double>> studentCourses = {};

  addCourse(studentCourses, studentName: 'Kerolos', courseName: 'Math', grade: 88);
  addCourse(studentCourses, studentName: 'Kerolos', courseName: 'Science', grade: 92);
  addCourse(studentCourses, studentName: 'Kerolos', courseName: 'English');
  addCourse(studentCourses, studentName: 'Emad', courseName: 'Math', grade: 75);
  addCourse(studentCourses, studentName: 'Emad', courseName: 'History', grade: 83);
  addCourse(studentCourses, studentName: 'Anwer', courseName: 'Math', grade: 90);
  addCourse(studentCourses, studentName: 'Anwer', courseName: 'Science', grade: 78);


  studentCourses.forEach((student, courses) {
    print('$student: $courses');
  });

  studentCourses.forEach((student, _) {
    double avg = averageGrade(studentCourses, student);
    print('$student → Average: ${avg.toStringAsFixed(2)}');
  });
}

void addStudent(Set<String> students, String name) {
  bool added = students.add(name);
  print(added ? 'Added: $name' : 'Duplicate skipped: $name');
}

void printStudents(List<String> list, [int index = 0]) {
  if (index >= list.length) return;
  print('  ${index + 1}. ${list[index]}');
  printStudents(list, index + 1);
}

void addCourse(
  Map<String, Map<String, double>> studentCourses, {
  required String studentName,
  required String courseName,
  double grade = 0,
}) {
  studentCourses.putIfAbsent(studentName, () => {});
  studentCourses[studentName]![courseName] = grade;
}

double averageGrade(
  Map<String, Map<String, double>> studentCourses,
  String studentName,
) {
  Map<String, double>? courses = studentCourses[studentName];
  if (courses == null || courses.isEmpty) return 0;

  double total = courses.values.reduce((sum, grade) => sum + grade);
  return total / courses.length;
}