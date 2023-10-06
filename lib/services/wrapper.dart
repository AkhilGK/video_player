import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:videoplayer/screens/home_screen.dart';
import 'package:videoplayer/screens/login_screen.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  late var sharedPrefs;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sharedPrefs = getLog();
  }

  @override
  Widget build(BuildContext context) {
    final userLoggedIn = sharedPrefs.getBool('LoggedInState');
    if (userLoggedIn == null || userLoggedIn == false) {
      return const LoginScreen();
    } else {
      return const HomeScreen();
    }
  }

  getLog() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs;
  }
}
