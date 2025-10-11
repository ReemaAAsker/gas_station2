import 'package:flutter/material.dart';

class AmountSummary extends StatelessWidget {
  const AmountSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text("Total Amount",
            style: TextStyle(
                fontSize: 16, color: Colors.black54, fontWeight: FontWeight.bold)),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'SAR ',
              style: TextStyle(fontSize: 16, color: Color(0xFF2D3142), fontWeight: FontWeight.bold),
            ),
            Text(
              '24',
              style: TextStyle(fontSize: 20, color: Color(0xFF2D3142), fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
