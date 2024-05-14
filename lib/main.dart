import 'package:easyinvoice/all_screens/splash_screen/splash_screen.dart';
import 'package:easyinvoice/provider_code/clients_provider/client_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:easyinvoice/provider_code/image_provider.dart';
import 'package:easyinvoice/provider_code/items_provider/items_provider.dart';
import 'package:easyinvoice/provider_code/provider_singnature/provider_singnature.dart';
import 'package:easyinvoice/provider_code/value_get_provider.dart';
import 'package:easyinvoice/utils/colors_class/color_class.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: appColor));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=> ValueGetProvider()),
      ChangeNotifierProvider(create: (_)=> ProviderSignature()),
      ChangeNotifierProvider(create: (_)=> LogoProvider()),
      ChangeNotifierProvider(create: (_)=> ItemProvider()),
      ChangeNotifierProvider(create: (_)=> AddClientProvider()),

    ],
    child:  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: appColor,primary: appColor),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    ),
    );
  }
}
