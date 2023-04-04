import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medical_app/test.dart';
import 'package:sizer/sizer.dart';

class ResultsDetailsView extends StatelessWidget {
  ResultsDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Details> d = [
      Details("December 23, 2023", "2.90 mED/I"),
      Details("November 23, 2022", "4.01 mED/I"),
      Details("October 08, 2022", "5.38 mED/I"),
      Details("September 10, 2022", "3.06 mED/I"),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 55, 137, 57),
        elevation: 0,
        actions: [
          Icon(
            FontAwesomeIcons.ellipsisVertical,
            size: 16.sp,
          )
        ],
        title: const Text("Glucose"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(0.5.h),
        color: Color.fromARGB(255, 55, 137, 57),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 43.w,
                  height: 22.w,
                  margin: EdgeInsets.only(
                      top: 2.7.h, bottom: 1.5.h, left: 1.5.h, right: 1.5.h),
                  padding: EdgeInsets.all(1.7.h),
                  decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Your Value",
                            style: TextStyle(
                                fontSize: 12.sp, color: Colors.white)),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text("3.88",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.sp,
                                          color: Colors.white)),
                                  Text("mEd/l",
                                      style: TextStyle(
                                          fontSize: 8.sp, color: Colors.white))
                                ],
                              ),
                              CircleAvatar(
                                  foregroundColor: Colors.red,
                                  backgroundColor:
                                      Color.fromARGB(255, 228, 138, 138),
                                  child: Icon(FontAwesomeIcons.chartLine))
                            ],
                          ),
                        )
                      ]),
                ),
                Container(
                  width: 40.w,
                  height: 22.w,
                  margin: EdgeInsets.only(
                      top: 2.7.h, bottom: 1.5.h, left: 1.5.h, right: 1.5.h),
                  padding: EdgeInsets.all(1.7.h),
                  decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Normal Value",
                            style: TextStyle(
                                fontSize: 12.sp, color: Colors.white)),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text("3.41",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.sp,
                                          color: Colors.white)),
                                  Text("mEd/l",
                                      style: TextStyle(
                                          fontSize: 8.sp, color: Colors.white))
                                ],
                              ),
                              CircleAvatar(
                                  foregroundColor:
                                      Color.fromARGB(255, 49, 129, 51),
                                  child: Icon(FontAwesomeIcons.check))
                            ],
                          ),
                        )
                      ]),
                )
              ],
            ),
            Expanded(
              child: Container(
                padding:
                    EdgeInsets.symmetric(horizontal: 2.5.h, vertical: 2.8.h),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Glucos graph by month:",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15.sp),
                    ),
                    Stack(
                      children: <Widget>[
                        AspectRatio(
                          aspectRatio: 1.25.sp,
                          child: DecoratedBox(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(18),
                              ),
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                right: 1.9.h,
                                left: 1.8.h,
                                top: 2.4.h,
                                bottom: 1.2.h,
                              ),
                              child: LineChart(
                                showAvg ? avgData() : mainData(),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                          height: 5.h,
                          child: TextButton(
                            onPressed: () {
                              //  setState(() {
                              //   showAvg = !showAvg;
                              // });
                            },
                            child: Text(
                              'Avg',
                              style: TextStyle(
                                fontSize: 12,
                                color: showAvg
                                    ? Color.fromARGB(255, 0, 0, 0)
                                        .withOpacity(0.5)
                                    : Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "History (Last four months)",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15.sp),
                    ),
                    ...List.generate(
                        d.length,
                        (index) => Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 0.6.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        d[index].date,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 11.sp),
                                      ),
                                      Text(
                                        d[index].rate,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 11.sp),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  thickness: 0.2.h,
                                )
                              ],
                            ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color.fromARGB(255, 0, 0, 0),
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('MAR', style: style);
        break;
      case 2:
        text = const Text('JUN', style: style);
        break;
      case 4:
        text = const Text('SEP', style: style);
        break;
      case 6:
        text = const Text('OCT', style: style);
        break;
      case 8:
        text = const Text('NOV', style: style);
        break;
      case 10:
        text = const Text('DEC', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff67727d),
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = '0';
        break;
      case 1:
        text = '1';
        break;
      case 2:
        text = '2';
        break;
      case 3:
        text = '3';
        break;
      case 4:
        text = '4';
        break;
      case 5:
        text = '5';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: false,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: Color.fromARGB(255, 255, 255, 255)),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 1.5),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 4),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData avgData() {
    return LineChartData(
      lineTouchData: LineTouchData(enabled: false),
      gridData: FlGridData(
        show: true,
        drawHorizontalLine: true,
        verticalInterval: 1,
        horizontalInterval: 1,
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: bottomTitleWidgets,
            interval: 1,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
            interval: 1,
          ),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3.83),
            FlSpot(2.6, 3.83),
            FlSpot(4.9, 3.83),
            FlSpot(6.8, 3.83),
            FlSpot(8, 3.83),
            FlSpot(9.5, 3.83),
            FlSpot(11, 3.83),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: [
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(0.2)!,
              ColorTween(begin: gradientColors[0], end: gradientColors[1])
                  .lerp(0.2)!,
            ],
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [
                ColorTween(begin: gradientColors[0], end: gradientColors[1])
                    .lerp(0.2)!
                    .withOpacity(0.1),
                ColorTween(begin: gradientColors[0], end: gradientColors[1])
                    .lerp(0.2)!
                    .withOpacity(0.1),
              ],
            ),
          ),
        ),
      ],
    );
  }

  List<Color> gradientColors = [
    Color.fromARGB(255, 55, 137, 57),
    Color.fromARGB(255, 97, 222, 133),
  ];

  bool showAvg = false;
}
