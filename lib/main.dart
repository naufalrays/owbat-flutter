import 'package:flutter/material.dart';
import 'package:meddis/utils/color.dart';
import 'package:meddis/view_models/drug_menu_provider.dart';
import 'package:meddis/view_models/main_provider.dart';
import 'package:meddis/view_models/scanner_provider.dart';
import 'package:meddis/views/main_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => MainProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => DrugMenuProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => ScannerProvider(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: MyColor.backgroundColor,
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const MainView(),
    );
  }
}
