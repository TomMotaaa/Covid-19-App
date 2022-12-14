import 'package:covid_19_app/constants.dart';
import 'package:covid_19_app/widgets/line_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final int effectedNum;
  final Color iconColor;
  final VoidCallback press;
  const InfoCard({
    Key? key, required this.title, required this.effectedNum, required this.iconColor, required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return GestureDetector(
          onTap: press,
          child: Container(
            width: constraints.maxWidth / 2 - 10, // nos forneçe a largura disponível para o widget
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
                          color: iconColor.withOpacity(0.12),
                          shape: BoxShape.circle
                        ),
                        child: SvgPicture.asset(
                          "assets/icons/running.svg", 
                          height: 12, 
                          width: 12,
                          color: iconColor,
                        ),
                      ),
                      const SizedBox(width: 5,),
                      Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: RichText(text: TextSpan(
                          style: const TextStyle(
                            color: kTextColor
                          ),
                          children: [
                            TextSpan(
                              text: "$effectedNum \n",
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
                  ),
                )
              ],
            ),
          ),
        );
      }
    );
  }
}