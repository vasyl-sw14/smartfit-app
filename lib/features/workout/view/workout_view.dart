import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartfit_development/features/settings/bloc/settings_cubit.dart';
import 'package:smartfit_development/features/workout/bloc/workout_cubit.dart';
import 'package:smartfit_development/models/ExerciseType.dart';
import 'package:smartfit_development/models/ModelProvider.dart';

class WorkoutView extends StatelessWidget {
  const WorkoutView({Key? key}) : super(key: key);

  Future<void> showSelection(
      {required BuildContext context, required ExerciseType type}) async {
    showModalBottomSheet(
        context: context,
        builder: (context) => SizedBox(
              width: double.maxFinite,
              child: SafeArea(
                top: false,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 10),
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blueAccent),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.white)),
                        onPressed: () {
                          context.read<WorkoutCubit>().uploadVideo(
                              uploadType: UploadType.camera,
                              userId:
                                  context.read<SettingsCubit>().state.userId,
                              type: type);
                        },
                        child: const Text('Record live video')),
                    const SizedBox(height: 10),
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blueAccent),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.white)),
                        onPressed: () {
                          context.read<WorkoutCubit>().uploadVideo(
                              uploadType: UploadType.gallery,
                              userId:
                                  context.read<SettingsCubit>().state.userId,
                              type: type);
                        },
                        child: const Text('Upload video from gallery')),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Card(
                elevation: 2,
                child: ListTile(
                  onTap: () {
                    showSelection(context: context, type: ExerciseType.squats);
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  tileColor: Colors.white,
                  title: const Text('Squats'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Card(
                elevation: 2,
                child: ListTile(
                  onTap: () {
                    showSelection(
                        context: context, type: ExerciseType.overheadPress);
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  tileColor: Colors.white,
                  title: const Text('Overhead press'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Card(
                elevation: 2,
                child: ListTile(
                  onTap: () {
                    showSelection(context: context, type: ExerciseType.pushUps);
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  tileColor: Colors.white,
                  title: const Text('Push ups'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Card(
                elevation: 2,
                child: ListTile(
                  onTap: () {
                    showSelection(
                        context: context, type: ExerciseType.armRaises);
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  tileColor: Colors.white,
                  title: const Text('Front delta raises'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
