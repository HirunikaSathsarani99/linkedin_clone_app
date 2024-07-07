import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:linkedin_clone_app/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool passwordVisble = false;

  // device back button navigation
  Future<bool> _onWillPop() async {
    Navigator.pushReplacementNamed(context, '/main');
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final ScreenSize = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenSize.width * 0.08,
              vertical: ScreenSize.height * 0.05,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Sign in",
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Stay updated on your professional world",
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: ScreenSize.width * 0.1),

                //Email
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          labelText: 'Email or Phone',
                          labelStyle:
                              TextStyle(fontSize: 18, color: Colors.grey),
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your email or phone number";
                          }

                          final emailRegExp = RegExp(
                              r'^[a-zA-Z0-9._]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
                          final phoneRegExp = RegExp(r'^\+?[0-9]{10,}$');

                          if (!emailRegExp.hasMatch(value) &&
                              !phoneRegExp.hasMatch(value)) {
                            return 'Please enter a valid email address or phone number';
                          }

                          return null;
                        },
                      ),

                      SizedBox(height: ScreenSize.width * 0.05),

                      //password
                      TextFormField(
                        controller: passwordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your password";
                          }

                          return null;
                        },
                        decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: const TextStyle(
                                fontSize: 18, color: Colors.grey),
                            border: OutlineInputBorder(),
                            suffixIcon: TextButton(
                                onPressed: () {
                                  setState(() {
                                    passwordVisble = !passwordVisble;
                                  });
                                },
                                child: passwordVisble
                                    ? const Text(
                                        "Hide",
                                        style: TextStyle(color: Colors.blue),
                                      )
                                    : const Text("Show",
                                        style: TextStyle(color: Colors.blue)))),
                        obscureText: !passwordVisble,
                      ),
                    ],
                  ),
                ),

                SizedBox(height: ScreenSize.width * 0.05),

                const Text(
                  "Forgot Password?",
                  style: TextStyle(
                      fontSize: 16.0, color: Color.fromARGB(255, 19, 119, 201)),
                ),

                SizedBox(height: ScreenSize.width * 0.1),

                //signIn
                Center(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(ScreenSize.width * 0.8, 50),
                            backgroundColor: Color.fromARGB(255, 19, 119, 201)),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<UserViewModel>().login(
                                emailController.text, passwordController.text);
                            Navigator.pushReplacementNamed(context, '/home');
                          }
                        },
                        child: const Text(
                          "Sign in",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        )))
              ],
            ),
          ),
        )),
      ),
    );
  }
}
