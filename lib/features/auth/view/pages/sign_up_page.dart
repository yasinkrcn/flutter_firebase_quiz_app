import 'package:flutter/material.dart';
import 'package:flutter_firebase_quiz_app/core/constants/app_colors.dart';
import 'package:flutter_firebase_quiz_app/core/functions/remove_focus.dart';
import 'package:flutter_firebase_quiz_app/core/functions/validators.dart';
import 'package:flutter_firebase_quiz_app/core/init/injection_container.dart';
import 'package:flutter_firebase_quiz_app/core/shared_widgets/app_button.dart';
import 'package:flutter_firebase_quiz_app/core/shared_widgets/app_text_form_field.dart';
import 'package:flutter_firebase_quiz_app/core/utils/route/route_manager.dart';
import 'package:flutter_firebase_quiz_app/core/utils/route/router.dart';
import 'package:provider/provider.dart';

import '../../view_model/register_provider.dart';

class SignUpPage extends StatelessWidget {
   SignUpPage({super.key});
  final formGlobalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.black,
      ),
      body: Consumer<RegisterProvider>(
        builder: (context, registerProvider, child) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: formGlobalKey,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                        onTap: () {
                          registerProvider.getProfilePhotoImage();
                        },
                        child: CircleAvatar(
                          backgroundColor: AppColors.secondaryColor,
                          radius: 75,
                          child: CircleAvatar(
                            backgroundColor: AppColors.backgroundColor,
                            radius: 74,
                            backgroundImage: registerProvider.profilePhotoFile ==
                                    null
                                ? null
                                : FileImage(registerProvider.profilePhotoFile!),
                            child: registerProvider.profilePhotoFile == null
                                ? const Icon(Icons.add, size: 60)
                                : null,
                          ),
                        )),
                  ),
                  const SizedBox(height: 16),
                  AppTextFormField.standart(
                    controller: registerProvider.nameController,
                    hintText: 'Enter your name',
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Lütfen gerekli alanları doldurunuz';
                      }
            
                      return null;
                    },
                    prefixIcon: const Icon(
                      Icons.person_outline,
                      color: AppColors.blackColor,
                    ),
                  ),
                  const SizedBox(height: 16),
                  AppTextFormField.standart(
                    controller: registerProvider.surnameController,
                    hintText: 'Enter your surname',
                    prefixIcon: const Icon(
                      Icons.person_outline,
                      color: AppColors.blackColor,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  AppTextFormField.standart(
                    controller: registerProvider.emailController,
                    hintText: 'Enter your email adress',
                    validator: (String? value) {
                      if (value != null) {
                        if (emailValidator(value)) {
                          return 'email validation';
                        }
                      }
                      return null;
                    },
                    prefixIcon: const Icon(
                      Icons.alternate_email,
                      color: AppColors.blackColor,
                    ),
                  ),
                  const SizedBox(height: 16),
                  AppTextFormField.obscure(
                    controller: registerProvider.passwordController,
                    hintText: 'Enter your password',
                    validator: (String? value) {
                      if (value != null) {
                        if (value.length < 6) {
                          return 'Şifreniz en az 6 karakter olmalıdır';
                        }
            
                        if (value.length >= 50) {
                          return 'Şifreniz en fazla 50 karakter olmalıdır';
                        }
                      }
            
                      return null;
                    },
                  ),
                  const Spacer(),
                  AppButton.standart(
                      onTap: () {

                        if (formGlobalKey.currentState!.validate()) {
                          removeFocus(context);

                          registerProvider.createUser(
                          name: registerProvider.nameController.text.trim(),
                          surname: registerProvider.surnameController.text.trim(),
                          email: registerProvider.emailController.text.trim(),
                          password:
                              registerProvider.passwordController.text.trim(),
                        );

                        Go.to.pageAndRemoveUntil(PageRoutes.homePage);



                          
                        }
                        
                      },
                      buttonText: 'Register')
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
