import 'package:authentication/controller/auth_controller.dart';
import 'package:authentication/views/login.dart';
import 'package:authentication/widgets/custom_btn.dart';
import 'package:authentication/widgets/custom_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  final GlobalKey<FormState> regKey = GlobalKey<FormState>();

  AuthenticationController authenticationController =
      Get.put(AuthenticationController());

  // * Well we have done that here already

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 40,
        ),
        child: Form(
          key: regKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 20),
                const Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                const CircleAvatar(
                  radius: 50,
                  child: Icon(
                    Icons.person,
                    size: 40,
                  ),
                ),
                const SizedBox(height: 50),
                CustomInputField(
                  screenHeight: height,
                  controller: authenticationController.nameController,
                  hintText: 'Enter your Name',
                  icon: Icons.person,
                  obscureText: false,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Name is required';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  labelText: 'Full Name',
                ),
                const SizedBox(height: 20),
                CustomInputField(
                  screenHeight: height,
                  controller: authenticationController.emailController,
                  hintText: 'Enter your email',
                  icon: Icons.email,
                  obscureText: false,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Email is required';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  labelText: 'Email Address',
                ),
                const SizedBox(height: 20),
                CustomInputField(
                  screenHeight: height,
                  controller: authenticationController.passwordController,
                  hintText: 'Enter your Password',
                  icon: Icons.lock,
                  obscureText: false,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Password is required';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.visiblePassword,
                  labelText: 'Password',
                ),
                const SizedBox(height: 20),

                // * To help show a loader whiles loading
                Obx(
                  () => authenticationController.isLoading.value
                      ? const CircularProgressIndicator(
                          color: Colors.blue,
                        )
                      : CustomButton(
                          title: 'Register',
                          onPressed: () {
                            if (regKey.currentState!.validate()) {
                              authenticationController.registerUser(
                                name: authenticationController
                                    .nameController.text,
                                email: authenticationController
                                    .emailController.text,
                                password: authenticationController
                                    .passwordController.text,
                              );
                            }
                          },
                        ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Already have an account?',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        Get.to(() => LoginView());
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
