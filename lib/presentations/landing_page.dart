import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spiritual_daily_guide/presentations/onboarding_page.dart';

import '../services/auth.dart';
import 'home_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({required this.auth, super.key});

  final AuthBase auth;
  @override
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: auth.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User? user = snapshot.data;
          if (user == null) {
            return OnboardingPage();
          }
          return HomePage(
            auth: auth,
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('An error occurred ${snapshot.error}'));
        }
        return Scaffold(
          body: CircularProgressIndicator(),
        );
      },
    );
  }
}
