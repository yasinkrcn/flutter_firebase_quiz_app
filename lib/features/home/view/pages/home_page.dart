import 'package:flutter/material.dart';
import 'package:flutter_firebase_quiz_app/core/constants/app_colors.dart';
import 'package:flutter_firebase_quiz_app/core/constants/assets_paths.dart';
import 'package:flutter_firebase_quiz_app/core/constants/category_list.dart';
import 'package:flutter_firebase_quiz_app/core/init/injection_container.dart';
import 'package:flutter_firebase_quiz_app/core/utils/route/route_manager.dart';
import 'package:flutter_firebase_quiz_app/core/utils/route/router.dart';
import 'package:flutter_firebase_quiz_app/features/auth/view_model/register_provider.dart';
import 'package:flutter_firebase_quiz_app/features/quiz/view_model/question_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        centerTitle: true,
        backgroundColor: AppColors.blackColor,
        actions: [
          IconButton(
            onPressed: () => sl<RegisterProvider>().logout(),
            icon: const Icon(Icons.call_missed_outgoing_outlined),
          )
        ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.9),
        itemBuilder: ((context, index) => Padding(
              padding: const EdgeInsets.all(12),
              child: GestureDetector(
                onTap: (() {
                  sl<QuestionController>().categorySelect(index);
                }),
                child: Container(
                  decoration: BoxDecoration(
                      color: categoryList[index].categoryColor,
                      borderRadius: BorderRadius.circular(24)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(
                        categoryList[index].image,
                        height: 75,
                      ),
                      Text(
                        categoryList[index].categoryName,
                        style: TextStyle(
                            color: categoryList[index].textColor,
                            fontSize: 22,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
            )),
        itemCount: categoryList.length,
      ),
    );
  }
}
