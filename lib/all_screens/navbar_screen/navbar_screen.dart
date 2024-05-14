import 'package:easyinvoice/all_screens/create_invoice/create_invoice.dart';
import 'package:flutter/material.dart';
import '../../utils/colors_class/color_class.dart';
import '../screen_setting/screen_setting.dart';


class NavBarBottomScreen extends StatefulWidget {
  const NavBarBottomScreen({super.key});

  @override
  State<NavBarBottomScreen> createState() => _NavBarBottomScreenState();
}

class _NavBarBottomScreenState extends State<NavBarBottomScreen> {
  int myIndex = 0;
  List<Widget>myList = [
    CreateInvoice(businessName: "", businessEmail: ""),

    const SettingScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: myList[myIndex],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: appColor,
          unselectedItemColor: Colors.grey,
          onTap: (index){
            setState(() {
              myIndex = index;
            });
          },
          currentIndex: myIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_filled,),label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.settings),label: "Setting")
          ]),
    );
  }
}
