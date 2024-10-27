import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todolist_app/components/my_textfield.dart';
import 'package:todolist_app/constant/constant.dart';
import 'package:todolist_app/screen/sign_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../components/my_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final re_passwordController = TextEditingController();

  void signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, 
          password: passwordController.text
          );
      print("Created account!.");
    } on FirebaseAuthException catch (e) {
      print("Failed to create account!");
    }
    //Add data to firebase on this Friday, so don't dead in late .
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade300,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(15, 80, 15, 10),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome to KUMTNB community',
                  style: textTitle,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'To get started, please provide create an account',
                  style: textSubTitle,
                ),
                const SizedBox(
                  height: 30,
                ),
                MyTextField(
                    controller: nameController,
                    hintText: 'Enter your name',
                    obscureText: false,
                    labelText: 'Name'),
                const SizedBox(
                  height: 20,
                ),
                MyTextField(
                    controller: emailController,
                    hintText: 'Enter your email',
                    obscureText: false,
                    labelText: 'Email'),
                const SizedBox(
                  height: 20,
                ),
                MyTextField(
                    controller: passwordController,
                    hintText: 'Enter your password',
                    obscureText: true,
                    labelText: 'Password'),
                const SizedBox(
                  height: 20,
                ),
                MyTextField(
                    controller: re_passwordController,
                    hintText: 'Enter your name',
                    obscureText: true,
                    labelText: 'Re-password'),
                const SizedBox(
                  height: 20,
                ),
                MyButton(onTap: signUp, hinText: 'Register now'),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Have a member',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignInScreen()));
                      },
                      child: const Text(
                        'Sign in',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
