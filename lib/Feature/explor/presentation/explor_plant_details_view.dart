import 'package:flutter/material.dart';
import 'package:smartsoil/Feature/explor/presentation/widgets/sss.dart';

class ExplorPlantDetailsView extends StatelessWidget {
  const ExplorPlantDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/plant.jpeg'),
            fit: BoxFit.cover,
            opacity: 0.8,
          ),
        ),
      ),
      bottomNavigationBar: const PostNavBar(),
    );
  }
}
