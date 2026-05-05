abstract class Skills {
  void programming();
  void communication();
}

class Person {
  String name;
  int _age;

  Person(this.name, this._age);

  int get age => _age;

  set age(int value) {
    if (value > 0) {
      _age = value;
    } else {
      print('Invalid age.');
    }
  }

  static String universityName = 'Sohag University';
}

class Employee extends Person {
  double salary;

  Employee(String name, int age, this.salary) : super(name, age);

  void showInfo() {
    print('University: ${Person.universityName}');
    print('Name: $name');
    print('Age: $age');
    print('Salary: $salary');
  }
}

class Developer extends Employee implements Skills {
  Developer(String name, int age, double salary) : super(name, age, salary) {
    this.name = name;
    this.salary = salary;
  }

  @override
  void programming() {
    print('Programming skill: Front-End React developer');
  }

  @override
  void communication() {
    print('Communication skill: Good team communication and soft skilles');
  }
}

void main() {
  Developer dev = Developer('Kerolos', 22, 8000);

  dev.showInfo();
  dev.programming();
  dev.communication();
}
