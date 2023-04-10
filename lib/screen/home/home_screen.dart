import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:study/configs/themes/app_colors.dart';
import 'package:study/configs/themes/app_icons.dart';
import 'package:study/configs/themes/custom_text_styles.dart';
import 'package:study/configs/themes/ui_parameters.dart';
import 'package:study/controllers/zoom_drawer_controller.dart';
import 'package:study/screen/home/menu_screen.dart';
import 'package:study/screen/home/question_card.dart';
import 'package:study/controllers/question_papers/question_paper_controller.dart';
import 'package:study/widgets/app_circle_button.dart';
import 'package:study/widgets/content_area.dart';

class HomeScreen extends GetView<MyZoomDrawerController> {
  const HomeScreen({Key? key}) : super(key: key);
  // static const String routeName = "/homescreen";
  @override
  Widget build(BuildContext context) {
    QuestionPaperController questionPaperController = Get.find();
    return Scaffold(
      body: GetBuilder<MyZoomDrawerController>(builder: (_) {
        return ZoomDrawer(
          borderRadius: 50.0,
          controller: _.zoomDrawerController,
          showShadow: true,
          angle: 0.0,
          style: DrawerStyle.DefaultStyle,
          backgroundColor: Colors.white.withOpacity(0.3),
          slideWidth: MediaQuery.of(context).size.width * 0.4,
          menuScreen: MyMenuScreen(),
          mainScreen: Container(
            decoration: BoxDecoration(gradient: mainGradient()),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(mobileScreenPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppCircleButton(
                          child: const Icon(
                            MaterialIcons.menuLeft,
                          ),
                          onTap: controller.toogleDrawer,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              const Icon(
                                MaterialIcons.menuP,
                              ),
                              Text(
                                "Heloo Friend",
                                style: detailText.copyWith(
                                    color: onSurfaceTextColor),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "Apa yang ingin kamu pelajari hari ini?",
                          style: headerText,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: ContentArea(
                        addPadding: false,
                        child: Obx(() => ListView.separated(
                              padding: UiParameters.mobileScreenPadding,
                              // shrinkWrap: true,
                              itemCount:
                                  questionPaperController.allPapers.length,
                              itemBuilder: (BuildContext context, int index) {
                                return QuestionCard(
                                  model:
                                      questionPaperController.allPapers[index],
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const SizedBox(
                                  height: 15,
                                );
                              },
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
