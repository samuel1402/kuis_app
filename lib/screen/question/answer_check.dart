import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study/configs/themes/custom_text_styles.dart';
import 'package:study/controllers/question_papers/questions_controller.dart';
import 'package:study/widgets/common/custom_app_bar.dart';

class AnswerCheck extends GetView<QuestionsController> {
  const AnswerCheck({Key? key}) : super(key: key);
  static const String routeName = "/answercheck";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleWidget: Obx(() => Text(
              'Q. ${(controller.questionIndex.value + 1).toString().padLeft(2, "0")}',
              style: appBarTS,
            )),
      ),
    );
  }
}
