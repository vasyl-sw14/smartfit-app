import 'package:amplify_flutter/amplify_flutter.dart';

class SettingsRepository {
  Future<String?> getUserId() async {
    final auth = Amplify.Auth;

    final AuthUser user = await auth.getCurrentUser();

    return user.userId;
  }
}
