import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:medical_app/Model/AnalysesModel.dart';
import 'package:medical_app/View/MedCardViews/AnalysesInfos/ResultsDetailsView.dart';
import 'package:medical_app/ViewModel/AnalysesResultsViewModel.dart';
import 'package:sizer/sizer.dart';

import '../../../Model/etudiantDetails.dart';

class AnalysesResultsView extends StatelessWidget {
  AnalysesResultsView({super.key});
  AnalysesResultsViewModel analyses = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 55, 137, 57),
          elevation: 0,
          actions: [
            Icon(
              FontAwesomeIcons.ellipsisVertical,
              size: 16.sp,
            )
          ],
          title: ShowResults(analyses.analyse.value.resultatAnalyses),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(0.5.h),
          color: Color.fromARGB(255, 55, 137, 57),
          width: MediaQuery.of(context).size.width,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 2.5.h, vertical: 2.8.h),
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
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Blood Test",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15.sp),
                    ),
                    SizedBox(
                      height: 2.5.h,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 7.h,
                          height: 7.h,
                          child: Icon(
                            FontAwesomeIcons.calendar,
                            color: Color.fromARGB(255, 68, 69, 91),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              color: Color.fromARGB(255, 196, 198, 249)),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("Date", style: TextStyle(color: Colors.grey)),
                            SizedBox(
                              height: 1.3.h,
                            ),
                            Text("${analyses.analyse.value.dateAnalyse}",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                        SizedBox(
                          width: 17.w,
                        ),
                        Container(
                          width: 7.h,
                          height: 7.h,
                          child: analyses.analyse.value.etatAnalyse
                                      ?.compareTo("Deviation") ==
                                  0
                              ? Icon(FontAwesomeIcons.circleExclamation,
                                  color: Color.fromARGB(255, 235, 115, 115))
                              : Icon(FontAwesomeIcons.check,
                                  color: Color.fromARGB(255, 22, 166, 25)),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              color: Color.fromARGB(26, 112, 124, 215)),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("Result",
                                style: TextStyle(color: Colors.grey)),
                            SizedBox(
                              height: 1.3.h,
                            ),
                            Text("${analyses.analyse.value.etatAnalyse}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.sp)),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 3.5.h,
                    ),
                    Text(
                      "Clinic or laboratory",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15.sp),
                    ),
                    SizedBox(
                      height: 2.5.h,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 7.h,
                          height: 7.h,
                          child: Icon(
                            FontAwesomeIcons.locationDot,
                            color: Color.fromARGB(255, 22, 166, 25),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              color: Color.fromARGB(255, 188, 243, 189)),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                                "${analyses.analyse.value.laboratoires![0].nomLabo}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 22, 166, 25),
                                    fontSize: 12.sp)),
                            SizedBox(
                              height: 1.3.h,
                            ),
                            Text(
                                "${analyses.analyse.value.laboratoires![0].localisation}",
                                style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 3.5.h,
                    ),
                    Text(
                      "Analysis results",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15.sp),
                    ),
                    SizedBox(
                      height: 2.5.h,
                    ),
                    ...List.generate(
                        analyses.analyse.value.resultatAnalyses!.length,
                        (index) => GestureDetector(
                              onTap: () => Get.to(() => ResultsDetailsView()),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 1.5.h, vertical: 2.h),
                                margin: EdgeInsets.all(1.2.h),
                                width: MediaQuery.of(context).size.width,
                                height: 11.h,
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color.fromARGB(
                                              255, 193, 191, 191),
                                          blurRadius: 10,
                                          spreadRadius: -1)
                                    ]),
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: 50.w,
                                            child: Text(
                                              "${analyses.analyse.value.resultatAnalyses![index].nomResultat}",
                                              style:
                                                  TextStyle(fontSize: 13.5.sp),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Text(
                                            "${analyses.analyse.value.resultatAnalyses![index].degre}",
                                            style: TextStyle(
                                                fontSize: 10.sp,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: 50.w,
                                            child: Text("Standard",
                                                style: TextStyle(
                                                    fontSize: 9.sp,
                                                    color: Colors.grey)),
                                          ),
                                          Text(
                                            "${analyses.analyse.value.resultatAnalyses![index].standart}",
                                            style: TextStyle(
                                                fontSize: 10.sp,
                                                color: Colors.black),
                                          ),
                                        ],
                                      )
                                    ]),
                              ),
                            )),
                    SizedBox(
                      height: 3.5.h,
                    ),
                    Text(
                      "Download Files",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15.sp),
                    ),
                    SizedBox(
                      height: 2.5.h,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 7.h,
                          height: 7.h,
                          child: Icon(
                            FontAwesomeIcons.download,
                            color: Color.fromARGB(255, 96, 98, 96),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                              color: Color.fromARGB(255, 202, 204, 202)),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                                "${analyses.analyse.value.analyseDocument}.pdf",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 22, 166, 25),
                                    fontSize: 12.sp)),
                            SizedBox(
                              height: 1.3.h,
                            ),
                            Text("4.2MB", style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
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
