import 'package:flutter/material.dart';

import '../services/auth.dart';

class HomePage extends StatelessWidget {
  const HomePage({ required this.auth, super.key});
  final AuthBase auth;
  

  Future<void> signOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      print (e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
