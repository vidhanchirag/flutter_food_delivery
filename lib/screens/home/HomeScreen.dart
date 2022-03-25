import 'package:flutter/material.dart';
import 'package:food_delivery/screens/home/fragments/HomeFragment.dart';
import 'package:food_delivery/screens/home/fragments/OrderFragment.dart';
import 'package:food_delivery/screens/home/fragments/ProfileFragment.dart';
import 'package:food_delivery/screens/home/fragments/SearchFragment.dart';
import 'package:food_delivery/utils/AppColors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final pages = [
    const HomeFragment(),
    const SearchFragment(),
    const OrderFragment(),
    const ProfileFragment(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/home_tab.png"),),
              title: Text(
                'Home',
                style: TextStyle(
                  color: AppColors.red,
                  fontSize: 10.0,
                  fontFamily: 'Poppins Medium',
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/search_tab.png")),
              title: Text(
                'Search',
                style: TextStyle(
                  color: AppColors.font_light_gray,
                  fontSize: 10.0,
                  fontFamily: 'Poppins Medium',
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/orders_tab.png")),
              title: Text(
                'Orders',
                style: TextStyle(
                  color: AppColors.font_light_gray,
                  fontSize: 10.0,
                  fontFamily: 'Poppins Medium',
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/profile_tab.png")),
              title: Text('Profile',
                style: TextStyle(
                  color: AppColors.font_light_gray,
                  fontSize: 10.0,
                  fontFamily: 'Poppins Medium',
                ),),
            ),
          ],
          unselectedIconTheme: IconThemeData(
            color: AppColors.tab_defualt_color,
          ),
          type: BottomNavigationBarType.fixed,

          currentIndex: _selectedIndex,
          selectedItemColor: AppColors.red,
          iconSize: 40,
          onTap: _onItemTapped,
          elevation: 5),
    );
  }
}
