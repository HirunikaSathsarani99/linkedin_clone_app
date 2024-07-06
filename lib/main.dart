import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:linkedin_clone_app/view/home_screen.dart';
import 'package:linkedin_clone_app/view/profile_page.dart';
import 'package:linkedin_clone_app/view/spalsh_screen.dart';
import 'package:linkedin_clone_app/view/login_page.dart';
import 'package:linkedin_clone_app/view/signup_page.dart';
import 'package:linkedin_clone_app/view_model/post_view_model.dart';
import 'package:linkedin_clone_app/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(DevicePreview(enabled: !kReleaseMode,
      builder: (context) => MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
       providers: [
        ChangeNotifierProvider(create: (_) => UserViewModel()),
        ChangeNotifierProvider(create: (_) => PostViewModel()..fetchPosts()),
      ],
      child: MaterialApp(
        title: 'LinkedIn Clone App',
        theme: ThemeData(
         primarySwatch: Colors.blue,
         textTheme: GoogleFonts.sourceSans3TextTheme(
        Theme.of(context).textTheme,
        )
         
        ),
        debugShowCheckedModeBanner: false,
        builder: DevicePreview.appBuilder,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
        home:   SplashScreen(),
        routes: {
            '/signup': (context) => const SignupPage(),
            '/home': (context) => const HomeScreen(),
            '/login':(context)=> const LoginPage(),
            '/profile': (context) => ProfilePage(),
            '/main': (context) => SplashScreen(),
          },
      ),
    );
  }
}

