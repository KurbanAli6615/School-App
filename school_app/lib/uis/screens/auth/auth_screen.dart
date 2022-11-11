// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'dart:developer';

import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:school_app/providers/auth_provider.dart';
import 'package:school_app/resources/color_manager.dart';
import 'package:school_app/resources/font_manager.dart';
import 'package:school_app/resources/routes_manager.dart';
import 'package:school_app/resources/strings_manager.dart';
import 'package:school_app/resources/styles_manager.dart';
import 'package:school_app/resources/values_manager.dart';
import 'package:school_app/uis/screens/auth/widgets/auth_rounded_button.dart';
import 'package:provider/provider.dart';
import 'package:school_app/uis/widgets/app_progress_indicator.dart';

import '../../../helpers/enums/button_type.dart';
import '../../../helpers/enums/user_type.dart';
import '../../widgets/app_rounded_button.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  UserType selectedUserType = UserType.student;
  bool isForRegistration = false;

  String notYetRegisteringText = AppStrings.kNotRegistered;
  ButtonType buttonType = ButtonType.login;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  // MainPageModel mainPageModel;

  void onSubmit() async {
    final authProvider = context.read<AuthProvider>();
    if (isForRegistration) {
      AppProgressIndicator.show();
      final isSuccess = await authProvider.signUpWith(
        email: emailController.text,
        password: passwordController.text,
        name: nameController.text,
        mobile: mobileController.text,
        userType: selectedUserType,
      );
      AppProgressIndicator.dismiss();
      if (isSuccess) {
        AppRoutes.popUntil(context, name: AppRoutes.dashboardScreen);
      }
    } else {
      AppProgressIndicator.show();
      final isSuccess = await authProvider.signInWith(
        email: emailController.text,
        password: passwordController.text,
      );
      AppProgressIndicator.dismiss();
      if (isSuccess) {
        AppRoutes.popUntil(context, name: AppRoutes.dashboardScreen);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          isForRegistration ? AppStrings.kRegister : AppStrings.kLogin,
          style: getBoldStyle(
            color: ColorManager.white,
            fontSize: FontSize.s16,
          ),
        ),
      ),
      floatingActionButton: LoginRoundedButton(
        label: buttonType == ButtonType.login
            ? AppStrings.kLogin
            : AppStrings.kRegister,
        onPressed: onSubmit,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: AppPadding.p20,
            right: AppPadding.p20,
            top: AppPadding.p10,
          ),
          child: Column(
            children: <Widget>[
              CustomRadioButton<UserType>(
                defaultSelected: selectedUserType,
                radius: AppRadius.r30,
                unSelectedColor: Theme.of(context).canvasColor,
                buttonLables: [
                  UserType.student.name.toUpperCase(),
                  UserType.teacher.name.toUpperCase(),
                ],
                buttonValues: const [UserType.student, UserType.teacher],
                radioButtonValue: (value) {
                  selectedUserType = value;
                },
                selectedColor: Theme.of(context).primaryColor,
              ),
              SizedBox(height: AppSize.s10),
              Visibility(
                visible: isForRegistration,
                child: TextField(
                  onChanged: (name) {},
                  keyboardType: TextInputType.name,
                  style: getMediumStyle(
                      color: ColorManager.black, fontSize: FontSize.s18),
                  decoration: getTextFieldDecoration.copyWith(
                    hintText: AppStrings.kNameHint,
                    labelText: AppStrings.kName,
                  ),
                  controller: nameController,
                ),
              ),
              SizedBox(height: AppSize.s10),
              TextField(
                onChanged: (email) {},
                keyboardType: TextInputType.emailAddress,
                style: getMediumStyle(
                    color: ColorManager.black, fontSize: FontSize.s18),
                decoration: getTextFieldDecoration.copyWith(
                  hintText: AppStrings.kEmailHint,
                  labelText: AppStrings.kEmail,
                ),
                controller: emailController,
              ),
              SizedBox(height: AppSize.s10),
              Visibility(
                visible: isForRegistration,
                child: TextField(
                  onChanged: (phone) {},
                  keyboardType: TextInputType.phone,
                  style: getMediumStyle(
                      color: ColorManager.black, fontSize: FontSize.s18),
                  decoration: getTextFieldDecoration.copyWith(
                    hintText: AppStrings.kMobileHint,
                    labelText: AppStrings.kMobile,
                  ),
                  controller: mobileController,
                ),
              ),
              Visibility(
                visible: isForRegistration,
                child: SizedBox(
                  height: AppSize.s10,
                ),
              ),
              TextField(
                obscureText: true,
                onChanged: (password) {},
                keyboardType: TextInputType.text,
                style: getMediumStyle(
                    color: ColorManager.black, fontSize: FontSize.s18),
                decoration: getTextFieldDecoration.copyWith(
                  hintText: AppStrings.kPasswordHint,
                  labelText: AppStrings.kPassword,
                ),
                controller: passwordController,
              ),
              Visibility(
                visible: isForRegistration,
                child: SizedBox(height: AppSize.s10),
              ),
              Visibility(
                visible: isForRegistration,
                child: TextField(
                  obscureText: true,
                  onChanged: (password) {},
                  keyboardType: TextInputType.text,
                  style: getMediumStyle(
                      color: ColorManager.black, fontSize: FontSize.s18),
                  decoration: getTextFieldDecoration.copyWith(
                    hintText: AppStrings.kPasswordHint,
                    labelText: AppStrings.kConfirmPassword,
                  ),
                  controller: confirmPasswordController,
                ),
              ),
              SizedBox(height: AppSize.s10),
              Hero(
                tag: 'otpForget',
                child: SizedBox(
                  height: AppSize.s40,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      AppRoundedButton(
                        onPressed: () {
                          setState(() {
                            if (buttonType == ButtonType.login) {
                              buttonType = ButtonType.register;
                            } else {
                              buttonType = ButtonType.login;
                            }
                            isForRegistration = !isForRegistration;
                            notYetRegisteringText = isForRegistration
                                ? AppStrings.kRegistered
                                : AppStrings.kNotRegistered;
                          });
                        },
                        height: AppSize.s40,
                        child: Text(
                          notYetRegisteringText,
                          style: getRegularStyle(
                            color: ColorManager.black,
                            fontSize: FontSize.s14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
