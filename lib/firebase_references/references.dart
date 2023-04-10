import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

final fireStore = FirebaseFirestore.instance;

final userRF = fireStore.collection("users");
final questionPaperRF = fireStore.collection('questionPapers');
final leaderBoardFR = fireStore.collection('leaderboard');

// DocumentReference recentQuestionsData({required String userId, required String paperId}) =>

// CollectionReference<Map<String, dynamic>>
// recentQuestions({required String userId}) =>
// userRF.doc(userId).collection("myrecent_tests").doc(paperId);
// CollectionReference<Map<String, dynamic>>
// getleaderBoard({required String paperId}) =>
// leaderBoardFR.doc(paperId).collection("scores").doc(paperId);

DocumentReference questionRF({
  required String paperId,
  required String questionId,
}) =>
    questionPaperRF.doc(paperId).collection("questions").doc(questionId);

Reference get firebaseStorage => FirebaseStorage.instance.ref();
