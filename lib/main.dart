import 'package:flutter/material.dart';

import 'Screens/HabitsPage.dart';
import 'Screens/HomePage.dart';
import 'Screens/ProfilePage.dart';
import 'Screens/ProgressPage.dart';

void main() {
  runApp(const MyApp());
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
        primarySwatch: Colors.blue,
      ),
      home: NavigationScreen(currIndex:3,),
    );
  }
}

const List<Widget> screens = [
  HomePage(),
  ProgressPage(),
  HabitsPage(),
  ProfilePage()
];



class NavigationScreen extends StatefulWidget {
  int currIndex;
  NavigationScreen({required this.currIndex});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: widget.currIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.deepPurpleAccent,
        currentIndex: widget.currIndex,
        onTap: (index) {
          setState(() {
            widget.currIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: "Progress"),
          BottomNavigationBarItem(icon: Icon(Icons.timeline), label: "Habits"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")

        ],

      ),
    );
  }
}



