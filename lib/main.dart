import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reco_genie_internship/core/notification/firebase_notification.dart';
import 'package:reco_genie_internship/core/observer/simple_bloc_observer.dart';
import 'package:reco_genie_internship/core/utils/app_route.dart';
import 'package:reco_genie_internship/core/utils/service_locator.dart';
import 'package:reco_genie_internship/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FirebaseNotificationHelper.init();

  Bloc.observer = SimpleBlocObserver();
  serviceLocator();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp.router(
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            centerTitle: true,
            color: Colors.transparent,
          ),
          scaffoldBackgroundColor: Colors.white,
          fontFamily: GoogleFonts.inter().fontFamily,
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
        // home: HomeView(),
      ),
    );
  }
}
