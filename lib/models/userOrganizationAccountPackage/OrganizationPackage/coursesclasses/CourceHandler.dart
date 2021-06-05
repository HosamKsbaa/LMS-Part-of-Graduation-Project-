import './course.dart';

class CourseHandler{
  List<Course> currentCourses;
  List<Course> archivedCourses;

  //Constructor
  CourseHandle(List<Course> currentCourses,
  List<Course> archivedCourses){
    this.currentCourses =currentCourses;
    this.archivedCourses =archivedCourses;
  }
}