part of 'results_cubit.dart';

class ResultsState extends Equatable {
  const ResultsState(
      {this.status = RequestStatus.initial,
      this.workouts = const <Workout>[],
      this.video,
      this.currentWorkout});

  final RequestStatus status;
  final List<Workout> workouts;
  final Uri? video;
  final Workout? currentWorkout;

  @override
  List<Object?> get props => [status, workouts, video, currentWorkout];

  ResultsState copyWith({
    RequestStatus? status,
    List<Workout>? workouts,
    Uri? video,
    Workout? currentWorkout,
  }) {
    return ResultsState(
      status: status ?? this.status,
      video: video ?? this.video,
      currentWorkout: currentWorkout ?? this.currentWorkout,
      workouts: workouts ?? this.workouts,
    );
  }
}

enum RequestStatus { initial, loading, loadingDetails, success }
