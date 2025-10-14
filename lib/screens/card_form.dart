import 'package:flutter/material.dart';
import 'package:gas_station2/screens/wallet%20screen.dart';
import 'package:gas_station2/widgets/custom_primary_button.dart';
import 'package:gas_station2/widgets/orange_text_feild.dart';
import '../utils/constants.dart' show primaryColor;
import 'amount_summary.dart';

class CardForm extends StatefulWidget {
  const CardForm({super.key});

  @override
  State<CardForm> createState() => _CardFormState();
}

class _CardFormState extends State<CardForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text(
              'the order is placed',
              style: const TextStyle(color: Colors.white),
            ),
            backgroundColor: primaryColor,
            behavior: SnackBarBehavior.floating,
            margin: const EdgeInsets.all(12),
            duration: const Duration(seconds: 2),
          ),
        );
      // All validations passed
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const WalletScreen()),
      );
    }
  }

  String? _validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter the name on card';
    }
    return null;
  }

  String? _validateCardNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter the card number';
    }
    final digitsOnly = value.replaceAll(RegExp(r'\D'), '');
    if (digitsOnly.length != 16) {
      return 'Card number must be 16 digits';
    }
    return null;
  }

  String? _validateExpiry(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Enter expiration date';
    }

    final parts = value.split('/');
    if (parts.length != 2 ||
        parts[0].length != 2 ||
        parts[1].length != 2 ||
        int.tryParse(parts[0]) == null ||
        int.tryParse(parts[1]) == null) {
      return 'Invalid format. Use MM/YY';
    }

    int month = int.parse(parts[0]);
    int year = int.parse(parts[1]) + 2000;
    if (month < 1 || month > 12) {
      return 'Invalid month';
    }

    final now = DateTime.now();
    final expiryDate = DateTime(year, month + 1, 0);
    if (expiryDate.isBefore(now)) {
      return 'Card expired';
    }

    return null;
  }

  String? _validateCVV(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter CVV';
    }
    if (value.length != 3 || int.tryParse(value) == null) {
      return 'CVV must be 3 digits';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Name on Card',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            OrangeTextField(
              hint: "Name",
              controller: _nameController,
              validator: _validateName,
            ),
            const SizedBox(height: 16),

            const Text(
              'Card Number',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            OrangeTextField(
              hint: "1111 2222 3333 4444",
              controller: _cardNumberController,
              keyboardType: TextInputType.number,
              validator: _validateCardNumber,
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Expiration date',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      OrangeTextField(
                        hint: "MM/YY",
                        controller: _expiryController,
                        keyboardType: TextInputType.datetime,
                        validator: _validateExpiry,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'CVV',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      OrangeTextField(
                        hint: "123",
                        controller: _cvvController,
                        keyboardType: TextInputType.number,
                        validator: _validateCVV,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
            const AmountSummary(),
            const SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: CustomPrimaryButton(
                label: "Place Order",
                onPressed: _submitForm,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
