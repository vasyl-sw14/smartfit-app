import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartfit_development/features/settings/repositories/settings_repository.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit({required this.settingsRepository})
      : super(const SettingsState());

  final SettingsRepository settingsRepository;

  Future<void> initUser() async {
    final String? userId = await settingsRepository.getUserId();

    emit(state.copyWith(userId: userId));
  }
}
