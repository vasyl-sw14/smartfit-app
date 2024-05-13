import 'package:smartfit_development/models/ExerciseType.dart';
import 'package:smartfit_development/models/Workout.dart';

String exerciseTypeToString(ExerciseType type) {
  switch (type) {
    case ExerciseType.squats:
      return 'Squats';
    case ExerciseType.armRaises:
      return 'Arm raises';
    case ExerciseType.pushUps:
      return 'Push ups';
    case ExerciseType.overheadPress:
      return 'Overhead press';
    default:
      return 'Squats';
  }
}

double accuracy(Workout workout) {
  if (workout.estimation_top != null && workout.estimation_bottom != null) {
    final double top = workout.estimation_top!.reduce((a, b) => a + b) /
        workout.estimation_top!.length;
    final double bottom = workout.estimation_bottom!.reduce((a, b) => a + b) /
        workout.estimation_bottom!.length;

    return (top + bottom) / 2;
  } else {
    return 0;
  }
}
