import 'package:flutter/material.dart';
import 'package:flutter_firebase_quiz_app/core/constants/app_colors.dart';
import 'package:flutter_firebase_quiz_app/core/constants/assets_paths.dart';
import 'package:flutter_firebase_quiz_app/core/init/injection_container.dart';
import 'package:flutter_firebase_quiz_app/core/utils/route/route_manager.dart';
import 'package:flutter_firebase_quiz_app/core/utils/route/router.dart';
import 'package:flutter_firebase_quiz_app/features/auth/view_model/register_provider.dart';
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

          IconButton(onPressed: ()=> sl<RegisterProvider>().logout(), icon: const Icon(Icons.call_missed_outgoing_outlined))
        ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8
        ),
        itemBuilder: ((context, index) => Padding(
              padding: const EdgeInsets.all(12),
              child: GestureDetector(
                onTap: () => Go.to.page(PageRoutes.quizPage),
                child: Container(
                 
                  decoration: BoxDecoration(
                      color: Colors.red, borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(
                        AssetsPath().loginSVG,
                        height: 75,
                      ),
                      const Text(
                        'Category name',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
            )),
        itemCount: 8,
      ),
    );
  }
}
