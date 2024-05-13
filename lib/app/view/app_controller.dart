import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartfit_development/amplifyconfiguration.dart';
import 'package:smartfit_development/features/results/bloc/results_cubit.dart';
import 'package:smartfit_development/features/results/repository/results_repository.dart';
import 'package:smartfit_development/features/results/view/workout_details_view.dart';
import 'package:smartfit_development/features/settings/bloc/settings_cubit.dart';
import 'package:smartfit_development/features/settings/repositories/settings_repository.dart';
import 'package:smartfit_development/features/tabs/bloc/tabs_cubit.dart';
import 'package:smartfit_development/features/tabs/view/tabs_view.dart';
import 'package:smartfit_development/features/workout/bloc/workout_cubit.dart';
import 'package:smartfit_development/features/workout/repository/workout_repository.dart';
import 'package:smartfit_development/models/ModelProvider.dart';

class AppController extends StatefulWidget {
  const AppController({super.key});

  @override
  State<AppController> createState() => _AppControllerState();
}

class _AppControllerState extends State<AppController> {
  @override
  void initState() {
    super.initState();

    _configureAmplify();
  }

  Future<void> _configureAmplify() async {
    try {
      final auth = AmplifyAuthCognito();
      final api = AmplifyAPI(modelProvider: ModelProvider.instance);
      final storage = AmplifyStorageS3();

      await Amplify.addPlugins([api, auth, storage]);

      await Amplify.configure(amplifyconfig);
    } on Exception catch (e) {
      safePrint('An error occurred configuring Amplify: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => SettingsRepository()),
        RepositoryProvider(create: (context) => WorkoutRepository()),
        RepositoryProvider(create: (context) => ResultsRepository())
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => TabsCubit()),
          BlocProvider(
              create: (context) => WorkoutCubit(
                    workoutRepository: context.read<WorkoutRepository>(),
                  )),
          BlocProvider(
              create: (context) => SettingsCubit(
                    settingsRepository: context.read<SettingsRepository>(),
                  )),
          BlocProvider(
              create: (context) => ResultsCubit(
                    resultsRepository: context.read<ResultsRepository>(),
                  )),
        ],
        child: Authenticator(
          child: MaterialApp(
              title: 'SmartFit',
              builder: Authenticator.builder(),
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
                useMaterial3: true,
              ),
              routes: {
                TabsView.routeName: (context) => const TabsView(),
                WorkoutDetailsView.routeName: (context) =>
                    const WorkoutDetailsView()
              },
              initialRoute: '/'),
        ),
      ),
    );
  }
}
