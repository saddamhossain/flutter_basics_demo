import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const Color primaryColor = Color(0xFF2E7D32);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        useMaterial3: true,

        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),

        appBarTheme: const AppBarTheme(
          backgroundColor: primaryColor,
          centerTitle: true,
          elevation: 1,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.black87,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void _onDrawerItemTap(BuildContext context, String message) {
    Navigator.pop(context);
    _showSnackBar(context, message);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo App'),
        actions: [
          IconButton(
            onPressed: () {
              _showSnackBar(context, "Search Clicked");
            },
            icon: const Icon(Icons.search),
            tooltip: 'Search',
          ),
          IconButton(
            onPressed: () {
              _showSnackBar(context, 'Notifications clicked');
            },
            icon: const Icon(Icons.notifications),
            tooltip: 'Notifications',
          ),
        ],
      ),

      drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: MyApp.primaryColor),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://saddamhossain.net/images/profile.png',
                ),
              ),
              accountName: Text(
                'Md. Saddam Hossain',
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              accountEmail: Text('saddam@test.com'),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Dashboard'),
              onTap: () => _onDrawerItemTap(context, "Dashboard clicked"),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () => _onDrawerItemTap(context, 'Settings clicked'),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('About'),
              onTap: () => _onDrawerItemTap(context, 'About clicked'),
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Logout', style: TextStyle(color: Colors.red)),
              onTap: () => _onDrawerItemTap(context, 'Logout clicked'),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: MyApp.primaryColor,
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () {
          _showSnackBar(context, 'Add new item clicked');
        },
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        selectedItemColor: MyApp.primaryColor,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          switch (index) {
            case 0:
              _showSnackBar(context, 'Home tapped');
              break;
            case 1:
              _showSnackBar(context, 'Profile tapped');
              break;
            case 2:
              _showSnackBar(context, 'Settings tapped');
              break;
          }
        },

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),

          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),

          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),

      body: Center(child: Text('Hello Md. Saddam Hossain Rana')),
    );
  }
}
