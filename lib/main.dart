import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'src/presentation/screens/login_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false, // 👈 Esto elimina la línea "DEBUG"
      title: 'UDECE App',
      theme: ThemeData.dark(), 
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen()
      },
    );
  }
}
