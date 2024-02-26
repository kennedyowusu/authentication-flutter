import 'package:authentication/controller/auth_controller.dart';
import 'package:authentication/views/register.dart';
import 'package:authentication/widgets/custom_btn.dart';
import 'package:authentication/widgets/custom_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  AuthenticationController authenticationController =
      Get.put(AuthenticationController());

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
          key: loginKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 20),
                const Text(
                  'Login to your Account',
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
                Obx(
                  () => authenticationController.isLoading.value
                      ? const CircularProgressIndicator(
                          color: Colors.blue,
                        )
                      : CustomButton(
                          title: 'Login',
                          onPressed: () {
                            if (loginKey.currentState!.validate()) {
                              authenticationController.loginUser(
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
                      'Don\'t have an account?',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        Get.to(() => RegisterView());
                      },
                      child: const Text(
                        'Register',
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


// * Let's test it out.

// * The login also worked successfully.
// *So we have successfully implemented the authentication system in our app.

// ? Awesome. Well done for making it this far.

// ? I hope you enjoyed the video. If you did, please give it a thumbs up and subscribe to my channel for more videos like this.

// ? I will see if I should continue working on this project... that is

// ? Adding the logout functionality and the forgot password functionality.

// * Persisting the user's login state. etc

// * Until then, I will see you in the next video. Bye for now.
