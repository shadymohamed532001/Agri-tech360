import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostNavBar extends StatelessWidget {
  const PostNavBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550.h,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FadeInLeft(
                      child: const Text(
                        'Ageratum',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 21),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                FadeInDown(
                  child: const Text(
                    'Ageratum, also known as flossflower, is a popular garden plant known for its attractive blue or purple flowers. However, it is susceptible to a common fungal disease called powdery mildew, which causes a white, powdery coating to form on the leaves and stems of the plant. This disease is spread by spores that are carried by the wind and can infect the plant at any stage of its growth.The disese can weaken the plant and cause it to produce fewer flowers, which can negatively impact its overall health and appearance. To help prevent powdery mildew in Ageratum plants, it is recommended to provide them with adequate air circulation and space between plants to prevent moisture buildup. Additionally, avoid overhead watering and instead water at the base of the plant to prevent excess moisture on the leaves. It may also be helpful to remove any infected leaves or stems from the plant and dispose of them properly to prevent further spread of the disease. With proper care and management, Ageratum plants can continue to thrive and produce beautiful flowers despite the presence of powdery mildew \nAnother way to manage powdery mildew in Ageratum plants is to use a fungicide. Fungicides can be applied to the plant as a preventative measure or as a treatment for existing infections. When choosing a fungicide, it\'s important to select one that is labeled for use on Ageratum and follow the instructions carefully. Some fungicides are systemic, meaning they are absorbed by the plant and provide protection for several weeks, while others are contact fungicides, which only protect the surface of the leaves. It\'s also important to note that fungicides should be used with caution and according to label instructions, as overuse can lead to resistance and environmental concerns. In addition to fungicides, some natural remedies such as neem oil, milk spray, and baking soda solutions have been reported to have some effectiveness against powdery mildew in Ageratum plants. However, their efficacy may vary depending on the severity of the infection and should be used with caution.',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
