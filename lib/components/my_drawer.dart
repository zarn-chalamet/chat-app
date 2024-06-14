import 'package:chatapp/services/auth/auth_service.dart';
import 'package:chatapp/pages/setting.dart';
import 'package:flutter/material.dart';

class myDrawer extends StatefulWidget {
  const myDrawer({super.key});

  @override
  State<myDrawer> createState() => _myDrawerState();
}

class _myDrawerState extends State<myDrawer> {
  void logout() {
    final _auth = AuthService();
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                  child: Icon(
                Icons.chat,
                size: 50,
              )),
              Padding(
                padding: EdgeInsets.only(left: 25),
                child: ListTile(
                  title: Text('C H A T S'),
                  leading: Icon(Icons.messenger_outline),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 25),
                child: ListTile(
                  title: Text('S E T T I N G'),
                  leading: Icon(Icons.settings),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Setting()));
                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 25, bottom: 15),
            child: ListTile(
              title: Text('L O G O U T'),
              leading: Icon(Icons.logout_outlined),
              onTap: logout,
            ),
          )
        ],
      ),
    );
  }
}
