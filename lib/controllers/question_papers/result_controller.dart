import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:study/controllers/auth_controller.dart';
import 'package:study/controllers/question_papers/questions_controller.dart';
import 'package:study/firebase_references/references.dart';

extension ResultController on QuestionsController {
  int get correctQuestionCount => allQuestions
      .where((element) => element.selectedAnswer == element.correctAnswer)
      .toList()
      .length;

  String get correctAnswereQuestions {
    return '$correctQuestionCount out of ${allQuestions.length} are correct';
  }

  String get points {
    var points = (correctQuestionCount / allQuestions.length) *
        100 *
        (questionPaperModel.timeSeconds - remainSeconds) /
        questionPaperModel.timeSeconds *
        100;
    return points.toStringAsFixed(2);
  }

  Future<void> saveTestResult() async {
    var batch = fireStore.batch();
    User? _user = Get.find<AuthController>().getUser();
    if (_user == null) return;
    batch.set(
        userRF
            .doc(_user.email)
            .collection('myrecent_tests')
            .doc(questionPaperModel.id),
        {
          "points": points,
          "correct_count": '$correctQuestionCount/${allQuestions.length}',
          "paper_id": questionPaperModel.id,
          'time': questionPaperModel.timeSeconds - remainSeconds
        });

    batch.set(
        leaderBoardFR
            .doc(questionPaperModel.id)
            .collection('scores')
            .doc(_user.email),
        {
          "points": double.parse(points),
          "correct_count": '$correctQuestionCount/${allQuestions.length}',
          "paper_id": questionPaperModel.id,
          "user_id": _user.email,
          'time': questionPaperModel.timeSeconds - remainSeconds
        });
    await batch.commit();
    print('.....batch comitting...');
    navigateToHome();
  }
}
