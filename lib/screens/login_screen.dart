import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:myapp/controllers/login_controller.dart';

import '../constants.dart';
import '../widgets/common.dart';
import '../services/login_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool showSpinner = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    LoginController.loadEmailPassword((autoLogin, email, password) {
      emailController.text = email;
      passwordController.text = password;

      if (autoLogin == 'Y') {
        doLogin();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('login')),
      body: LoadingOverlay(
        isLoading: showSpinner,
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
                onPressed: doLogin,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void doLogin() async {
    setState(() {
      showSpinner = true;
    });

    try {
      var loginData = await LoginService.callLogin(id: emailController.text, password: passwordController.text);
      debugPrint('login_screen.doLogin: loginData=$loginData');

      if (loginData['status'] != null && loginData['status'] == 'SUCCESS') {
        LoginController.saveEmailPassword(emailController.text, passwordController.text);
        Navigator.pushNamedAndRemoveUntil(context, '/schedule', (route) => false);
      } else {
        LoginController.saveAutoLogin('N');
        Common.showMyDialog(context: context, message: loginData['message']);
      }
    } catch (e) {
      debugPrint('e=$e');

      Common.showMyDialog(context: context, message: e.toString());
    }

    setState(() {
      showSpinner = false;
    });
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
