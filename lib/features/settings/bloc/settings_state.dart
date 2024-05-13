part of 'settings_cubit.dart';

class SettingsState extends Equatable {
  final String userId;

  const SettingsState({this.userId = ''});

  @override
  List<Object> get props => [userId];

  SettingsState copyWith({String? userId}) {
    return SettingsState(userId: userId ?? this.userId);
  }
}
