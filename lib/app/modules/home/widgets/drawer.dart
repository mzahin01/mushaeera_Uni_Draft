import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DrawerMade extends StatelessWidget {
  const DrawerMade({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text(
            'Drawer Header',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Home'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Settings'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.contacts),
          title: const Text('Contacts'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        const Expanded(
            child: SizedBox(
          height: 10,
        )),
        ElevatedButton(
          onPressed: () {
            FirebaseAuth.instance.signOut();
            Navigator.pop(context);
          },
          child: const Icon(Icons.logout),
        )
      ],
    );
  }
}
