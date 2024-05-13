import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:file_manager/file_manager.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart';

class WorkoutRepository {
  Future<Uint8List?> downloadPublicVideo() async {
    try {
      final Response response = await get(Uri.parse(
          'https://smart-fit-input-videos-bucket.s3.eu-central-1.amazonaws.com/video3.mp4'));

      if (response.statusCode == 200) {
        return response.bodyBytes;
      }

      return null;
    } catch (_) {
      rethrow;
    }
  }

  Future<Uint8List?> chooseVideoFromGallery() async {
    try {
      await FileManager.requestFilesAccessPermission();

      final FilePickerResult? result = await FilePicker.platform
          .pickFiles(type: FileType.video, allowCompression: false);

      if (result != null && result.files.isNotEmpty) {
        final PlatformFile file = result.files.first;

        return file.bytes;
      }

      return null;
    } catch (_) {
      rethrow;
    }
  }

  Future<Uint8List?> recordVideo() async {
    try {
      final List<CameraDescription> cameras = await availableCameras();

      CameraController controller = CameraController(
        cameras[0],
        ResolutionPreset.max,
      );

      await controller.initialize();

      await controller.startVideoRecording();

      await Future.delayed(const Duration(seconds: 30));

      final XFile video = await controller.stopVideoRecording();

      final Uint8List bytes = await video.readAsBytes();

      return bytes;
    } catch (_) {
      rethrow;
    }
  }
}
