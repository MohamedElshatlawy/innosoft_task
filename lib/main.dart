import 'package:appgain_task/providers/popular_people_viewModel.dart';
import 'package:appgain_task/utils/colors.dart';
import 'package:appgain_task/view/home.dart';
import 'package:appgain_task/view/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:provider/provider.dart';

import 'Locale/appLocalization.dart';
import 'Locale/localizationProvider.dart';

main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: LocalProvider()),
      ChangeNotifierProvider.value(value: PopularPeopleProvider()),
    ],
    child: MyMaterial(),
  ));
}

class MyMaterial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var locProvider = Provider.of<LocalProvider>(context);

    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        locale: locProvider.appLocal,
        theme: ThemeData(primaryColor: CustomColors.PRIMARY_BLUE),
        supportedLocales: [
          Locale('en', 'US'),
          Locale('ar', ''),
        ],
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        home: Splash(),
      ),
    );
  }
}
