import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'vendor_login.dart';

class VendorProfileTab extends StatefulWidget {
  const VendorProfileTab({super.key});

  @override
  State<VendorProfileTab> createState() => _VendorProfileTabState();
}

class _VendorProfileTabState extends State<VendorProfileTab> {
  String vendorName = "";
  String vendorEmail = "";

  @override
  void initState() {
    super.initState();
    loadVendorData();
  }

  Future<void> loadVendorData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      vendorName = prefs.getString("vendor_name") ?? "Vendor Name";
      vendorEmail = prefs.getString("vendor_email") ?? "vendor@email.com";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 40,
            child: Icon(Icons.person, size: 40),
          ),
          const SizedBox(height: 12),
          Text(
            vendorName,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(vendorEmail),
          const SizedBox(height: 20),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text("Edit Profile"),
            onTap: () {},
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              icon: const Icon(Icons.logout),
              label: const Text("Logout"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const VendorLoginScreen()),
                      (route) => false,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
