import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

import '../utils/colors_class/color_class.dart';

class LogoProvider with ChangeNotifier {
  File? _logo;
  String _logopath = "assets/images/blank_image.webp";
  File? get logo => _logo;
  String get logopath => _logopath;

  String blankImage = "assets/images/blank_image.webp";

  Future<void> pickImage(BuildContext context) async {
    var status = await Permission.storage.status;
    try {
      if(status.isGranted){
        final picker = ImagePicker();
        final pickedImage = await picker.pickImage(source: ImageSource.gallery);
        if (pickedImage != null) {
          updateLogoPath(pickedImage.path);
        }
      }else{
        onDenied(context);
      }
    } catch (e) {}
    notifyListeners();
  }
  void updateLogoPath(String newPath) async {
    _logopath = newPath;
    notifyListeners();
  }

  Future<void> getCamera() async {
    final ImagePicker picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      _logo = File(pickedImage.path);
      notifyListeners();
    }
  }
  void clearImage() {
    _logopath = blankImage;
    notifyListeners();
  }
}
void onDenied(BuildContext context){
  showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      title: const Text('Permissions Request'),
      content: Text('This app needs storage permissions to Store Files. Please enable it in the app settings.'),
      actions: <Widget>[
        InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: SizedBox(width: 120,child: Center(child: Text('OPEN SETTINGS',style: TextStyle(color: appColor),))),
            onTap: () {
              // openAppSettings();
              Navigator.of(ctx).pop();
            }
        ),
        InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: SizedBox(width: 60,child: Center(child: Text('CANCEL',style: TextStyle(color: appColor),))),
          onTap: () => Navigator.of(ctx).pop(),
        )
      ],
    ),
  );
}
