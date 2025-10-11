import 'package:flutter/material.dart';
import 'package:gas_station2/utils/constants.dart';

class PaymentMethodSelector extends StatelessWidget {
  final List<String> paymentMethods;
  final int selectedIndex;
  final Function(int) onSelectMethod;

  const PaymentMethodSelector({
    super.key,
    required this.paymentMethods,
    required this.selectedIndex,
    required this.onSelectMethod,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Row(
          children: List.generate(paymentMethods.length, (index) {
            return GestureDetector(
              onTap: () => onSelectMethod(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.symmetric(horizontal: 8),
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: selectedIndex == index ? primaryColor : Colors.grey,
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: index == 2
                    ? Row(
                        children: [
                          Image.asset(paymentMethods[index], height: 40),
                          Image.asset("assets/images/cash2.png"),
                        ],
                      )
                    : Image.asset(paymentMethods[index], height: 40),
              ),
            );
          }),
        ),
      ),
    );
  }
}
