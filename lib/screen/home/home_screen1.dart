import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study/controllers/question_papers/question_paper_controller1.dart';

class HomeScreen1 extends StatelessWidget {
  const HomeScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionPaperController1 _questionPaperController1 = Get.find();
    return Scaffold(
        body: Obx(
      () => ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return ClipRRect(
              child: SizedBox(
                  height: 200,
                  width: 200,
                  child: FadeInImage(
                    image: NetworkImage(
                        _questionPaperController1.allPaperImages[index]),
                    placeholder:
                        AssetImage("assets/images/app_splash_logo.png"),
                  )),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: 20,
            );
          },
          itemCount: _questionPaperController1.allPaperImages.length),
    ));
  }
}
