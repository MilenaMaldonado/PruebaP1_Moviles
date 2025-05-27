import 'package:flutter/material.dart';
import 'package:prueba_p1/theme/app_colors.dart';
import 'package:prueba_p1/theme/app_theme.dart';
import 'package:prueba_p1/views/inicio.dart';
import 'dart:ui';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'El Mandilón Ventas',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: const Inicio(),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child!,
        );
      },

    );
  }
}
