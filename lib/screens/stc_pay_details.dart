import 'package:flutter/material.dart';
import 'package:gas_station2/screens/wallet%20screen.dart';
import 'package:gas_station2/widgets/custom_primary_button.dart';
import 'amount_summary.dart';
import 'package:gas_station2/utils/constants.dart';

class StcPayDetails extends StatelessWidget {
  StcPayDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _paymentCard("visa_apple.png", "5355 **** SNB Master..."),
        Row(
          children: [
            Image.asset('assets/images/signup.png', height: 100, width: 100),
            const Text(
              'Pay to Gas Station',
              style: TextStyle(color: primaryColor, fontSize: 16),
            ),
          ],
        ),
        const AmountSummary(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: CustomPrimaryButton(
            label: "Place Order",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WalletScreen()),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _paymentCard(String image, String label) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Image.asset('assets/images/$image', width: 50),
          const SizedBox(width: 10),
          Text(label, style: const TextStyle(color: primaryColor)),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios, color: primaryColor),
        ],
      ),
    );
  }
}
