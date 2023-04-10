import 'package:flutter/material.dart';
//import 'package:flutter/src/widgets/container.dart';
//import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:study/widgets/app_circle_button.dart';
//import 'package:get/get_navigation/src/extension_navigation.dart';
import '../../configs/themes/app_colors.dart';
import 'package:study/routes/app_routes.dart';

class AppIntroductionScreen extends StatelessWidget {
  const AppIntroductionScreen({Key? key}) : super(key: key);
  static const String routeName = "/homescreen";
  get style => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(gradient: mainGradient()),
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.star, size: 65),
                  SizedBox(height: 40),
                  const Text(
                    'This is a flutter firebase complete app tutorial for ios and android using firebase, firebase firestore, firebase storage, google sign in, with two themes from scratch',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 18,
                        color: onSurfaceTextColor,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                      style: style,
                      onPressed: () => Get.offAndToNamed("/home"),
                      child: const Icon(Icons.arrow_forward, size: 35)),
                  // AppCircleButton(
                  //     onTap: null,
                  //     onPressed: () => Get.offAndToNamed("/home"),
                  //     child: const Icon(Icons.arrow_forward, size: 35))
                ],
              ),
            )));
  }
}
