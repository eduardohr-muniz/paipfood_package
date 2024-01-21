// ignore_for_file: depend_on_referenced_packages
import 'dart:io';
import 'dart:typed_data';
import 'package:cropperx/cropperx.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class CropperImageController extends ChangeNotifier {
  final GlobalKey cropperKey = GlobalKey(debugLabel: 'cropperKey');
  Uint8List? imagePicker;
  Uint8List? imageResult;
  double aspectRatio = 1.0;
  OverlayType overlayType = OverlayType.grid;

  Future<Uint8List?> uploadImage({required BuildContext context, double? width}) async {
    await FilePicker.platform.pickFiles(type: FileType.image).then((value) async {
      if (value != null) {
        final i = value.files.first;
        final File file = File(i.path!);
        imagePicker = file.readAsBytesSync();
      }
    });
    notifyListeners();
    return imagePicker;
  }

  void changeOverlay() {
    overlayType == OverlayType.grid ? overlayType = OverlayType.circle : overlayType = OverlayType.grid;
  }

  @override
  void dispose() {
    super.dispose();
    imageResult = null;
    imagePicker = null;
  }

  Future<Uint8List?> cropImage() async {
    final image = await Cropper.crop(
      cropperKey: cropperKey,
    );
    imageResult = image;
    return image;
  }
}
