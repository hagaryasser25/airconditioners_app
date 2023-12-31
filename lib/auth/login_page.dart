// ignore_for_file: prefer_const_constructors

import 'dart:ui';
import 'package:airconditioners_app/auth/signup_page.dart';
import 'package:airconditioners_app/user/user_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../components/my_button.dart';
import '../components/my_textfield.dart';

class UserLogin extends StatefulWidget {
  static const routeName = '/loginPage';
  UserLogin({super.key});

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  // text editing controllers
  final passwordController = TextEditingController();

  final emailController = TextEditingController();

  double _sigmaX = 5;
  // from 0-10
  double _sigmaY = 5;
  // from 0-10
  double _opacity = 0.2;

  double _width = 350;

  double _height = 300;

  final _formKey = GlobalKey<FormState>();

  // sign user in method
  void signUserIn() {
    if (_formKey.currentState!.validate()) {
      print('valid');
    } else {
      print('not valid');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) => Scaffold(
          backgroundColor: Colors.grey[300],
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/images/air.jpg',
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    fit: BoxFit.cover,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.26),
                      Padding(
                        padding: EdgeInsets.only(right: 75.w),
                        child: const Text("تسجيل الدخول",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02),
                      ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                              sigmaX: _sigmaX, sigmaY: _sigmaY),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(0, 0, 0, 1)
                                    .withOpacity(_opacity),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(30))),
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.height * 0.51,
                            child: Form(
                              key: _formKey,
                              child: Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    SizedBox(
                                      height: 75.h,
                                      child: MyTextField(
                                        controller: emailController,
                                        hintText: 'البريد الألكترونى',
                                        obscureText: false,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    SizedBox(
                                      height: 75.h,
                                      child: MyPasswordTextField(
                                        controller: passwordController,
                                        hintText: 'كلمة السر',
                                        obscureText: true,
                                      ),
                                    ),
                                    const SizedBox(height: 30),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        SizedBox(
                                          height: 60.h,
                                          child: MyButtonAgree(
                                              text: "سجل دخول",
                                              onTap: () async {
                                                Navigator.pushNamed(context,
                                                        UserHome.routeName);
                                              }),
                                        ),
                                        
                                        TextButton(
                                            onPressed: () {
                                              Navigator.pushNamed(
                                                  context, SignUp.routeName);
                                            },
                                            child: Text(
                                              'انشاء حساب',
                                              style:
                                                  TextStyle(color: Colors.blue),
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
