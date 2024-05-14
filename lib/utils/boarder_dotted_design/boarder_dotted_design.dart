import 'dart:typed_data';
import 'package:easyinvoice/provider_code/provider_singnature/provider_singnature.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:provider/provider.dart';

import '../colors_class/color_class.dart';


class BorderDottedContainer extends StatelessWidget {
  BorderDottedContainer({super.key});

  Uint8List? signatureBytes;
  @override
  Widget build(BuildContext context) {
    Provider.of<ProviderSignature>(context,listen: false);
    return Consumer<ProviderSignature>(
      builder: (context, signatureProvider, child) {
        return DottedBorder(
          color: appColor,
          dashPattern: const [8, 4],
          strokeWidth: 1.5,
          child: GestureDetector(
            onTap: () {
              signatureProvider.openSignaturePad();
            },
            child: Container(
              width: double.infinity,
              height: 200,
              color: Colors.white,
              child: signatureProvider.signatureBytes != null
                  ? Image.memory(
                signatureProvider.signatureBytes!,
                width: 25.0,
                height: 25.0,
              )
                  : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 60,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(1, 1),
                            color: Colors.grey,
                            blurRadius: 0.8,
                          ),
                        ],
                      ),
                      child: IconButton(
                        onPressed: signatureProvider.openSignaturePad,
                        icon:  Icon(CupertinoIcons.pen,color: appColor,size: 33,),),
                    ),
                    const SizedBox(height: 10),
                    const Text("Create your Signature here"),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
