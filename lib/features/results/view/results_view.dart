import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartfit_development/app/utils/workout_helper.dart';
import 'package:smartfit_development/features/results/bloc/results_cubit.dart';
import 'package:smartfit_development/features/results/view/workout_details_view.dart';
import 'package:smartfit_development/features/settings/bloc/settings_cubit.dart';
import 'package:smartfit_development/models/Status.dart';

class ResultsView extends StatelessWidget {
  const ResultsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResultsCubit, ResultsState>(builder: (context, state) {
      if (state.status == RequestStatus.loading) {
        return const Center(child: CircularProgressIndicator());
      }

      return RefreshIndicator(
        onRefresh: () => context.read<ResultsCubit>().getWorkouts(
            context.read<SettingsCubit>().state.userId,
            isRefresh: true),
        child: ListView.builder(
            itemCount: state.workouts.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 2.5),
                child: Card(
                  elevation: 2,
                  child: ListTile(
                    onTap: () {
                      context
                          .read<ResultsCubit>()
                          .openWorkout(state.workouts[index]);

                      Navigator.of(context)
                          .pushNamed(WorkoutDetailsView.routeName);
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    tileColor: Colors.white,
                    title: Text(exerciseTypeToString(
                        state.workouts[index].exerciseType)),
                    subtitle: Text(state.workouts[index].processing_status ==
                            Status.completed
                        ? 'Completed'
                        : 'In progress'),
                    trailing: state.workouts[index].processing_status ==
                            Status.inProgress
                        ? const CircularProgressIndicator()
                        : null,
                  ),
                ),
              );
            }),
      );
    });
  }
}
