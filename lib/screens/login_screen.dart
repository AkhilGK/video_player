// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:videoplayer/widgets/formfield.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'VideoMate',
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 300,
                  child: Image.asset(
                      'assets/3d-render-secure-login-password-illustration.jpg'),
                ),
                CustomFormfield(
                  controller: usernameController,
                  hintText: 'Enter Username',
                  label: 'User Name',
                ),
                CustomFormfield(
                  controller: passwordController,
                  hintText: 'Enter Your Password',
                  label: 'Password',
                  obscureText: true,
                  isPassword: true,
                ),
                isLoading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: () {
                          _signInButtonPressed();
                        },
                        child: const Text('Log In')),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _signInButtonPressed() async {
    FocusManager.instance.primaryFocus?.unfocus();
    if (formkey.currentState?.validate() ?? false) {
      setState(() {
        isLoading = false;
      });
      if (passwordController.text.trim() == 'Gs0r0e7!E@' &&
          usernameController.text.trim() == 'glitzadmin@gmail.com') {
        final sharedprefs = await SharedPreferences.getInstance();
        await sharedprefs.setBool('LoggedInState', true);
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ));
      }
      setState(() {
        isLoading = true;
      });
    }
  }
}
