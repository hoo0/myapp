import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/common.dart';
import '../services/station_service.dart';
import '../services/login_service.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(vsync: this, duration: Duration(seconds: 1));
    animationController.repeat(reverse: true);

    loadData();

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(title: Text('appbar')),
      body: Stack(
        // crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CachedNetworkImage(
              width: 453,
              height: 640,
              imageUrl: 'https://cdn.pixabay.com/photo/2022/02/15/09/54/flowers-7014589_960_720.png',
              // placeholder: (context, url) => const SizedBox(
              //   child: CircularProgressIndicator(),
              // ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Positioned(
            bottom: 100,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: FadeTransition(
                opacity: animationController,
                child: const Text('Loading...', textAlign: TextAlign.center),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> loadData() async {
    //station info
    await StationService.getStation();
    await loadEmailPassword();
  }

  Future<void> loadEmailPassword() async {
    final prefs = await SharedPreferences.getInstance();

    final String autoLogin = prefs.getString('autoLogin') ?? 'N';
    final String email = prefs.getString('email') ?? '';
    final String password = prefs.getString('password') ?? '';

    if (autoLogin == 'Y') {
      doLogin(email, password);
    } else {
      Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
    }
  }

  void doLogin(String email, String password) async {
    try {
      var loginData = await LoginService.doLogin(id: email, password: password);
      debugPrint('welcome.doLogin: loginData=$loginData');

      if (loginData['status'] != null && loginData['status'] == 'SUCCESS') {
        Navigator.pushNamedAndRemoveUntil(context, '/schedule', (route) => false);
        return;
      } else {
        Common.showMyDialog(
            context: context,
            message: loginData['message'],
            onPressed: () {
              saveAutoLogin('N');
              Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
            });
      }
    } catch (e) {
      debugPrint('e=$e');
      Common.showMyDialog(
          context: context,
          message: 'exception',
          onPressed: () {
            saveAutoLogin('N');
            Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
          });
    }
  }

  void saveAutoLogin(String autoLogin) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('autoLogin', autoLogin);
  }
}
