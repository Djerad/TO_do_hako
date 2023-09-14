import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/core/bloc/bloc_observer.dart';
import 'package:todoapp/core/databse/cashhelper.dart';
import 'package:todoapp/core/services/services_locator.dart';
import 'package:todoapp/core/utils/appcolors.dart';
import 'package:todoapp/features/auth/presentation/cubit/taskcuit.dart';
import 'package:todoapp/features/auth/presentation/screens/onboarding.dart';
import 'package:todoapp/features/auth/presentation/screens/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = Myblocobserver();
  setup();
  await sl<CashHelper>().init();
  runApp(BlocProvider(create: (context) => Taskcubit(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(340, 810),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            backgroundColor: Appcolor.primary,
            useMaterial3: true,
          ),
          home: Splashscreen(),
        );
      },
    );
  }
}
