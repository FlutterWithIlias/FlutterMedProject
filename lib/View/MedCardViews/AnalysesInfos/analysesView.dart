// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:medical_app/Repository/GetDataSqlite.dart';
import 'package:medical_app/ViewModel/AnalysesResultsViewModel.dart';
import 'package:medical_app/ViewModel/AnalysesViewModel.dart';
import 'package:sizer/sizer.dart';
import 'package:colorful_circular_progress_indicator/colorful_circular_progress_indicator.dart';
import '../../../Model/etudiantDetails.dart';
import '../../../ViewModel/LoginViewModel.dart';
import 'AnalysesResultsView.dart';

class AnalysesView extends StatelessWidget {
  AnalysesView({super.key});

  AnalysesViewModel analysesViewModel = Get.find();
  AnalysesResultsViewModel analyse = Get.find();
  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              size: 25.sp,
            ),
            onPressed: () {
              // handle the button press
            },
          ),
          IconButton(
            icon: Icon(
              Icons.add,
              size: 25.sp,
            ),
            onPressed: () {
              // handle the button press
            },
          ),
        ],
        backgroundColor: Color.fromARGB(255, 55, 137, 57),
        elevation: 0,
        title: Text(
          "Analyses",
          style: TextStyle(fontSize: 18.sp),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(0.5.h),
        color: Color.fromARGB(255, 55, 137, 57),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(
                    top: 2.7.h, bottom: 1.5.h, left: 1.5.h, right: 1.5.h),
                padding: EdgeInsets.all(1.7.h),
                height: 10.h,
                decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 12.w,
                      height: 12.h,
                      child: Icon(
                        FontAwesomeIcons.circleExclamation,
                        color: Color.fromARGB(255, 214, 94, 94),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          color: Color.fromARGB(26, 233, 170, 165)),
                    ),
                    SizedBox(
                      width: 1.4.h,
                    ),
                    Expanded(
                      child: Text("One of your regular analyses is outdated",
                          style:
                              TextStyle(fontSize: 13.sp, color: Colors.white)),
                    ),
                    Icon(
                      FontAwesomeIcons.chevronRight,
                      color: Color.fromARGB(255, 255, 255, 255),
                      size: 2.h,
                    )
                  ],
                )),
            Expanded(
              child: Container(
                padding:
                    EdgeInsets.symmetric(horizontal: 1.5.h, vertical: 2.8.h),
                width: MediaQuery.of(context).size.width,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(7),
                      bottomRight: Radius.circular(7),
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 30.w,
                        height: 5.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("By novelty"),
                            Icon(
                              Icons.filter_8_rounded,
                              size: 15.sp,
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 221, 214, 214),
                          borderRadius: BorderRadius.all(Radius.circular(14)),
                        ),
                      ),
                      Container(
                        width: 25.w,
                        height: 5.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Filters"),
                            Icon(
                              Icons.file_present_rounded,
                              size: 15.sp,
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 221, 214, 214),
                          borderRadius: BorderRadius.all(Radius.circular(14)),
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 2.5.h),
                      width: MediaQuery.of(context).size.width,
                      height: double.infinity,
                      // ignore: prefer_const_constructors
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(7),
                            bottomRight: Radius.circular(7),
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                      ),

                      child: Obx(
                        () => analysesViewModel.check.value == 0
                            ? Center(
                                child: ColorfulCircularProgressIndicator(
                                  colors: [
                                    Color.fromARGB(255, 44, 172, 50),
                                    Colors.red,
                                    Colors.amber,
                                    Colors.green
                                  ],
                                  strokeWidth: 5,
                                  indicatorHeight: 40,
                                  indicatorWidth: 40,
                                ),
                              )
                            : ListView.builder(
                                itemCount: analysesViewModel
                                    .etud.value.analyses!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () {
                                      analyse.analyse.value = analysesViewModel
                                          .etud.value.analyses![index];
                                      Get.to(() => AnalysesResultsView());
                                    },
                                    child: Container(
                                        margin: EdgeInsets.all(1.2.h),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 15.h,
                                        decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Color.fromARGB(
                                                      255, 193, 191, 191),
                                                  blurRadius: 10,
                                                  spreadRadius: -1)
                                            ]),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 1.5.h, vertical: 2.h),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "${analysesViewModel.etud.value.analyses![index].typeAnalyse}",
                                                  style: TextStyle(
                                                      fontSize: 10.sp,
                                                      color: Colors.grey),
                                                ),
                                                Icon(FontAwesomeIcons
                                                    .ellipsisVertical)
                                              ],
                                            ),
                                            ShowResults(analysesViewModel
                                                .etud
                                                .value
                                                .analyses![index]
                                                .resultatAnalyses),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            Expanded(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "${analysesViewModel.etud.value.analyses![index].etatAnalyse}",
                                                    style: analysesViewModel
                                                                .etud
                                                                .value
                                                                .analyses![
                                                                    index]
                                                                .etatAnalyse
                                                                ?.compareTo(
                                                                    "Normal") ==
                                                            0
                                                        ? TextStyle(
                                                            fontSize: 10.sp,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    29,
                                                                    174,
                                                                    70))
                                                        : TextStyle(
                                                            fontSize: 10.sp,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    208,
                                                                    22,
                                                                    22)),
                                                  ),
                                                  Text(
                                                    "${analysesViewModel.etud.value.analyses![index].dateAnalyse}",
                                                    style: TextStyle(
                                                        fontSize: 10.sp,
                                                        color: Color.fromARGB(
                                                            255, 4, 3, 3)),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        )),
                                  );
                                }),
                      ),
                    ),
                  )
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget ShowResults(List<ResultatAnalyses>? results) {
    String result = "";
    for (int i = 0; i < results!.length; i++) {
      if (i != results.length - 1) {
        result += "${results[i].nomResultat},";
      } else {
        result += "${results[i].nomResultat}";
      }
    }
    return Text(
      result,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontSize: 18.sp, color: Color.fromARGB(255, 0, 0, 0)),
    );
  }
}
