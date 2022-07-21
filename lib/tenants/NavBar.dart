import 'package:flutter/material.dart';
import 'package:rental_app/pages/auth/welcome_back_page.dart';
import 'package:rental_app/pages/notifications_page.dart';
import 'package:rental_app/pages/settings/legal_about_page.dart';
import 'package:rental_app/pages/settings/settings_page.dart';
import 'package:rental_app/tenants/Screens/Home.dart';
import 'package:rental_app/tenants/add_address_page.dart';
import 'package:rental_app/tenants/category_list_page.dart';
import 'package:rental_app/tenants/chat_page/homePage.dart';

import 'package:rental_app/tenants/profile_page.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('Mr Francis'),
            accountEmail: Text('example@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  'https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
            ),
            title: Text('Home'),
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => MyHomePage())),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Friends'),
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => HomePage())),
          ),
          ListTile(
            leading: Icon(Icons.account_balance_wallet),
            title: Text('Rent Payment'),
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => AddAddressPage())),
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifications'),
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => NotificationsPage())),
            trailing: ClipOval(
              child: Container(
                color: Colors.red,
                width: 20,
                height: 20,
                child: Center(
                  child: Text(
                    '8',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => SettingsPage())),
          ),
          ListTile(
            leading: Icon(Icons.description),
            title: Text('Policies'),
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => LegalAboutPage())),
          ),
          Divider(),
          ListTile(
            title: Text('Exit'),
            leading: Icon(Icons.exit_to_app),
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => WelcomeBackPage())),
          ),
        ],
      ),
    );
  }
}
