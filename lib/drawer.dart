import 'package:flutter/material.dart';
import 'package:raramart/router.dart';
import 'package:raramart/screens/profile/profile.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final headerLogo = 'assets/images/raramart-logo.png';
    return Material(
      child: Drawer(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(0, 30, 70, 10),
              child: Container(
                width: 100.0,
                height: 40.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(headerLogo),
                  ),
                ),
              ),
            ),
            Divider(
              color: Colors.black87,
            ),
            const SizedBox(
              height: 10,
            ),
            buildMenuItem(
              text: 'Profile',
              icon: Icons.person,
              onClicked: () => selectedItem(context, 0),
            ),
            const SizedBox(
              height: 10,
            ),
            buildMenuItem(
              text: 'Settings',
              icon: Icons.settings,
              onClicked: () => selectedItem(context, 1),
            ),
            const SizedBox(height: 10),
            buildMenuItem(
              text: 'Contact Us',
              icon: Icons.phone,
              onClicked: () => selectedItem(context, 2),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              color: Colors.black87,
            ),
            SizedBox(
              height: 10,
            ),
            buildMenuItem(
              text: 'Log Out',
              icon: Icons.logout_outlined,
              onClicked: () => selectedItem(context, 3),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    return ListTile(
      leading: Icon(
        icon,
      ),
      title: Text(
        text,
        style: TextStyle(fontSize: 18),
      ),
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    switch (index) {
      case 0:
        {
          Navigator.pushNamed(
            context,
            profile,
          );
          break;
        }

      case 3:
        {
          Navigator.pushNamed(
            context,
            login,
          );
          break;
        }
    }
  }
}
