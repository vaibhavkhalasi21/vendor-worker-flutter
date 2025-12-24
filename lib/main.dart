import 'package:flutter/material.dart';
import 'package:vendor/Screens/vendor_login.dart';
import 'package:vendor/Screens/vendor_register.dart';

void main() {
  runApp(const Vendor());
}

class Vendor extends StatelessWidget {
  const Vendor({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vendor App',
      home: const VendorLoginScreen(),
    );
  }
}

