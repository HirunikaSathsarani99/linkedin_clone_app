import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:linkedin_clone_app/view/styles.dart';
import 'package:linkedin_clone_app/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // device back button navigation
  Future<bool> _onWillPop() async {
    Navigator.pushReplacementNamed(context, '/main');
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop:_onWillPop ,
      
      child: Scaffold(
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenSize.width * 0.07,
            vertical: screenSize.height * 0.05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "E-mail",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
      
              //Email
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.help_outline),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "please enter your email address";
                        }
                        final emailRegExp =
                            RegExp(r'^[a-zA-Z0-9._]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
                        if (!emailRegExp.hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: screenSize.width * 0.05),
      
                    const Text(
                      "Password (6 characters minimum)",
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
      
                    //password
                    TextFormField(
                      controller: passwordController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        suffixIcon: Icon(Icons.help_outline),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "please enter your password";
                        }
      
                        if (value.length < 6) {
                          return 'Eneter a password with at least 6 characters';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
      
              SizedBox(height: screenSize.width * 0.05),
      
              RichText(
                text: const TextSpan(children: [
                  TextSpan(
                    text: "By clicking Accept and register, you agree to the ",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  TextSpan(
                    text: "Terms of Use,",
                    style: TextStyle(
                      fontSize: 12,
                      color: AppStyles.primaryColor,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  TextSpan(
                    text: " the",
                    style: TextStyle(
                      fontSize: 12,
                      color: AppStyles.primaryColor,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  TextSpan(
                    text: " Privacy Policy ",
                    style: TextStyle(
                      fontSize: 12,
                      color: AppStyles.primaryColor,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  TextSpan(
                    text: "and ",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  TextSpan(
                    text: "Cookie Policy ",
                    style: TextStyle(
                      fontSize: 12,
                       color: AppStyles.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: "LinkedIn.",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ]),
                textAlign: TextAlign.center,
                softWrap: true,
              ),
      
              SizedBox(height: screenSize.width * 0.1),
      
              //Accept Button
              Center(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(screenSize.width * 0.8, 50),
                          backgroundColor: AppStyles.primaryColor),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<UserViewModel>().signup(
                              emailController.text, passwordController.text);
                          Navigator.pushReplacementNamed(context, '/home');
                        }
                      },
                      child: const Text(
                        "Accept and register",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      )))
            ],
          ),
        )),
      ),
    );
  }
}
