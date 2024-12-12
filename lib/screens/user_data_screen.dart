import 'package:expenz/constance/colors.dart';
import 'package:expenz/screens/main_screen.dart';
import 'package:expenz/servces/user_details_service.dart';
import 'package:expenz/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class UserDataScreen extends StatefulWidget {
  const UserDataScreen({super.key});

  @override
  State<UserDataScreen> createState() => _UserDataScreenState();
}

class _UserDataScreenState extends State<UserDataScreen> {
  bool _rememberMe = false;
  //form key
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordContorller = TextEditingController();
  final TextEditingController _confirmPasswordContorller =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Enter your \nPersonal Details",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Form(
                  key: _formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: _usernameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter Your Name";
                          }
                        },
                        decoration: InputDecoration(
                            hintText: "Name",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            contentPadding: EdgeInsets.all(20)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter Your Email";
                          }
                        },
                        decoration: InputDecoration(
                            hintText: "Email",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            contentPadding: EdgeInsets.all(20)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _passwordContorller,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter Your Password";
                          }
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Password",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            contentPadding: EdgeInsets.all(20)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        obscureText: true,
                        controller: _confirmPasswordContorller,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter the same Password";
                          }
                        },
                        decoration: InputDecoration(
                            hintText: "Comfirm Password",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                            contentPadding: EdgeInsets.all(20)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CheckboxListTile(
                        activeColor: kMainColor,
                        title: Text(
                          "Remember Me for the next time",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: kGrey,
                          ),
                        ),
                        value: _rememberMe,
                        onChanged: (value) {
                          setState(() {
                            _rememberMe = value!;
                          });
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () async {
                          if (_formkey.currentState!.validate()) {
                            String userName =
                                _usernameController.text.toString();
                            String email = _emailController.text.toString();
                            String password =
                                _passwordContorller.text.toString();
                            String confirmPassword =
                                _confirmPasswordContorller.text.toString();

                            await UserService.storeUserDetails(userName, email,
                                password, confirmPassword, context);

                            // if (context.mounted) {
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) {
                            //         return MainScreen();
                            //       },
                            //     ),
                            //   );
                            // }
                          }
                        },
                        child: CustumButton(
                            buttonName: "Next", buttonColor: kMainColor),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
