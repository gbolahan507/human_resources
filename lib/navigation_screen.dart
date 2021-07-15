import 'package:flutter/material.dart';
import 'package:human_resources/ui/screen/home_screen.dart';
import 'package:human_resources/ui/screen/weekly.dart';
import 'package:human_resources/widgets/export.dart';

class NavigationScreen extends StatefulWidget {
  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    WeeklyScreen(),
    // Scaffold(),
    Scaffold(),
  ];

  int _selectedIndex = 0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.grey[100],
            onTap: (index) => setState(() => _selectedIndex = index),
            currentIndex: _selectedIndex,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Styles.colorLightBlue,
            unselectedItemColor: Styles.colorBlack.withOpacity(0.5),
            selectedLabelStyle:
                TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
            unselectedLabelStyle:
                TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.today),
                label: 'Tody',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.weekend),
                label: 'Weekly',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.share),
                label: 'Share',
              ),
            ]));
  }
}
