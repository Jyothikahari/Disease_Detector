import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/language_provider.dart';
import '../l10n/app_strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var provider = Provider.of<LanguageProvider>(context);
    String lang = provider.languageCode;

    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        title: Text(
          AppStrings.text("profile", lang),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            const SizedBox(height: 25),

            // PROFILE IMAGE
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(
                "assets/images/profile.webp",
              ),
            ),

            const SizedBox(height: 15),

            // NAME
            const Text(
              "Gopalan",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            // EMAIL
            const Text(
              "gopalan@email.com",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 20),

            const Divider(),

            profileTile(
              icon: Icons.person,
              title: AppStrings.text("name", lang),
              value: "Gopalan",
            ),

            profileTile(
              icon: Icons.email,
              title: AppStrings.text("email", lang),
              value: "gopalan@email.com",
            ),

            profileTile(
              icon: Icons.phone,
              title: AppStrings.text("phone", lang),
              value: "+91 9876543210",
            ),

            listTile(
              icon: Icons.lock,
              title: AppStrings.text("change_password", lang),
            ),

            listTile(
              icon: Icons.settings,
              title: AppStrings.text("manage_preferences", lang),
            ),

            listTile(
              icon: Icons.logout,
              title: AppStrings.text("logout", lang),
              color: Colors.red,
            ),

          ],
        ),
      ),
    );
  }

  Widget profileTile({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.green),
      title: Text(title),
      trailing: Text(value),
    );
  }

  Widget listTile({
    required IconData icon,
    required String title,
    Color? color,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.green),
      title: Text(
        title,
        style: TextStyle(
          color: color ?? Colors.black,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
      ),
    );
  }
}