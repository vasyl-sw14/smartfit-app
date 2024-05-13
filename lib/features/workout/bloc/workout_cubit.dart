import 'dart:typed_data';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartfit_development/features/workout/repository/workout_repository.dart';
import 'package:smartfit_development/models/ExerciseType.dart';
import 'package:smartfit_development/models/Status.dart';
import 'package:smartfit_development/models/Workout.dart';

part 'workout_state.dart';

class WorkoutCubit extends Cubit<WorkoutState> {
  WorkoutCubit({required this.workoutRepository}) : super(const WorkoutState());

  final WorkoutRepository workoutRepository;

  Future<void> uploadVideo(
      {required String userId,
      required UploadType uploadType,
      required ExerciseType type}) async {
    final Uint8List? video;

    if (uploadType == UploadType.gallery) {
      video = await workoutRepository.chooseVideoFromGallery();
    } else if (uploadType == UploadType.camera) {
      video = await workoutRepository.recordVideo();
    } else {
      video = await workoutRepository.downloadPublicVideo();
    }

    final Workout workout = Workout(
        exerciseType: type,
        userId: userId,
        processing_status: Status.inProgress);

    final request = ModelMutations.create(workout);

    final response = await Amplify.API.mutate(request: request).response;

    final String? id = response.data?.id;

    if (id != null && video != null) {
      final AWSFile file = AWSFile.fromData(video);

      final result = await Amplify.Storage.uploadFile(
              localFile: file, key: '${type.name}/$id.mp4')
          .result;

      debugPrint('Key: ${result.uploadedItem.key}');
    }
  }
}

enum UploadType { test, gallery, camera }
