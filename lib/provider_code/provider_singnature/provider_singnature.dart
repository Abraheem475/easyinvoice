import 'package:easyinvoice/utils/button_custom/next_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signature/signature.dart';

import '../../utils/colors_class/color_class.dart';


class ProviderSignature with ChangeNotifier {
  Uint8List? _signatureBytes;
  Uint8List? get signatureBytes => _signatureBytes;
  final SignatureController controller = SignatureController(
    penColor: appColor,
    exportPenColor: appColor,
    penStrokeWidth: 2,
    exportBackgroundColor: whiteColor,
  );

  void openSignaturePad() async {
    await Get.bottomSheet(
      SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Signature(
                height: 250.0,
                controller: controller,
                width: double.infinity,
                backgroundColor: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: NextButton().nextButton(onPress: clearSignature, textColor: appColor, fontSize: 12.0, text: "Reove", buttonColor: whiteColor, width: 100.0, height: 40.0, borderRadius: BorderRadius.circular(10.0), fontWeight: FontWeight.w600,),
            )
          ],
        ),
      ),
    );

    final signature = await controller.toPngBytes();
    if (signature != null) {
      _signatureBytes = signature;
      notifyListeners();
    }
  }

  void clearSignature() {
    controller.clear();
    _signatureBytes = null;
    notifyListeners();
  }
}
