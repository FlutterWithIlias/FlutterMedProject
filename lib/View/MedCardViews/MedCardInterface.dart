import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:medical_app/View/MedCardViews/AnalysesInfos/analysesView.dart';
import 'package:medical_app/sqlDb.dart';
import 'package:sizer/sizer.dart';

import '../../Repository/GetDataSqlite.dart';
import '../../ViewModel/AnalysesViewModel.dart';
import '../../ViewModel/LoginViewModel.dart';



class MedCard extends StatelessWidget {
  MedCard({super.key});
   LoginViewModel login = Get.put(LoginViewModel(repository: LoginSqlite()));
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
    IconButton(
      icon: Icon(Icons.search , size: 25.sp,),
      onPressed: () {
        // handle the button press
      },
    ),
  ],
        backgroundColor: Color.fromARGB(255, 55, 137, 57),
        elevation: 0,
       automaticallyImplyLeading: false,
        title: Text("Medical card" , style: TextStyle(fontSize: 18.sp),),
      ),
      body:Container(
        height: MediaQuery.of(context).size.height,
        color: Color.fromARGB(255, 55, 137, 57),
        width: MediaQuery.of(context).size.width,
        child :Column(
          children: [
            Container( 
               width: MediaQuery.of(context).size.width,
               margin: EdgeInsets.only(top: 2.7.h , bottom: 1.5.h , left: 1.5.h , right: 1.5.h),
               height: 13.h,
               decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(15)
               ),
              child: Center(child: Text("+" ,
               style: TextStyle(fontSize: 50.sp , color: Colors.black),
              )
              
              ),
            ),
            Expanded (
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 1.5.h),
                 width: MediaQuery.of(context).size.width,
                 height: double.infinity.h,
                 decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(35) , topRight:Radius.circular(35) ),
                 ),
                child: Column(
                  children: [
                      Container( 
                 padding: EdgeInsets.all(1.5.h) ,
                 width: MediaQuery.of(context).size.width,
                 margin: EdgeInsets.only(top: 3.h ,  bottom: 3.h),
                 height: 17.h,
                 decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: 
                  [
                    BoxShadow(
                    color: Color.fromARGB(255, 193, 191, 191),
                    blurRadius: 10 ,
                    spreadRadius: -1
                  )
                  ]
                 ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                    Column(
                      children: [
                        Text("Medical history",
                        style: TextStyle(fontSize: 17.sp , fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 1.h,),
                        Text(" All your diagnoses are\n stored here",
                        style: TextStyle(fontSize: 15 ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.folder_copy,
                      size: 70.sp,
                      color: Color.fromARGB(255, 55, 137, 57),
                      )
            
                   ],
                ),
              ),
                    Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // ignore: prefer_const_constructors
                            Get.to(()=>AnalysesView());
                          },
                          child: Container( 
                                         width: 45.w,
                                         margin: EdgeInsets.only( bottom: 3.h),
                                         height: 17.h,
                                         decoration: BoxDecoration(
                                          color: Color.fromARGB(255, 255, 255, 255),
                                          borderRadius: BorderRadius.circular(15),
                                          boxShadow: 
                                          [
                                            BoxShadow(
                                            color: Color.fromARGB(255, 193, 191, 191),
                                            blurRadius: 10 ,
                                            spreadRadius: -1
                                          )
                                          ]
                                         ),
                                         padding: EdgeInsets.only(top:1.5.h , left:1.5.h)
                                         ,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                          Icon(Icons.science,
                                          size: 40.sp,
                                          color: Color.fromARGB(255, 55, 137, 57),
                                          ),Text("Analyzes",
                                           style: TextStyle(fontSize: 14.sp , fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 0.1.w,)
                                          ,
                                          Text("UAC, biochemistry...")
                                        ]),
                                      ),
                        ),Container( 
                padding: EdgeInsets.only(top:1.5.h , left:1.5.h),
                 width: 45.w,
                 margin: EdgeInsets.only( bottom: 3.h),
                 height: 17.h,
                 decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: 
                  [
                    BoxShadow(
                    color: Color.fromARGB(255, 193, 191, 191),
                    blurRadius: 10 ,
                    spreadRadius: -1
                  )
                  ]
                 ),
                 child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Icon(Icons.abc,
                  size: 40.sp,
                  color: Color.fromARGB(255, 55, 137, 57),
                  ),Text("Examinations",
                   style: TextStyle(fontSize: 14.sp , fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 0.1.w,)
                  ,
                  Text("Ultasounds,ECG,CT...")
                ]),
              )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                        Container( 
                          padding: EdgeInsets.only(top:1.5.h , left:1.5.h),
                 width: 45.w,
                 height: 17.h,
                 decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: 
                  [
                    BoxShadow(
                    color: Color.fromARGB(255, 193, 191, 191),
                    blurRadius: 10 ,
                    spreadRadius: -1
                  )
                  ]
                 ),
                 child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Icon(Icons.folder_shared_sharp,
                  size: 40.sp,
                  color: Color.fromARGB(255, 55, 137, 57),
                  ),Text("Documents",
                   style: TextStyle(fontSize: 14.sp , fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 0.1.w,)
                  ,
                  Text("Certificates,recipes...")
                ]),
              ),Container( 
                padding: EdgeInsets.only(top:1.5.h , left:1.5.h),
                 width: 45.w,
                 height: 17.h,
                 decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: 
                  [
                    BoxShadow(
                    color: Color.fromARGB(255, 193, 191, 191),
                    blurRadius: 10 ,
                    spreadRadius: -1
                  )
                  ]
                 ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Icon(Icons.account_balance_sharp,
                  size: 40.sp,
                  color: Color.fromARGB(255, 55, 137, 57),
                  ),Text("Refferals",
                   style: TextStyle(fontSize: 14.sp , fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 0.1.w,)
                  ,
                  Text("For examinations...")
                ]),
              )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}