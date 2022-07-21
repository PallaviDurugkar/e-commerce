import 'package:e_commerce_project/firebase_options.dart';
import 'package:e_commerce_project/ui/home_page.dart';
import 'package:e_commerce_project/onboarding/onboarding.dart';
import 'package:e_commerce_project/ui/auth/login_screen.dart';
import 'package:e_commerce_project/ui/auth/register_page.dart';
import 'package:e_commerce_project/ui/root.dart';
import 'package:e_commerce_project/ui/router.dart';
import 'package:e_commerce_project/ui/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final base = ThemeData.light();

    final colorScheme = ColorScheme.fromSeed(seedColor: Colors.indigo);

    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        primaryColor: Colors.lightBlueAccent,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
          ),
          titleMedium: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Color(
              0xFF223263,
            ),
          ),
          labelLarge:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
        ),
        // colorScheme: colorScheme,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
        ),

        buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
        ),
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            elevation: 0),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.grey),
            padding: MaterialStateProperty.all(
              const EdgeInsets.all(16),
            ),
          ),
        ),
        
      ),
      initialRoute: SplashScreen.route,
      onGenerateRoute: AppRouter.onNavigate,
      darkTheme: ThemeData.dark(),
      // themeMode: ThemeMode.dark,
    );
  }
}
