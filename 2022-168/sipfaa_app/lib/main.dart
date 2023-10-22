import 'package:flutter/material.dart';
import 'package:sipfaa_app/providers/plan_provider.dart';
import 'package:sipfaa_app/screens/home.dart';
import 'package:provider/provider.dart';
import 'package:sipfaa_app/screens/services/notification_service.dart';

void main() {
  NotificationService().initNotification();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (create) => PlanProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SIPFAA',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff809b7b),

      ),
      home: const MyHomePage(title: 'SIPFAA'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/Welcome Page.png"),
                fit: BoxFit.cover,
              )),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const Home(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
