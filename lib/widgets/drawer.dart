import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: context.theme.shadowColor,
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                decoration: BoxDecoration(color: context.theme.shadowColor),
                accountName: Text(
                  "Arish Meghani",
                  style: TextStyle(color: context.accentColor),
                ),
                accountEmail: Text("Amclassics@gmail.com",
                    style: TextStyle(color: context.accentColor)),
                currentAccountPicture: CircleAvatar(
                    backgroundColor: context.theme.shadowColor,
                    backgroundImage: AssetImage("assets/images/avatar1.png")),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.person,
                color: context.accentColor,
              ),
              title: Text(
                'Profile',
                style: TextStyle(
                    color: context.accentColor,
                    fontSize: 19,
                    fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: context.accentColor,
              ),
              title: Text(
                'Home',
                style: TextStyle(
                    color: context.accentColor,
                    fontSize: 19,
                    fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.search,
                color: context.accentColor,
              ),
              title: Text(
                'Search',
                style: TextStyle(
                    color: context.accentColor,
                    fontSize: 19,
                    fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.envelope,
                color: context.accentColor,
              ),
              title: Text(
                'Email us',
                style: TextStyle(
                    color: context.accentColor,
                    fontSize: 19,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
