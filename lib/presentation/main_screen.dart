import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taskapp/presentation/home/category_screen.dart';
import 'package:taskapp/presentation/home/home_screen.dart';
import 'package:taskapp/presentation/home/setting_screen.dart';
import 'package:taskapp/presentation/home/user_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final String homeIcon = "assets/icons/home.png";
  final String categoryIcon = "assets/icons/category.png";
  final String settingIcon = "assets/icons/setting.png";
  final String userIcon = "assets/icons/user.png";

  final List<Widget> _screens =[
    HomeScreen(),
    CategoryScreen(),
    SettingScreen(),
    UserScreen()
  ];

  final List<Color> _bgColor = [
    ?Colors.blue[200],
    ?Colors.green[200],
    ?Colors.cyan[200],
    ?Colors.yellow[200]
  ];

  int _selectedIndex= 0 ;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Color(0xFFE8EEFF),
        systemNavigationBarIconBrightness: Brightness.dark,
      )
    );
    return Scaffold(
      backgroundColor: _bgColor[_selectedIndex],
      appBar: AppBar(backgroundColor: _bgColor[_selectedIndex], title: Text("TaskApp")),
      body: _screens[_selectedIndex],
      bottomNavigationBar: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(35),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(35),
            child: BottomNavigationBar(
              backgroundColor: Colors.white,
              type: BottomNavigationBarType.fixed,

              // hide all labels
              showSelectedLabels: false,
              showUnselectedLabels: false,

              items: [
                BottomNavigationBarItem(icon: Image.asset(homeIcon, height: 30), label: "Home"),
                BottomNavigationBarItem(icon: Image.asset(categoryIcon, height: 30), label: "Home"),
                BottomNavigationBarItem(icon: Image.asset(settingIcon, height: 30), label: "Home"),
                BottomNavigationBarItem(icon: Image.asset(userIcon, height: 30), label: "Home"),
              ],
              currentIndex: _selectedIndex,
              onTap: (index){
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
