import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharma/Constants/appColors.dart';
import '../../controllers/auth_controller.dart';
import '../homePage.dart';


class LoginPage extends StatelessWidget {
  final TextEditingController userIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FocusNode userIdFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();

    // Pre-fill credentials if saved
    authController.getSavedCredentials().then((credentials) {
      if (credentials['userId'] != null && credentials['password'] != null) {
        userIdController.text = credentials['userId']!;
        passwordController.text = credentials['password']!;
        authController.rememberMe.value = true;
      }
    });

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset('assets/images/image1.png'),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('User ID',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    TextField(
                      controller: userIdController,
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.person_2_outlined,color:TextColorBlack,),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                          color: PRIMARY_COLOR
                      )
                    ),
                          border: OutlineInputBorder(),
                          ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Password',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    Obx(() => TextField(
                      controller: passwordController,
                      obscureText: !authController.isPasswordVisible.value, // Toggle password visibility
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: PRIMARY_COLOR),
                        ),
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(
                            authController.isPasswordVisible.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            authController.isPasswordVisible.value = !authController.isPasswordVisible.value;
                          },
                        ),
                      ),
                    )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Obx(() => Checkbox(
                          checkColor:TextColorWhite,
                          activeColor: PRIMARY_COLOR,
                          value: authController.rememberMe.value,
                          onChanged: (bool? value) {
                            if (value != null) {
                              authController.rememberMe.value = value;
                            }
                          },
                        )),
                        Text('Remember Me'),
                      ],
                    ),
                    InkWell(
                      onTap: (){

                      },
                        child: Text('Recover Password',style: TextStyle(color: TextColorPurple,
                        fontWeight: FontWeight.bold),))
                  ],
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width/1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: PRIMARY_COLOR,
                      ),
                      onPressed: () async {
                        try{
                          await authController.login(
                            userIdController.text,
                            passwordController.text,
                            authController.rememberMe.value
                          ).catchError((error){
                            print('Login failed..!:$error');
                          });
                        }catch(e){
                          Get.snackbar('Login Failed', e.toString());
                        }
                        if (authController.isLoggedIn.value) {
                          Get.offAll(() => HomePage());
                        } else {
                          Get.snackbar('Login Failed', 'Invalid credentials');
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Login',style: TextStyle(
                          color:TextColorWhite
                        ),),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold), // Normal text style
                    children: [
                      TextSpan(
                        text: 'Register Now!',
                        style: TextStyle(
                          color: PRIMARY_COLOR, // Highlighted text color
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Navigate to the registration page
                            // Get.to(() => RegistrationPage());
                          },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
