import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:medical_app/Repository/GetDataSqlite.dart';
import 'package:medical_app/ViewModel/LoginViewModel.dart';

import '../MainInterface.dart';
import 'CenterWidget/cw.dart';
import 'package:email_validator/email_validator.dart';


class LoginScreen extends StatelessWidget {
  LoginViewModel login = Get.put(LoginViewModel(repository: LoginSqlite()),permanent: true);
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  LoginScreen({super.key});
  Widget topWidget(double screenWidth) {
       
    return Transform.rotate(
      angle: -35 * math.pi / 180,
      child: Container(
        width: 1.2 * screenWidth,
        height: 1.2 * screenWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(150),
          gradient: const LinearGradient(
            begin: Alignment(-0.2, -0.8),
            end: Alignment.bottomCenter,
            colors: [
              Color(0x007CBFCF),
              Color(0xB316BFC4),
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomWidget(double screenWidth) {
    return Container(
      width: 1.5 * screenWidth,
      height: 1.5 * screenWidth,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          begin: Alignment(0.6, -1.1),
          end: Alignment(0.7, 0.8),
          colors: [
            Color(0xDB4BE8CC),
            Color(0x005CDBCF),
          ],
        ),
      ),
    );
  }
   GlobalKey<FormState> myKey = new GlobalKey<FormState>() ;
   bool valider =true ;
   bool switchValue=false;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            top: -160,
            left: -30,
            child: topWidget(screenSize.width),
          ),
          Positioned(
            bottom: -180,
            left: -40,
            child: bottomWidget(screenSize.width),
          ),
          CenterWidget(size: screenSize),
          Form(
            key: myKey,
            child : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 8),
      child: SizedBox(
        height: 50,
        child: Material(
          elevation: 8,
          shadowColor: Colors.black87,
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(30),
          child: TextField(
            controller: email,
            textAlignVertical: TextAlignVertical.bottom,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white,
              hintText: "Email",
              prefixIcon: Icon(Icons.email)
            ),
          ),
        ),
      ),
    ),
     Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 8),
      child: SizedBox(
        height: 50,
        child: Material(
          elevation: 8,
          shadowColor: Colors.black87,
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(30),
          child: TextFormField(
            controller: password,
            textAlignVertical: TextAlignVertical.bottom,
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
  
              ),
              filled: true,
              fillColor: Colors.white,
              hintText: "Password",
              prefixIcon: Icon(Icons.password),
            ),
          ),
        ),
      ),
    ),
  
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Text("Memoriser \nMon Identifiant" ,
         style: TextStyle(fontSize: 17 , fontWeight: FontWeight.bold  ),
         ),
         SizedBox(
        width: 100,
        height: 70,
        child: FittedBox(
          fit: BoxFit.fill,
          child: Switch(
            value: switchValue,
            onChanged: ((value){}),
          ),
        ),
      ),
      ],
    ),
        ElevatedButton(
          onPressed: (){
            login.email=email.text;
            login.password=int.parse(password.text);
            // print(login.email);
            // print(login.password);
            if((login.verifier()) != 0 ){
            // print(login.code);
                Get.to(() =>MainInterface());
            }
            print(login.verifier());
        }, child: Text("Se Connecter" ,),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 50 , vertical: 20),
              textStyle: TextStyle(fontSize: 15 , fontWeight: FontWeight.bold)
            ),
            ), 
       
            ],
          )),
          Positioned(
        bottom: 150,  
        left: 110,
         child: GestureDetector(  
                // ignore: prefer_const_constructors
                child: Text("Mot de Passe oubliee ?",
                style: TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(95, 6, 6, 6),
                  decoration: TextDecoration.underline
                ),
                
                ),
              ),
            ),
       Positioned(
            top:80,left:20,
            child: Text("S'authentifier",
            style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color:Color.fromARGB(219, 93, 148, 117) ),),
          ),
        ],
      ),
    );
  }
}