import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/theme/app_theme.dart';
import 'presentation/screens/product_detail_screen.dart';

void main() {
  runApp(const ProviderScope(child: HollyPalmApp()));
}

class HollyPalmApp extends StatelessWidget {
  const HollyPalmApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Holly Palm Case Study',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const ProductDetailScreen(),
    );
  }
}
