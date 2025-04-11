import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Side Drawer',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const CustomDrawerScreen(),
    );
  }
}

class CustomDrawerScreen extends StatefulWidget {
  const CustomDrawerScreen({super.key});

  @override
  State<CustomDrawerScreen> createState() => _CustomDrawerScreenState();
}

class _CustomDrawerScreenState extends State<CustomDrawerScreen> {
  bool _isDrawerOpen = false;

  void _toggleDrawer() {
    setState(() {
      _isDrawerOpen = !_isDrawerOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    double drawerWidth = 250;

    return Scaffold(
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            left: _isDrawerOpen ? drawerWidth : 0,
            top: 0,
            bottom: 0,
            right: _isDrawerOpen ? -drawerWidth : 0,
            child: GestureDetector(
              onTap: () {
                if (_isDrawerOpen) _toggleDrawer();
              },
              child: AbsorbPointer(
                absorbing: _isDrawerOpen,
                child: Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.indigo,
                    title: Text(
                      'Side Drawer With Annimation',
                      style: const TextStyle(color: Colors.white),
                    ),
                    leading: IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: _toggleDrawer,
                    ),
                  ),
                  body: const Center(child: Text('Tap the Menu Icon')),
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            left: _isDrawerOpen ? 0 : -drawerWidth,
            top: 0,
            bottom: 0,
            child: Container(
              width: drawerWidth,
              color: Colors.indigo,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'My Drawer',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  const SizedBox(height: 20),
                  ListTile(
                    leading: const Icon(Icons.home, color: Colors.white),
                    title: const Text(
                      'Home',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () => _toggleDrawer(),
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings, color: Colors.white),
                    title: const Text(
                      'Settings',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () => _toggleDrawer(),
                  ),
                  ListTile(
                    leading: const Icon(Icons.logout, color: Colors.white),
                    title: const Text(
                      'Logout',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () => _toggleDrawer(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
