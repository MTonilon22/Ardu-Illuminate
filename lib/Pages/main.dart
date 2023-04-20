import 'package:flutter/material.dart';
import 'package:ardu_illuminate/Pages/Account/login.dart';
import 'package:ardu_illuminate/Pages/Screens/userProfile.dart';
import 'package:ardu_illuminate/Pages/Screens/light_details.dart';
import 'package:ardu_illuminate/Pages/Screens/powerConsumption.dart';
import 'package:ardu_illuminate/Pages/Screens/homePage.dart';
import 'package:ardu_illuminate/Pages/Screens/editprofilepage.dart';
import 'package:ardu_illuminate/Pages/Screens/settingsPage.dart';
import 'package:ardu_illuminate/Pages/Screens/timer.dart';

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
      title: 'Ardu-Illuminate',
      theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.grey,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: LoginPage(),
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
    ThirdScreen(),
    FourthScreen(),
    FifthScreen(),
    SettingsPage(),
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
