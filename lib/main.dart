import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:f1_feed/services/services.dart';
import 'package:f1_feed/providers/providers.dart';
import 'package:f1_feed/user_preferences/preferences.dart';
import 'package:f1_feed/screens/screens.dart';

void main() async {
  //Carga de las preferencias de usuario
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();

  // Status bar transparente
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
        ChangeNotifierProvider(create: (_) => ToggleButtonProvider()),
        ChangeNotifierProvider(
            create: (_) => ThemeProvider(isDarkMode: Preferences.isDarkMode)),
        ChangeNotifierProvider(create: (_) => StandingService()),
        ChangeNotifierProvider(create: (_) => CalendarioService()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pachangapp',
      initialRoute: 'main',
      routes: {
        'main': (_) => const MainScreen(),
      },
      theme: Provider.of<ThemeProvider>(context).currentTheme,
    );
  }
}
