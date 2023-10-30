import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peanut_api/modules/login/controller/login_controller.dart';

import '../../common/loader.dart';
import '../../utils/responsive.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBF4F5),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              verticalSpace(twentyPixelheight(context) * 6),
              Image.asset(
                'assets/peanut.jpg',
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: twentyPixelWidth(context) - 4),
                child: TextFormField(
                  controller: loginController.emailController.value,
                  decoration: InputDecoration(
                    hintText: 'Mobile number/ Email id',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.grey.shade200,
                    )),
                    filled: true,
                    fillColor: Colors.white,
                    // constraints: BoxConstraints(
                    //     maxHeight: twentyPixelheight(context) * 2 + 12),
                    contentPadding: const EdgeInsets.only(top: 12, left: 12),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please inter a valid Email';
                    }
                    return null;
                  },
                ),
              ),
              verticalSpace(twentyPixelheight(context)),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: twentyPixelWidth(context) - 4),
                child: TextFormField(
                  controller: loginController.passwordController.value,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white,
                    // constraints: BoxConstraints(
                    //     maxHeight: twentyPixelheight(context) * 2 + 12),
                    contentPadding: EdgeInsets.only(top: 12, left: 12),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Password cant be Empty';
                    }
                    if (value.isNotEmpty && value.length < 6) {
                      return "Password can't be less than 6";
                    }
                    return null;
                  },
                ),
              ),
              verticalSpace(twentyPixelheight(context) - 12),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: twentyPixelWidth(context) - 4),
                child: Row(
                  children: [
                    Checkbox(value: true, onChanged: (val) {}),
                    const Text("Remember Me"),
                    const Spacer(),
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        "Forgot Password",
                        style: TextStyle(color: Color(0xFFE36262)),
                      ),
                    )
                  ],
                ),
              ),
              verticalSpace(twentyPixelheight(context) * 2),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: twentyPixelWidth(context) - 4),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      await loginController.login();
                    }
                  },
                  child: Obx(
                    () => loginController.isLoading.value
                        ? const Loader()
                        : const Text(
                            'Sign In',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),
              ),
              verticalSpace(twentyPixelheight(context) * 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an accout?"),
                  horizontalSpace(12),
                  InkWell(
                    onTap: () {},
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.black),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
