import 'dart:math';

void main() {
  final random = Random();
  final int degree = random.nextInt(101);
  print('Generated Degree: $degree');
  print('Grade: ${getGrade(degree)}');
}

String getGrade(int degree) {
  if (degree >= 90) {
    return 'A   Excellent';
  } else if (degree >= 80) {
    return 'B   Very Good';
  } else if (degree >= 70) {
    return 'C   Good';
  } else if (degree >= 60) {
    return 'D  Pass';
  } else {
    return 'F   Fail';
  }
}
