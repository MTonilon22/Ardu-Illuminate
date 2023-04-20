import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  void _logout(BuildContext context) {
    // Implement code to logout the user
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 25),
                const Text(
                  'Profile',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50),
                // Add profile settings here
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () {
                    _logout(context);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: const Color(0xFF0047FF),
                  ),
                  child: const Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: 'Poppins',
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// // ignore_for_file: depend_on_referenced_packages

// import 'package:flutter/material.dart';
// import 'package:flutter_settings_screens/flutter_settings_screens.dart';
// class SettingsPage extends StatefulWidget {
//   @override
//   _SettingsPageState createState() => _SettingsPageState();
// }

// class _SettingsPageState extends State<SettingsPage> {
//   bool _isDarkModeEnabled = false;
//   String _username = 'John Doe';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Settings'),
//       ),
//       body: Column(
//         children: [
//           SizedBox(
//             height: 150,
//             child: Stack(
//               children: [
//                 Positioned.fill(
//                   child: Image.network(
//                     'https://images.unsplash.com/photo-1531080853569-04cda6c5887e',
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 Positioned(
//                   bottom: 0,
//                   left: 16,
//                   child: CircleAvatar(
//                     radius: 45,
//                     backgroundImage: NetworkImage(
//                         'https://images.unsplash.com/photo-1576508212696-2964d74ae9fb'),
//                   ),
//                 ),
//                 Positioned(
//                   bottom: 16,
//                   left: 120,
//                   child: Text(
//                     _username,
//                     style: Theme.of(context).textTheme.headline6,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           // SwitchSettingsTile(
//           //   settingKey: 'darkMode',
//           //   title: 'Dark Mode',
//           //   enabledLabel: 'On',
//           //   disabledLabel: 'Off',
//           //   leading: const Icon(Icons.brightness_4),
//           //   onChange: (value) {
//           //     setState(() {
//           //       _isDarkModeEnabled = value!;
//           //     });
//           //   },
//           // ),
//           SimpleSettingsTile(
//             title: 'User Settings',
//             subtitle: 'Change your username and other settings',
//             leading: const Icon(Icons.person),
//             onTap: () {
//               // Implement your user settings screen navigation here
//             },
//           ),
//           SimpleSettingsTile(
//             title: 'Logout',
//             subtitle: 'Log out of your account',
//             leading: const Icon(Icons.logout),
//             onTap: () {
//               // Implement your logout logic here
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
