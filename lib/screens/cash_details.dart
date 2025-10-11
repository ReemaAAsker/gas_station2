import 'package:flutter/material.dart';
import 'package:gas_station2/screens/wallet%20screen.dart';
import 'package:gas_station2/utils/constants.dart';
import 'package:gas_station2/widgets/custom_primary_button.dart';
import 'amount_summary.dart';

class CashDetails extends StatelessWidget {
  const CashDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "You will Pay after delivered your fuel.",
            style: scoundryTextStyle,
          ),
          const SizedBox(height: 16),
          const AmountSummary(),
          const Spacer(),
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
      ),
    );
  }
}
