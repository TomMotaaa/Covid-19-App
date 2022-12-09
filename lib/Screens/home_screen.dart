import 'package:covid_19_app/constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
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