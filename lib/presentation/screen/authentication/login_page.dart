import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/utils.dart';
import '../../../controller/provider/appProvider.dart';
import '../../../controller/repository/authenticationRepo.dart';
import '../../../models/arguments.dart';
import '../../../models/authModel.dart';

class LoginPage extends StatefulWidget {
  final Function updateWidget;
  final UserArguments userDetails;
  final String title;
  LoginPage(
      {super.key,
      required this.updateWidget,
      required this.userDetails,
      required this.title});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  double containerWidth = 0.35;
  String? emailId;
  String? password;
  final formKey = GlobalKey<FormState>();
  void animateContainer() {
    setState(() {
      containerWidth = 0.85; //0.85
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      animateContainer();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Padding(
            padding: EdgeInsets.only(top: height * 0.09),
            child: Text(widget.title,
                style: GoogleFonts.robotoCondensed(
                    color: Colors.black87.withOpacity(0.7),
                    fontSize: height * 0.05,
                    fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: height * 0.15),
          AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            height: height * 0.29, //0.6
            width: width * containerWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(height * 0.03)),
            ),
            child: Form(
                key: formKey,
                child: Stack(
                  children: [
                    Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: height * 0.01),
                          inputField(
                              title: 'username or email address',
                              keyboardType: TextInputType.phone,
                              maxLength: 10,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ]),
                          inputField(
                              title: 'Password',
                              icon: Icons.lock,
                              keyboardType: TextInputType.text,
                              maxLength: 20,
                              inputFormatters: [
                                FilteringTextInputFormatter.singleLineFormatter
                              ]),
                          Align(
                            alignment: Alignment.topRight,
                            child: GestureDetector(
                              onTap: () {},
                              child: Text(
                                "Forget password?",
                                style: GoogleFonts.robotoCondensed(
                                  color: HexColor("#1471af"),
                                  fontSize: height * 0.019,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: height * 0.02),
                          Align(
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  formKey.currentState!.save();
                                  print("EmailId ::: $emailId");
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                  login();
                                }
                              },
                              child: Container(
                                  width: double.infinity,
                                  height: MediaQuery.of(context).size.height *
                                      0.056,
                                  padding: EdgeInsets.only(
                                      top: height * 0.013,
                                      bottom: height * 0.013,
                                      right: width * 0.05,
                                      left: width * 0.05),
                                  decoration: BoxDecoration(
                                      color: HexColor("#0397fe"),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(3))),
                                  child: Center(
                                    child: Text("Log In",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: height * 0.0215)),
                                  )),
                            ),
                          ),
                        ]),
                  ],
                )),
          ),
          SizedBox(height: height * 0.15),
          Row(
            children: [
              Expanded(
                  child: Divider(
                      thickness: 2,
                      indent: height * 0.04,
                      endIndent: height * 0.015)),
              Text(
                "or",
                style: GoogleFonts.robotoCondensed(
                  color: HexColor("#1471af"),
                  fontSize: height * 0.0185,
                ),
              ),
              Expanded(
                  child: Divider(
                      thickness: 2,
                      indent: height * 0.015,
                      endIndent: height * 0.04))
            ],
          ),
          SizedBox(height: height * 0.015),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // CustomButton(
              //     title: "Google",
              //     icon: "assets/image/icons8-google-48.png",
              //     color: HexColor("#ffe3ea"),
              //     width: width * 0.35,
              //     height: height * 0.05,
              //     onTap: () {}),
              // CustomButton(
              //     title: "Facebook",
              //     icon: "assets/image/icons-facebook.png",
              //     color: HexColor("#ffe3ea"),
              //     width: width * 0.35,
              //     height: height * 0.05,
              //     onTap: () {
              //       widget.updateWidget(0, UserArguments(newUser: true));
              //     }),
            ],
          ),
          // SizedBox(height: height * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have account?  ",
                style: GoogleFonts.robotoCondensed(
                  color: Colors.white,
                  fontSize: height * 0.017,
                ),
              ),
              TextButton(
                onPressed: () {
                  widget.updateWidget(2, UserArguments(newUser: true));
                },
                child: Text(
                  "Sign up",
                  style: GoogleFonts.robotoCondensed(
                    color: HexColor("#f93467"),
                    fontSize: height * 0.019,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: height * 0.02),
        ]),
      ),
    );
  }

  login() {
    print("email: $emailId, password: $password");
    AuthenticationRepository()
        .login({"email": "$emailId", "password": "$password"}).then((value) {
      print(" value[values] :: ${value}");
      saveData(value);
      Navigator.pushReplacementNamed(context, "/home");
    }).onError((error, stackTrace) {
      print("error :: $error");
    });
  }

  saveData(UserModel authToken) async {
    SharedPreferences sharedUser = await SharedPreferences.getInstance();
    sharedUser.setString('user', jsonEncode(authToken));
    sharedUser.setString('authToken', 'Bearer ${authToken.token}');
    Provider.of<AppProvider>(context, listen: false).updateUser(authToken);
  }

  Widget inputField(
      {String? title,
      IconData? icon,
      TextInputType? keyboardType,
      int? maxLength,
      inputFormatters}) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.056,
      decoration: BoxDecoration(
          color: HexColor("#363636"), borderRadius: BorderRadius.circular(3)),
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05),
      child: TextFormField(
        decoration: InputDecoration(
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
          hintTextDirection: TextDirection.ltr,
          hintText: title,
          hintStyle: TextStyle(
              color: Colors.white54,
              fontSize: MediaQuery.of(context).size.height * 0.021),
          counterText: '',
          border: InputBorder.none,
        ),
        style: TextStyle(
          color: Colors.black54,
          fontWeight: FontWeight.w500,
          fontSize: MediaQuery.of(context).size.height * 0.0225,
        ),
        cursorColor: Colors.black,
        keyboardType: keyboardType,
        maxLength: maxLength,
        inputFormatters: inputFormatters,
        validator: (dynamic value) {
          if (value!.isEmpty) {
            Utils.flushBarErrorMessage("Field is required", context);
          } else if (value.length != maxLength && title == 'Mobile number') {
            Utils.flushBarErrorMessage(
                "Field must be $maxLength characters", context);
          } else if (title == 'Mobile number') {
            String pattern = r'(^[0-9]*$)';
            RegExp regExp = RegExp(pattern);
            if (!regExp.hasMatch(value)) {
              Utils.flushBarErrorMessage("Field must be in numbers", context);
            }
          } else if (title == 'Password') {
            if (value.length < 6) {
              Utils.flushBarErrorMessage(
                  "Password must be at least 6 characters", context);
            } else if (!value.contains(RegExp(r'[A-Z]'))) {
              Utils.flushBarErrorMessage(
                  "Password must contain at least one uppercase letter",
                  context);
            } else if (!value.contains(RegExp(r'[a-z]'))) {
              Utils.flushBarErrorMessage(
                  "Password must contain at least one lowercase letter",
                  context);
            } else if (!value.contains(RegExp(r'[0-9]'))) {
              Utils.flushBarErrorMessage(
                  "Password must contain at least one digit", context);
            }
          }
          return null;
        },
        onSaved: (String? value) {
          if (title == "Mobile number") {
            emailId = value!;
          } else if (title == "Password") {
            password = value!;
          }
        },
      ),
    );
  }

  OutlineInputBorder commonInputBorder = const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(35)),
      borderSide: BorderSide(
        color: Colors.transparent,
      ));

  void showValidationSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
