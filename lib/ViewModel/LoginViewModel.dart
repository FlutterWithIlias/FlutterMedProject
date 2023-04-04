// ignore_for_file: curly_braces_in_flow_control_structures, unused_local_variable

import 'dart:ffi';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:medical_app/Model/LoginModel.dart';

import '../Repository/Repository.dart';

class LoginViewModel extends GetxController {
  var logininfos = <LoginModel>[];
   String? email ;
   int? password ;
   int? code ; 
  Repository? repository;
  LoginViewModel({this.repository});
  fetchLoginInfos() async {
    logininfos = await repository!.getLoginInfos();
    // print(logininfos[0].code);
    // print(logininfos[0].email);
    // print(logininfos[0].password);

  }

  @override
  void onInit() async {
    super.onInit();
    fetchLoginInfos();
  }

   verifier(){
      for (var e in logininfos) {
         if(e.password == password && e.email?.compareTo(email!) == 0 )
         return code = e.code ;}
         return 0 ;
      }
}