import 'package:lms/models/userOrganizationAccountPackage/OrganizationPackage/coursesclasses/coursematerialPackage/exercisePackage/PartMarkPackage/exerciseSection.dart';

abstract class AbstractExercise {
  ExerciseSection exerciseSection;

//Constructor
  AbstractExercise(ExerciseSection exerciseSection) {
    this.exerciseSection = exerciseSection;
  }
}
