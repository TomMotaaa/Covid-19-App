import 'package:covid_19_app/Screens/details_screen.dart';
import 'package:covid_19_app/constants.dart';
import 'package:covid_19_app/widgets/info_card.dart';
import 'package:covid_19_app/widgets/prevention_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
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
                children: [
                  InfoCard(
                    title: "Casos Confirmados",
                    iconColor: const Color(0xFFFF8C00),
                    effectedNum: 1062,
                    press: () {},
                  ),
                  InfoCard(
                    title: "Total de Mortes",
                    iconColor: const Color(0xFFFF2D55),
                    effectedNum: 75,
                    press: () {},
                  ),
                  InfoCard(
                    title: "Total de Recuperados",
                    iconColor: const Color(0xFF50E3C2),
                    effectedNum: 689,
                    press: () {},
                  ),
                  InfoCard(
                    title: "Novos Casos",
                    iconColor: const Color(0xFF5056D6),
                    effectedNum: 52,
                    press: () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => const DetailsScreen()
                        )
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
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
                    buildPreventation(),
                    const SizedBox(height: 40,),
                    buildHelpCard(context)
                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }

  Row buildPreventation() {
    return Row(
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
                );
  }

  Container buildHelpCard(BuildContext context) {
    return Container(
                  height: 150,
                  width: double.infinity,
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          // O lado esquerdo do padding é 40% do total do width
                          left: MediaQuery.of(context).size.width * .4,
                          top: 20,
                          right: 20
                        ),
                        height: 130,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF60BE93),
                              Color(0xFF1B8D59)
                            ]
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Ligue 192 para \najuda médica!\n",
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: Colors.white
                                ),
                              ),
                              TextSpan(
                                text: "Se algum sintoma aparecer",
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.7),
                                )
                              )
                            ]
                          )
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: SvgPicture.asset("assets/icons/nurse.svg"),
                      ),
                      Positioned(
                        top: 30,
                        right: 10,
                        child: SvgPicture.asset("assets/icons/virus.svg"),
                      )
                    ],
                  ),
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