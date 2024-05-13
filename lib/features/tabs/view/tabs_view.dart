import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartfit_development/features/results/bloc/results_cubit.dart';
import 'package:smartfit_development/features/results/view/results_view.dart';
import 'package:smartfit_development/features/settings/bloc/settings_cubit.dart';
import 'package:smartfit_development/features/tabs/bloc/tabs_cubit.dart';
import 'package:smartfit_development/features/workout/view/workout_view.dart';

class TabsView extends StatefulWidget {
  const TabsView({Key? key}) : super(key: key);

  static const String routeName = '/';

  @override
  State<TabsView> createState() => _TabsViewState();
}

class _TabsViewState extends State<TabsView> {
  @override
  void initState() {
    super.initState();

    context.read<SettingsCubit>().initUser();
  }

  final List<Widget> _tabs = [
    const ResultsView(),
    const WorkoutView(),
    Center(
        child: ElevatedButton(
            onPressed: () {
              Amplify.Auth.signOut();
            },
            child: const Text('Logout')))
  ];

  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingsCubit, SettingsState>(
      listener: (context, state) {
        if (state.userId.isNotEmpty) {
          context.read<ResultsCubit>().getWorkouts(state.userId);
        }
      },
      child: BlocBuilder<TabsCubit, int>(builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('SmartFit'),
          ),
          body: _tabs[state],
          bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              fixedColor: Colors.blueAccent,
              backgroundColor: Colors.white,
              elevation: 3,
              currentIndex: state,
              onTap: (value) => context.read<TabsCubit>().changeTab(value),
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.list),
                  label: 'Results',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.fitness_center_rounded),
                  label: 'Workout',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                ),
              ]),
        );
      }),
    );
  }
}
