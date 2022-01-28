import 'package:flutter/material.dart';
import 'home/pages/home_page.dart';
import 'utils/routes.dart';

void main() async {
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: MyRoutes.routes,
      initialRoute: 'home',
    );
  }
}

init() async {
  WidgetsFlutterBinding.ensureInitialized();
}