class PartMark{
  String head;
  double totalmarks;
  double studentmarks;
  Duration totaldurationallowed;
  Duration studentDuration;
  String studentId;

  //Constructor
  PartMark({String head,
  double totalmarks,
  double studentmarks,
  Duration totaldurationallowed,
  Duration studentDuration,
  String studentId}){
    this.head=head;
    this.studentDuration=studentDuration;
    this.studentId=studentId;
    this.studentmarks=studentmarks;
    this.totaldurationallowed=totaldurationallowed;
    this.totalmarks=totalmarks;
  }

}