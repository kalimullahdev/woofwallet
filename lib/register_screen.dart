import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:woofwallet/custom_validators.dart';
import 'package:woofwallet/firebase_repo.dart';
import 'package:woofwallet/home_screen.dart';
import 'package:woofwallet/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailtextEditingController =
      TextEditingController();
  final TextEditingController _passwordtextEditingController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailtextEditingController.dispose();
    _passwordtextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  // const SizedBox(height: 60),
                  SizedBox(
                    width: screenSize.width * .8,
                    child: const Text(
                      'Immediately Feel\n The Ease of Transacting \nJust by Registering',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 23,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Sign up with

                  SizedBox(
                    width: screenSize.width * .8,
                    child: const Text(
                      'Sign up with',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 13,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w500,
                          color: Color(0xff828282)),
                    ),
                  ),
                  const SizedBox(height: 20),

                  SizedBox(
                    // width: screenSize.width * .8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 85,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 7,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                          child: SvgPicture.asset(
                            "icons/google.svg",
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Container(
                          width: 85,
                          height: 50,
                          decoration: BoxDecoration(
                            color: const Color(0xff4368C7),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 7,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                          child: SvgPicture.asset(
                            "icons/f.svg",
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Container(
                          width: 85,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 7,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12),
                            ),
                          ),
                          child: SvgPicture.asset(
                            "icons/apple.svg",
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  CustomTextFormField(
                    screenSize: screenSize,
                    hintText: 'Username',
                    svgSrc: 'icons/profile.svg',
                  ),

                  CustomTextFormField(
                    controller: _emailtextEditingController,
                    screenSize: screenSize,
                    hintText: 'Email',
                    svgSrc: 'icons/sms.svg',
                    validator: (value) {
                      return CustomValidator.validateEmail(
                        _emailtextEditingController.text,
                      );
                    },
                  ),
                  CustomTextFormField(
                    screenSize: screenSize,
                    hintText: 'Date of Birth',
                    svgSrc: 'icons/calendar.svg',
                  ),
                  CustomTextFormField(
                    controller: _passwordtextEditingController,
                    screenSize: screenSize,
                    hintText: 'Password',
                    svgSrc: 'icons/password.svg',
                    validator: (_) {
                      return CustomValidator.validatePassword(
                        _passwordtextEditingController.text,
                      );
                    },
                    suffixIcon: const Icon(
                      FontAwesomeIcons.eyeSlash,
                      size: 18,
                    ),
                  ),
                  const SizedBox(height: 30),

                  SizedBox(
                    width: 170,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Processing Data'),
                              duration: Duration(milliseconds: 200),
                            ),
                          );
                          try {
                            await FirebaseRepo.firebaseAuth
                                .createUserWithEmailAndPassword(
                              email: _emailtextEditingController.text,
                              password: _passwordtextEditingController.text,
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Registration success'),
                                duration: Duration(milliseconds: 1000),
                              ),
                            );

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ),
                            );
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                      Text('The password provided is too weak'),
                                ),
                              );
                            } else if (e.code == 'email-already-in-use') {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'The account already exists for that email')),
                              );
                            }
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(
                                      'The error occurred ${e.toString()} ')),
                            );
                          }
                        }
                      },
                      child: const Text(
                        "Register",
                        style: TextStyle(
                          fontFamily: "Quicksand",
                          fontSize: 18,
                        ),
                      ),
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          const EdgeInsets.all(0),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xffFB8500),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 17),

                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        color: Color(0xff828282),
                      ),
                      children: [
                        const TextSpan(
                          text: "You have account? ",
                        ),
                        TextSpan(
                          text: "Login",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                )),
                          style: const TextStyle(
                            color: Color(0xffFB8500),
                          ),
                        ),
                        // FB8500
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    required this.screenSize,
    required this.svgSrc,
    required this.hintText,
    Key? key,
    this.suffixIcon,
    this.controller,
    this.validator,
  }) : super(key: key);

  final Size screenSize;
  final String svgSrc;
  final String hintText;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      width: screenSize.width * .8,
      child: TextFormField(
        validator: validator,
        controller: controller,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color.fromRGBO(242, 242, 242, 1),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(
              right: 20.0,
              left: 20.0,
            ),
            child: SvgPicture.asset(
              svgSrc,
              fit: BoxFit.scaleDown,
            ),
          ),
          suffixIcon: suffixIcon,
          hintText: hintText,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15),
          ),
          hintStyle: const TextStyle(
            color: Color(0xff8F8F8F),
            fontFamily: "Quicksand",
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
