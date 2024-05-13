import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:smartfit_development/models/Workout.dart';

class ResultsRepository {
  Future<List<Workout>> getResults(String userId) async {
    List<Workout> results = [];

    try {
      final queryPredicate = Workout.USERID.eq(userId);

      final request = ModelQueries.list<Workout>(
        Workout.classType,
        where: queryPredicate,
      );

      final response = await Amplify.API.query(request: request).response;

      final List<Workout?>? items = response.data?.items;

      if (items != null) {
        results = items.whereType<Workout>().toList();
      }

      return results;
    } catch (_) {
      return results;
    }
  }

  Future<Uri?> downloadVideo(
      {required String videoId, required String type}) async {
    try {
      final StorageGetUrlResult result =
          await Amplify.Storage.getUrl(key: '$type/$videoId.mp4').result;

      final Uri url = result.url;

      return url;
    } catch (e) {
      debugPrint(e.toString());

      rethrow;
    }
  }
}
