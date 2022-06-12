import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../constants.dart';
import '../controllers/login_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    LoginController.loadEmailPassword((autoLogin, email, password) {
      emailController.text = email;
      passwordController.text = password;

      if (autoLogin == 'Y') {
        LoginController.doLogin(context, emailController.text, passwordController.text);
      }
    });

    return Scaffold(
      appBar: AppBar(title: Text('login')),
      body: LoaderOverlay(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // Flexible(
              //   child: Hero(
              //     tag: 'logo',
              //     child: Container(
              //       height: 200.0,
              //       child: Image.asset('images/logo.png'),
              //     ),
              //   ),
              // ),
              SizedBox(height: 48.0),
              TextField(
                controller: emailController,
                textAlign: TextAlign.center,
                decoration: kTextFieldDecoration.copyWith(hintText: 'Enter your email'),
              ),
              SizedBox(height: 8.0),
              TextField(
                controller: passwordController,
                textAlign: TextAlign.center,
                obscureText: true,
                decoration: kTextFieldDecoration.copyWith(hintText: 'Enter your password.'),
              ),
              SizedBox(height: 24.0),
              RoundedButton(
                title: 'Log In',
                color: Colors.lightBlueAccent,
                onPressed: () => LoginController.doLogin(context, emailController.text, passwordController.text),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  final String title;
  final Color color;
  final Function()? onPressed;

  const RoundedButton({Key? key, required this.title, required this.color, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
