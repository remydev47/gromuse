import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:gromuse/commons/utils/app_routes.dart';
import 'package:gromuse/src/controllers/bottomtabbar.dart';
import 'package:gromuse/src/controllers/cartprovider.dart';
import 'package:gromuse/src/controllers/onboardingcontroller.dart';
import 'package:gromuse/src/splashscreen/splashscreen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => OnboardingNotifier(),
        ),
        ChangeNotifierProvider(
          create: (_) => TabIndexNotifier(),
        ),
        ChangeNotifierProvider(
          create: (_) => CartProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return ScreenUtilInit(
      designSize: screenSize,
      minTextAdapt: true,
      splitScreenMode: false,
      useInheritedMediaQuery: true,
      builder: (_, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.system,
          
          routerConfig: router,
        );
      },
      child: Splashscreen(),
    );
  }
}


