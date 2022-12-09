import 'package:covid_19_app/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Container(
        padding: const EdgeInsets.only(left: 20, top: 20, right: 20 ,bottom: 40),
        width: double.infinity,
        decoration: BoxDecoration(
          color: kPrimaryColor.withOpacity(0.03),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(50),
            bottomRight: Radius.circular(50),
          )
        ),
        child: Wrap(
          children: [
            Container(
              width: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8)
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFF9C00).withOpacity(0.12),
                            shape: BoxShape.circle
                          ),
                          child: SvgPicture.asset(
                            "assets/icons/running.svg", 
                            height: 12, 
                            width: 12,
                          ),
                        ),
                        const SizedBox(width: 5,),
                        const Text(
                          "Casos Confirmados",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: RichText(text: TextSpan(
                          style: const TextStyle(
                            color: kTextColor
                          ),
                          children: [
                            TextSpan(
                              text: "1.062 \n",
                              style: 
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold
                              )
                            ),
                            const TextSpan(
                              text: "Pessoas",
                              style: TextStyle(
                                fontSize: 12,
                                height: 2,
                              )
                            )
                          ]
                        )),
                      ),
                      const Expanded(
                        child: LineReportChart()
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor.withOpacity(.03),
      elevation: 0,
      leading: IconButton(
        onPressed: () {}, 
        icon: const Icon(Icons.menu, color: kPrimaryColor, size: 30.0)
      ),
      actions: [
        IconButton(
          onPressed: () {}, 
          icon: const Icon(Icons.search, color: kPrimaryColor, size: 30.0,)
        )
      ],
    );
  }
}

class LineReportChart extends StatelessWidget {
  const LineReportChart({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.2,
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              spots: getSports(),
            )
          ],
        )
      ),
    );
  }

  List<FlSpot> getSports() {
    return [
      const FlSpot(0, .5),
      const FlSpot(1, 1.5),
      const FlSpot(2, .5),
      const FlSpot(3, .7),
      const FlSpot(4, .2),
      const FlSpot(5, 2),
      const FlSpot(6, 1.5),
      const FlSpot(7, 1.7),
      const FlSpot(8, 1),
      const FlSpot(9, 2.8),
      const FlSpot(10, 2.5),
      const FlSpot(11, 2.65),
    ];
  }
}