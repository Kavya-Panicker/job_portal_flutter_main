import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/theme_provider.dart';
import 'screens/api_test_screen.dart';
import 'screens/dashboard.dart';
import 'screens/login.dart';
import 'screens/registration.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Employee App',
          theme: themeProvider.themeData,
          home: ApiTestScreen(),
          routes: {
            '/login': (context) => LoginScreen(),
            '/register': (context) => RegistrationScreen(),
            '/dashboard': (context) => DashboardScreen(),
          },
        );
      },
    );
  }
}
