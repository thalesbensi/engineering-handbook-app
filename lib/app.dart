import 'package:flutter/material.dart';

import 'screens/home/home_page.dart';
import 'theme/app_theme.dart';

class HandbookApp extends StatelessWidget {
  const HandbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Engineering Handbook',
      theme: AppTheme.lightTheme,
      home: const HandbookHomePage(),
    );
  }
}
