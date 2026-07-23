import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamkeen_mini_project/core/routing/app_routes.dart';
import 'package:tamkeen_mini_project/core/theme/color/app_colors.dart';
import 'package:tamkeen_mini_project/core/validators/app_validators.dart';

class AdminLoginScreen extends StatefulWidget {
  const AdminLoginScreen({super.key});

  @override
  State<AdminLoginScreen> createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {
  String selectedCountry = "+963";
  bool isHidden = true;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    usernameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top,
            ),
            child: IntrinsicHeight(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 150.h),
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        width: 320.w,
                        margin: const EdgeInsets.only(top: 50).r,
                        padding: const EdgeInsets.all(30).r,
                        decoration: BoxDecoration(
                          color: AppColors.accent,
                          borderRadius: BorderRadius.circular(10).r,
                        ),
                        child: Form(
                          key: formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(height: 60.h),
                              TextFormField(
                                controller: usernameController,
                                style: const TextStyle(color: Colors.white),
                                validator: Validators.fullName,
                                decoration: const InputDecoration(
                                  labelText: 'Username',
                                  labelStyle: TextStyle(color: Colors.white),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 50.h,
                              ),
                              TextFormField(
                                controller: passwordController,
                                obscureText: isHidden,
                                style: const TextStyle(color: Colors.white),
                                validator: Validators.loginPassword,
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  labelStyle:
                                      const TextStyle(color: Colors.white),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isHidden = !isHidden;
                                      });
                                    },
                                    icon: Icon(
                                      isHidden
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: Colors.white,
                                    ),
                                  ),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0.h,
                        child: Container(
                          width: 100.w,
                          height: 100.h,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.surface,
                          ),
                          child: Image.asset(
                            'assets/images/login-1-.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30).r,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 55.h,
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              foregroundColor: Colors.white,
                              backgroundColor: AppColors.primary,
                            ),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                Navigator.pushReplacementNamed(
                                  context,
                                  AppRoutes.admin,
                                );
                              }
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30.h),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
