import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:ardu_illuminate/Account/login.dart';
import 'package:ardu_illuminate/Screens/userProfile.dart';
import 'package:ardu_illuminate/Screens/light_details.dart';
import 'package:ardu_illuminate/Screens/powerConsumption.dart';
import 'package:ardu_illuminate/Screens/homePage.dart';
import 'package:ardu_illuminate/Screens/editprofilepage.dart';
import 'package:ardu_illuminate/Screens/settingsPage.dart';
import 'package:ardu_illuminate/Screens/timer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.grey,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: Builder(
        builder: (BuildContext context) {
          return AnimatedSplashScreen(
            splash: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: Center(
                      child: Image.asset(
                        "assets/ardu-ulliminate.png",
                      ),
                    ),
                  ),
                ),
              ],
            ),
            duration: 1000,
            splashTransition: SplashTransition.sizeTransition,
            nextScreen: LoginPage(),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final int _selectedindex = 0;

  final PageController _pageController = PageController();

  final List<Widget> _widgetOptions = [
    const ThirdScreen(),
    const FourthScreen(),
    const FifthScreen(),
    const SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _pageController.animateToPage(index,
          duration: const Duration(milliseconds: 300), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white),
            label: "Home",
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer, color: Colors.white),
            label: "Timer",
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb, color: Colors.white),
            label: "Power",
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: Colors.white),
            label: "User",
            backgroundColor: Colors.black,
          ),
        ],
        currentIndex: _selectedindex,
        selectedItemColor: const Color.fromARGB(255, 0, 255, 204),
        onTap: _onItemTapped,
      ),
    );
  }
}
