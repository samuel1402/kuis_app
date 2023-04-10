import 'package:get/get.dart';
import 'package:study/controllers/auth_controller.dart';
import 'package:study/controllers/theme_controller.dart';
import 'package:study/services/firebase_storage_service.dart';

import '../controllers/question_papers/question_paper_controller.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
    Get.put(AuthController(), permanent: true);
    Get.put(FirebaseStorageService());
    Get.put(QuestionPaperController());
    //Get.put(NotificationService());
    // Get.lazyPut(() => FireBaseStorageService());
  }
}
