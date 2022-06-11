import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../services/login_service.dart';
import '../widgets/common.dart';
import '../controllers/login_controller.dart';
import '../storage.dart';
import '../services/station_service.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: Duration(seconds: 1));
    animationController.repeat(reverse: true);

    asyncInit();

    var storage = Storage();
    storage.print();
    storage.text = 'aaa';
    storage.print();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  Future<void> asyncInit() async {
    await StationService.initStation();

    await LoginController.loadEmailPassword((autoLogin, email, password) {
      if (autoLogin == 'Y') {
        login(context, email, password);
      } else {
        Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
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

  void login(BuildContext context, String email, String password) async {
    try {
      var loginData = await LoginService.callLogin(id: email, password: password);
      debugPrint('login: loginData=$loginData');

      if (loginData['status'] != null && loginData['status'] == 'SUCCESS') {
        Navigator.pushNamedAndRemoveUntil(context, '/schedule', (route) => false);
        return;
      } else {
        Common.showMyDialog(
            context: context,
            message: loginData['message'],
            onPressed: () {
              LoginController.saveAutoLogin('N');
              Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
            });
      }
    } catch (e) {
      debugPrint('e=$e');

      Common.showMyDialog(
        context: context,
        message: 'exception',
        onPressed: () {
          LoginController.saveAutoLogin('N');
          Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
        },
      );
    }
  }
}
