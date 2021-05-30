import 'package:lms/models/userOrganizationAccountPackage/OrganizationPackage/coursesclasses/coursematerialPackage/exercisePackage/PartMarkPackage/PartMark.dart';
import 'package:lms/models/userOrganizationAccountPackage/OrganizationPackage/coursesclasses/coursematerialPackage/exercisePackage/PartMarkPackage/questionPackage/Question.dart';

class ExerciseSection extends PartMark {
  String instructions;
  List<Question> questions;

  //Constructor
  ExerciseSection({
    String instructions,
    List<Question> questions,
  }) {
    this.instructions = instructions;
    this.questions = questions;
  }
}
