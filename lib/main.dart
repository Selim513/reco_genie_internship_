import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reco_genie_internship/core/observer/simple_bloc_observer.dart';
import 'package:reco_genie_internship/core/utils/app_route.dart';
import 'package:reco_genie_internship/core/utils/service_locator.dart';
import 'package:reco_genie_internship/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  serviceLocator();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Bloc.observer = SimpleBlocObserver();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp.router(
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          fontFamily: GoogleFonts.inter().fontFamily,
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
        // home: RegisterView(),
      ),
    );
  }
}
