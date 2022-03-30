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
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/search_tab.png")),
            label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/orders_tab.png")),
            label: 'Orders'
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage("assets/profile_tab.png")),
             label:'Profile'
            ),
          ],
          unselectedIconTheme: IconThemeData(
            color: AppColors.tab_defualt_color,
          ),
          type: BottomNavigationBarType.fixed,

          currentIndex: _selectedIndex,
          selectedItemColor: AppColors.red,
          unselectedItemColor: AppColors.font_light_gray,
          selectedLabelStyle: TextStyle(fontSize: 12,fontFamily: 'Poppins Medium'),
          unselectedLabelStyle: TextStyle(fontSize: 12,fontFamily: 'Poppins Medium'),
          iconSize: 40,
          onTap: _onItemTapped,
          elevation: 5),
    );
  }
}
