import 'package:assignment/student.dart';
import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

dynamic database;
insertStudentData(Student objs) async {
  Database localDB = await database;
  localDB.insert("Record", objs.studentMap(),
      conflictAlgorithm: ConflictAlgorithm.replace);
}

updatedStudentData(Student objupdate) async {
  Database localDB = await database;
  await localDB.update(
    "Record",
    objupdate.studentMap(),
    where: "studentID=?",
    whereArgs: [objupdate.studentID],
  );
}

Future<List<Map>> getOrderData() async {
  Database localDB = await database;
  List<Map<String, dynamic>> orderMap = await localDB.query("Record");
  return orderMap;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  database = openDatabase(
    join(await getDatabasesPath(), "StudentDB.db"),
    version: 1,
    onCreate: (db, version) {
      db.execute('''
      create table Record(
      studentID INT PRIMARY KEY,
      studentname TEXT,
      department TEXT,
      subject TEXT,
      marks INT
      )''');
    },
  );
  Student obj1 = Student(
      studentID: 101,
      studentname: 'Sanket',
      department: "compter",
      subject: "TOC",
      marks: 20);

  Student obj2 = Student(
      studentID: 102,
      studentname: 'Aniket',
      department: "IT",
      subject: "OS",
      marks: 35);
  insertStudentData(obj1);
  // print(await getOrderData());
  insertStudentData(obj2);
  print(await getOrderData());

  
  obj2 = Student(
    studentID: 110,
    studentname: 'Aniket',
    department: "comp",
    subject: "${obj2.subject},hci",
    marks: obj2.marks + 30,
  );

  updatedStudentData(obj2);
  print(await getOrderData());
}
