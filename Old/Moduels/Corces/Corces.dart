import 'People.dart';

class Course {
  String title;
  String id;

  DateTime starting;

  List<Teacher> teachers;
  List<Student> inListedStudents;
  List<Lesson> lesson;
  String description;
}

class Lesson {
  String title;
  String id;
  DateTime upLoadedDate;
  List<LessonBlock> lessonBlock;
}

enum LessonBlockEnum { Video, Pdf, Text }

class LessonBlock {
  String name;

  String id;
  String recorcesLink;
  int order;
  LessonBlockEnum x;
  String link;
}

LessonBlock lv1 = LessonBlock()
  ..x = LessonBlockEnum.Video
  ..name = "Lec1 Video"
  ..link = "https://www.youtube.com/watch?v=DnNMJyD7EBY&ab_channel=MrMohamedAbdelMaaboud";
LessonBlock lv2 = LessonBlock()
  ..x = LessonBlockEnum.Video
  ..name = "Lec2 Video"
  ..link = "https://www.youtube.com/watch?v=1NE2NRLen6c&ab_channel=MrMohamedAbdelMaaboud";

Lesson l1 = Lesson()
  ..title = "الفيزياء للثانوية العامة 2021 | المحاضرة 0 | تمهيد"
  ..id = "A1"
  ..upLoadedDate = DateTime.now()
  ..lessonBlock = [lv1];
Lesson l2 = Lesson()
  ..title = " المحاضرة 1 | التيار وفرق الجهد وقانون أوم"
  ..id = "A1"
  ..lessonBlock = [lv1]
  ..upLoadedDate = DateTime.now();

List<Course> coursesList = [
  Course()
    ..title = "فزياء"
    ..id = "1"
    ..lesson = [l1, l2],
];
