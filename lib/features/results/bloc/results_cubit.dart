import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartfit_development/features/results/repository/results_repository.dart';
import 'package:smartfit_development/models/Workout.dart';

part 'results_state.dart';

class ResultsCubit extends Cubit<ResultsState> {
  ResultsCubit({required this.resultsRepository}) : super(const ResultsState());

  final ResultsRepository resultsRepository;

  Future<void> getWorkouts(String userId, {bool isRefresh = false}) async {
    if (!isRefresh) {
      emit(state.copyWith(status: RequestStatus.loading));
    }

    try {
      final List<Workout> results = await resultsRepository.getResults(userId);

      results.sort((a, b) => a.createdAt!.compareTo(b.createdAt!));

      emit(state.copyWith(status: RequestStatus.success, workouts: results));
    } catch (_) {
      emit(state.copyWith(status: RequestStatus.initial, workouts: []));
    }
  }

  Future<void> openWorkout(Workout workout) async {
    emit(state.copyWith(currentWorkout: workout));
  }

  Future<void> initVideo() async {
    emit(state.copyWith(status: RequestStatus.loadingDetails));

    final Uri? video = await resultsRepository.downloadVideo(
        videoId: state.currentWorkout!.id,
        type: state.currentWorkout!.exerciseType.name);

    emit(state.copyWith(video: video, status: RequestStatus.success));
  }
}
