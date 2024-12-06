import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharma/Constants/appColors.dart';
import 'package:pharma/controllers/pharmacy_controller.dart';
import '../../controllers/auth_controller.dart';

class ProfilePage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final PharmacyController pharmacyController = Get.put(PharmacyController());

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: (){
            Get.back();
          },
            child: Icon(Icons.arrow_back,color: TextColorWhite,)),
        backgroundColor: PRIMARY_COLOR,

        actions: [
          IconButton(
            icon: Icon(Icons.logout,color: TextColorWhite,),
            onPressed: () {
              Get.find<AuthController>().logout();
            },
          ),
        ],
      ),
      body:Obx((){
        final pharmacy = pharmacyController.pharmacyDetails.value;

        if(pharmacy == null){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return  SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none, // Allows the CircleAvatar to extend outside the Stack
                children: [
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: PRIMARY_COLOR, // Replace with PRIMARY_COLOR
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -40, // Negative value to make it overlap the container
                    left: 150, // Center horizontally
                    child: CircleAvatar(
                      radius: 50, // Adjust radius as needed
                      backgroundColor: TextColorBlack,
                      child:  Text(
                        '${pharmacyController.pharmacyDetails.value!.name[0].toUpperCase()}',
                        style: TextStyle(fontSize: 24,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name Field
                    Obx(() => TextFormField(
                      initialValue: pharmacyController.pharmacyDetails.value!.name,
                      onChanged: (value) => pharmacyController.name.value = value,
                      decoration: InputDecoration(
                        labelText: 'Name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    )),
                    const SizedBox(height: 16),

                    // Email Field
                    Obx(() => TextFormField(
                      initialValue: pharmacyController.pharmacyDetails.value!.email,
                      onChanged: (value) => pharmacyController.email.value = value,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    )),
                    const SizedBox(height: 16),

                    // Password Field
                    Obx(() {
                      // Track visibility of the password
                      final isPasswordVisible = pharmacyController.isPasswordVisible.value;

                      return TextFormField(
                        initialValue: pharmacyController.pharmacyDetails.value!.password,
                        obscureText: !isPasswordVisible, // Toggle visibility
                        onChanged: (value) => pharmacyController.password.value = value,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              // Toggle the password visibility
                              pharmacyController.isPasswordVisible.value = !isPasswordVisible;
                            },
                          ),
                        ),
                      );
                    }),

                    const SizedBox(height: 16),

                    // // Date of Birth Field
                    // Obx(() => TextFormField(
                    //   initialValue: pharmacyController.pharmacyDetails.value!.,
                    //   onChanged: (value) =>
                    //   accountController.dateOfBirth.value = value,
                    //   decoration: InputDecoration(
                    //     labelText: 'Date of Birth',
                    //     suffixIcon: const Icon(Icons.calendar_today),
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(12),
                    //     ),
                    //   ),
                    // )),
                    const SizedBox(height: 16),

                    // Mobile Field
                    Obx(() => TextFormField(
                      initialValue: pharmacyController.pharmacyDetails.value!.phoneNo,
                      onChanged: (value) => pharmacyController.mobile.value = value,
                      decoration: InputDecoration(
                        labelText: 'Mobile',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    )),
                    const SizedBox(height: 100),

                    // Save Changes Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: pharmacyController.saveChanges,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child:  Text(
                          'Save Changes',
                          style: TextStyle(fontSize: 16,color:TextColorWhite ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        );
      })

    );
  }
}
