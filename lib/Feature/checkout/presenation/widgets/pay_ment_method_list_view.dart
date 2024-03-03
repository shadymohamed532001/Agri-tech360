import 'package:flutter/material.dart';
import 'package:smartsoil/Feature/checkout/presenation/widgets/pay_ment_mehtod_items.dart';

class PayMentMethodListView extends StatefulWidget {
  const PayMentMethodListView({super.key});

  @override
  State<PayMentMethodListView> createState() => _PayMentMethodListViewState();
}

class _PayMentMethodListViewState extends State<PayMentMethodListView> {
  final List<String> payMentMethodsItems = const [
    'assets/images/card.png',
    'assets/images/paypal.png'
  ];

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 65,
        child: ListView.builder(
          itemCount: payMentMethodsItems.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: GestureDetector(
                onTap: () {
                  activeIndex = index;
                  setState(() {});
                },
                child: PayMentMehtodItems(
                  isActive: activeIndex == index,
                  image: payMentMethodsItems[index],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
