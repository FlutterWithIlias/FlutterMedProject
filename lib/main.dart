import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sizer/sizer.dart';
import 'Bindings.dart';
import 'View/Login/LoginScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
       theme: ThemeData(
    primaryColor: Color.fromARGB(88, 44, 206, 87),
  ),
      home: LoginScreen(),
      initialBinding: MyBindings(),
    );
      }
 );
  }
}
