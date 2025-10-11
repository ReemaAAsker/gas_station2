import 'package:flutter/material.dart';
import 'package:gas_station2/screens/apple_pay_details.dart';
import 'package:gas_station2/screens/card_form.dart';
import 'package:gas_station2/screens/cash_details.dart';
import 'package:gas_station2/screens/payment_method_selector.dart';
import 'package:gas_station2/screens/stc_pay_details.dart';
import 'package:gas_station2/screens/wallet%20screen.dart';
import 'package:gas_station2/utils/constants.dart';
import 'package:gas_station2/widgets/custom_back_button.dart';
import 'package:gas_station2/widgets/custom_primary_button.dart';

class CardDetailsScreen extends StatefulWidget {
  const CardDetailsScreen({super.key});

  @override
  State<CardDetailsScreen> createState() => _CardDetailsScreenState();
}

class _CardDetailsScreenState extends State<CardDetailsScreen> {
  int selectedIndex = 0;
  final PageController _pageController = PageController();

  final List<String> paymentMethods = [
    "assets/images/mada.png",
    "assets/images/visa.png",
    "assets/images/cash1.png",
    "assets/images/apple_pay.png",
    "assets/images/stc_pay.png",
  ];

  void onSelectMethod(int index) {
    setState(() {
      selectedIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(10),
          child: CustomBackButton(),
        ),
        title: const Text(
          "Card Details",
          style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.account_balance_wallet, color: Colors.blue),
            label: const Text(
              "your wallet",
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          PaymentMethodSelector(
            paymentMethods: paymentMethods,
            selectedIndex: selectedIndex,
            onSelectMethod: onSelectMethod,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  CardForm(),
                  CardForm(),
                  CashDetails(),
                  ApplePayDetails(),
                  StcPayDetails(),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: const Color(0xFF6DB944),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
      ),
    );
  }
}
