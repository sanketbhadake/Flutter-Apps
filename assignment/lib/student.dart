class Student {
  int studentID;
  String studentname;
  String department;
  String subject;
  int marks;

  Student(
      {required this.studentID,
      required this.studentname,
      required this.department,
      required this.subject,
      required this.marks
      });
      Map<String, dynamic> studentMap() {
  return {
    'studentID': studentID,
    'studentname': studentname,
    'department': department,
    'subject': subject,
    'marks': marks
  };
}
}


