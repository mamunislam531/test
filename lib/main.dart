import 'dart:developer';

import 'package:alladin_e_store/controller/local_storage/local_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'utils/app_data.dart';
import 'utils/settings/localization.dart';
import 'utils/settings/easyloading_settings.dart';
import 'utils/theme/light_theme.dart';
import 'view/screen/splash/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyloadingSettings().easyloadingSetting();
  AppData.appLanguage = await LocalData().readData(key: "languageType");
  log("------ Main- App Language :  (${AppData.appLanguage})");
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then(
    (_) => runApp(MyApp(languageType: AppData.appLanguage)),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.languageType});
  final String languageType;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      theme: LightThemes.light,
      translations: Localization(),
      locale: languageType == "BN" ? const Locale("bn", "BD") : const Locale("en", "US"),
      home: const SplashScreen(),
    );
  }
}
