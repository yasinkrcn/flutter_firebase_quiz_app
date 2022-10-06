import 'package:flutter/material.dart';
import 'package:flutter_firebase_quiz_app/core/constants/app_colors.dart';
import 'package:flutter_firebase_quiz_app/core/constants/app_text_style.dart';
import 'package:flutter_firebase_quiz_app/core/constants/assets_paths.dart';
import 'package:flutter_firebase_quiz_app/core/functions/validators.dart';
import 'package:flutter_firebase_quiz_app/core/shared_widgets/app_button.dart';
import 'package:flutter_firebase_quiz_app/core/shared_widgets/app_text_form_field.dart';
import 'package:flutter_firebase_quiz_app/core/utils/route/route_manager.dart';
import 'package:flutter_firebase_quiz_app/core/utils/route/router.dart';
import 'package:flutter_firebase_quiz_app/core/utils/screen_size.dart';
import 'package:flutter_firebase_quiz_app/features/auth/view_model/login_provider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Login'),
      //   centerTitle: true,
      //   elevation: 0,
      //   backgroundColor: Colors.black,
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Consumer<LoginProvider>(
          builder: (context, loginProvider, child) {
            return Column(children: [
              const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'We can!!!',
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.w400),
                  )),
              const SizedBox(
                height: 16,
              ),
              Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    AssetsPath().loginSVG,
                    height: 200,
                  )),
              const SizedBox(
                height: 36,
              ),
              AppTextFormField.standart(
                  hintText: 'email', controller: loginProvider.emailController,
                  validator: (String? value) {
                    if (value != null) {
                      if (emailValidator(value)) {
                        return 'Doğru formatta bir mail giriniz';
                      }
                    }

                    return null;
                  },
                 prefixIcon: const Icon(
                    Icons.alternate_email,
                    color: AppColors.blackColor,
                  ), ),
              const SizedBox(
                height: 16,
              ),
              
              AppTextFormField.obscure(
                  hintText: 'password',
                  controller: loginProvider.passwordController,
                  validator: (String? value) {
                    if (value != null) {
                      if (value.length < 6) {
                        return   'Şifreniz en az 6 karakter olmalıdır';
                      }

                      if (value.length >= 50) {
                     return 'Şifreniz en fazla 50 karakter olmalıdır';
                      }
                    }

                    return null;
                  }
                  ),
              const SizedBox(
                height: 8,
              ),
              const Align(
                  alignment: Alignment.centerRight,
                  child: Text('Forgot password?')),
              const Spacer(),
              //Google SignIn Button
              AppButton.icon(
                  iconPath: AssetsPath().googleSVG,
                  onTap: () {},
                  buttonText: 'Continue with Google'),
              const SizedBox(
                height: 16,
              ),
              //Login Button
              AppButton.standart(onTap: ()async {
                await loginProvider.login();
                
              }, buttonText: 'Login'),
              const SizedBox(
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('New to Quiz?'),
                  const SizedBox(
                    width: 6,
                  ),
                  GestureDetector(
                    onTap: () => Go.to.page(PageRoutes.signUpPage),
                    child: Text(
                      'Register',
                      style: AppTextStyles.regular14px
                          .copyWith(color: AppColors.primaryColor),
                    ),
                  ),
                ],
              ),
            ]);
          },
        ),
      ),
    );
  }
}
