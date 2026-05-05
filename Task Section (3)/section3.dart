import 'dart:io';

void main() {
  List<String> names = [];
  List<List<double>> allGrades = [];

  int? numStudents = readInt('Enter number of students: ');
  if (numStudents == null || numStudents <= 0) {
    print('Invalid number of students.');
    return;
  }

  for (int i = 0; i < numStudents; i++) {
    print('\n--- Student ${i + 1} ---');

    stdout.write('Enter student name: ');
    String? name = stdin.readLineSync()?.trim();
    if (name == null || name.isEmpty) {
      print('Invalid name. Skipping student.');
      i--;
      continue;
    }

    int? numSubjects = readInt('Enter number of subjects: ');
    if (numSubjects == null || numSubjects <= 0) {
      print('Invalid number of subjects. Skipping student.');
      i--;
      continue;
    }

    List<double> grades = [];
    for (int j = 0; j < numSubjects; j++) {
      double? grade = readDouble('  Enter grade for subject ${j + 1}: ');
      if (grade == null || grade < 0 || grade > 100) {
        print('  Invalid grade. Must be between 0 and 100.');
        j--;
        continue;
      }
      grades.add(grade);
    }

    names.add(name);
    allGrades.add(grades);
  }

  while (true) {
    print('\n MENU ');
    print('1. Show All Results');
    print('2. Search Student');
    print('3. Exit');

    int? choice = readInt('Choose an option: ');

    if (choice == null) {
      print('Invalid input. Please enter 1, 2, or 3.');
      continue;
    }

    switch (choice) {
      case 1:
        if (names.isEmpty) {
          print('No students found.');
          break;
        }
        print('\n-- All Results --');
        for (int i = 0; i < names.length; i++) {
          double avg = calculateAverage(allGrades[i]);
          double rounded = double.parse(avg.toStringAsFixed(2));
          String grade = getLetterGrade(avg);
          print('Name    : ${names[i].toUpperCase()}');
          print('Average : $rounded');
          print('Grade   : $grade');
          print('--------------------------------');
        }
        break;

      case 2:
        stdout.write('Enter student name to search: ');
        String? searchName = stdin.readLineSync()?.trim().toLowerCase();
        if (searchName == null || searchName.isEmpty) {
          print('Invalid input.');
          break;
        }
        int index = names.indexWhere((n) => n.toLowerCase() == searchName);
        if (index == -1) {
          print('Student "$searchName" not found.');
        } else {
          double avg = calculateAverage(allGrades[index]);
          int rounded = avg.round();
          print('Student : ${names[index]}');
          print('Average : $rounded');
        }
        break;

      case 3:
        print('Exiting program. Goodbye!');
        return;

      default:
        print('Invalid option. Please choose 1, 2, or 3.');
    }
  }
}

double calculateAverage(List<double> grades) {
  if (grades.isEmpty) return 0;
  double sum = grades.fold(0, (prev, g) => prev + g);
  return sum / grades.length;
}

String getLetterGrade(double avg) {
  if (avg >= 90) return 'A';
  if (avg >= 80) return 'B';
  if (avg >= 70) return 'C';
  return 'F';
}

int? readInt(String prompt) {
  stdout.write(prompt);
  String? input = stdin.readLineSync()?.trim();
  return int.tryParse(input ?? '');
}

double? readDouble(String prompt) {
  stdout.write(prompt);
  String? input = stdin.readLineSync()?.trim();
  return double.tryParse(input ?? '');
}
