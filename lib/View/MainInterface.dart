// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:medical_app/Repository/GetDataSqlite.dart';
import 'package:medical_app/ViewModel/LoginViewModel.dart';
import 'package:sizer/sizer.dart';

import 'MedCardViews/MedCardInterface.dart';

class MainInterface extends StatefulWidget {
   MainInterface({super.key});


  @override
  State<MainInterface> createState() => _MainInterfaceState();
}

class _MainInterfaceState extends State<MainInterface> {
  
  int index=0;
   
    List<Widget> _widgetOptions = <Widget>[  
    // ignore: prefer_const_constructors
    Text('lwla ', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),  
    MedCard(),  
    Text('Profile Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),  
    Text('Profile dd', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Profile ff', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.green,
          selectedFontSize: 12.sp,
          showUnselectedLabels: false,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            setState(() {
              index=value;
            });
          },
          currentIndex: index,
          items: [
            // ignore: prefer_const_constructors
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Main'
              ),
              BottomNavigationBarItem(
              icon: Icon(Icons.medical_information_outlined),
              label: 'MedCard'
              ),
              BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.userDoctor),
              label: 'Doctors'
              ),
              BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.handHoldingMedical),
              label: 'Treatment'
              ),
              BottomNavigationBarItem(
              icon: Icon(Icons.person_pin),
              label: 'Profile'
              ),
          ]
        ),
         body: Center(child: _widgetOptions[index])
    );
  }
}