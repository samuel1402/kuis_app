import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:study/controllers/auth_controller.dart';
import 'package:study/firebase_references/references.dart';
import 'package:study/models/question_paper_model.dart';
import 'package:study/screen/question/questions_screen.dart';
import 'package:study/services/firebase_storage_service.dart';

class QuestionPaperController1 extends GetxController {
  final allPaperImages = <String>[].obs;
  final allPapers = <QuestionPaperModel>[].obs;

  @override
  void onReady() {
    getAllPapers();
    super.onReady();
  }

  Future<void> getAllPapers() async {
    List<String> imgName = ["biologi", "fisika", "mtk", "ppkn"];
    try {
      // QuerySnapshot<Map<String, dynamic>> data = await questionPaperRF.get();
      // final paperList = data.docs
      //     .map((paper) => QuestionPaperModel.fromSnapshot(paper))
      //     .toList();
      // allPapers.assignAll(paperList);
      for (var img in imgName) {
        final imgUrl = await Get.find<FirebaseStorageService>().getImage(img);
        allPaperImages.add(imgUrl!);
        // paper.imageUrl = imgUrl;
        // print(imgUrl);
      }
      // allPapers.assignAll(paperList);
    } catch (e) {
      print(e);
    }
  }

  // void navigateToQuestions(
  //     {required QuestionPaperModel paper, bool tryAgain = false}) {
  //   AuthController _authController = Get.find();
  //   if (_authController.isLoggedIn()) {
  //     if (tryAgain) {
  //       Get.back();
  //       // Get.offNamed();
  //     } else {
  //       Get.toNamed(QuestionsScreen.routeName, arguments: paper);
  //     }
  //   } else {
  //     // print('The title is ${paper.title}');
  //     _authController.showLoginAlertDialogue();
  //   }
  // }
}
