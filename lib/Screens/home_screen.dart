import 'package:covid_19_app/constants.dart';
import 'package:covid_19_app/widgets/info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
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
              runSpacing: 20,
              spacing: 20,
              children: const [
                InfoCard(
                  title: "Casos Confirmados",
                  iconColor: Color(0xFFFF8C00),
                  effectedNum: 1062,
                ),
                InfoCard(
                  title: "Total de Mortes",
                  iconColor: Color(0xFFFF2D55),
                  effectedNum: 75,
                ),
                InfoCard(
                  title: "Total de Recuperados",
                  iconColor: Color(0xFF50E3C2),
                  effectedNum: 689,
                ),
                InfoCard(
                  title: "Novos Casos",
                  iconColor: Color(0xFF5056D6),
                  effectedNum: 52,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Prevenções",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    PreventionCard(
                      svgSrc: "assets/icons/hand_wash.svg",
                      title: "Lave as Mãos",
                    ),
                    PreventionCard(
                      svgSrc: "assets/icons/use_mask.svg",
                      title: "Use Máscara",
                    ),
                    PreventionCard(
                      svgSrc: "assets/icons/Clean_Disinfect.svg",
                      title: "Limpe/Desinfete",
                    ),
                  ],
                )
              ],
            ),
          )
        ],
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

class PreventionCard extends StatelessWidget {
  final String svgSrc;
  final String title;
  const PreventionCard({
    Key? key, required this.svgSrc, required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(svgSrc),
        Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: kPrimaryColor,
          ),
        )
      ],
    );
  }
}