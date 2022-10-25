import 'package:flutter/material.dart';
import 'package:spiritual_daily_guide/widgets/show_alert_dialogue.dart';

import '../services/auth.dart';

class HomePage extends StatelessWidget {
  const HomePage({required this.auth, super.key});
  final AuthBase auth;

  Future<void> _signOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  Future _confirmSignOut(BuildContext context) async {
    final didRequestSignOut = await showAlertDialogue(context,
        title: 'Logout',
        content: 'Are you sure you want to logout',
        defaultActionText: 'logout',
        cancelActionText: 'cancel');
    if (didRequestSignOut == true) {
      _signOut();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home'), leading: Drawer(), actions: [
        TextButton(
          child: Text('Logout'),
          onPressed: () =>_confirmSignOut(context),
        )
      ]),
    );
  }
}
