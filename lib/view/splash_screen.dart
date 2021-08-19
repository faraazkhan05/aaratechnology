import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/view/sign_up_page.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const SignUpPage();
      }));
    });
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topCenter, colors: [
        Colors.purple,
        Colors.deepPurple,
      ])),
      child: const Center(
        child: Icon(
          CupertinoIcons.search,
          size: 200,
          color: Colors.white,
        ),
      ),
    );
  }
}
