part of 'workout_cubit.dart';

class WorkoutState extends Equatable {
  final String userId;

  const WorkoutState({this.userId = ''});

  @override
  List<Object> get props => [userId];

  WorkoutState copyWith({String? userId}) {
    return WorkoutState(userId: userId ?? this.userId);
  }
}
