import 'package:flutter/material.dart';
import 'createaccountpage.dart';
import 'loginpage.dart';
import 'first.dart';
import 'second.dart';
import 'third.dart';
import 'fourth.dart';
import 'fifth.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ardu-Illuminate',
      theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.grey,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: LoginPage(),
      routes: {
        '/login': (context) => LoginPage(),
        '/create-account': (context) => CreateAccountPage(),
        '/first-screen': (context) => const FirstScreen(),
        '/second-screen': (context) => const SecondScreen(),
        '/third-screen': (context) => const ThirdScreen(),
        '/fourth-screen': (context) => const FourthScreen(),
        '/fifth-screen': (context) => const FifthScreen(),
      },
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
  int _selectedindex = 0;

  final List<Widget> _widgetOptions = [
    const FirstScreen(),
    const SecondScreen(),
    const ThirdScreen(),
    const FourthScreen(),
    const FifthScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _widgetOptions.elementAt(_selectedindex),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.verified_user_rounded),
            label: "User",
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb),
            label: "Light",
            backgroundColor: Colors.blueAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: Colors.grey,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            label: "Timer",
            backgroundColor: Colors.purpleAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.gas_meter),
            label: "Energy Meter",
            backgroundColor: Colors.orange,
          ),
        ],
        currentIndex: _selectedindex,
        selectedItemColor: Color.fromARGB(255, 0, 255, 204),
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/create-account');
        },
        tooltip: 'Create Account',
        child: Icon(Icons.person_add),
      ),
    );
  }
}
