import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:woofwallet/custom_validators.dart';
import 'package:woofwallet/firebase_repo.dart';
import 'package:woofwallet/home_screen.dart';
import 'package:woofwallet/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // const SizedBox(height: 60),
                SizedBox(
                  width: screenSize.width * .8,
                  child: const Text(
                    'Welcome Back\n to Woof Wallet',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                // const SizedBox(height: 40),
                // Sign up with

                Column(
                  children: [
                    SizedBox(
                      width: screenSize.width * .8,
                      child: const Text(
                        'Login With',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 13,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                            color: Color(0xff828282)),
                      ),
                    ),
                    const SizedBox(height: 18),
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
                                    0,
                                    3,
                                  ), // changes position of shadow
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
                    const SizedBox(height: 25),
                    CustomTextFormField(
                      controller: _emailtextEditingController,
                      screenSize: screenSize,
                      hintText: 'Email',
                      svgSrc: 'icons/profile.svg',
                      validator: (_) {
                        return CustomValidator.validateEmail(
                          _emailtextEditingController.text,
                        );
                      },
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
                  ],
                ),

                // const SizedBox(height: 23),

                Column(
                  children: [
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
                                  .signInWithEmailAndPassword(
                                email: _emailtextEditingController.text,
                                password: _passwordtextEditingController.text,
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Login success'),
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
                              if (e.code == 'user-not-found') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'No user found for that email.')),
                                );
                              } else if (e.code == 'wrong-password') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'Wrong password provided for that user.')),
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
                          "Login",
                          style: TextStyle(
                            fontFamily: "Quicksand",
                            fontSize: 18,
                          ),
                        ),
                        style: ButtonStyle(
                          padding:
                              MaterialStateProperty.all<EdgeInsetsGeometry>(
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
                            text: "Don't have an account yet? ",
                          ),
                          TextSpan(
                            text: "Register",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pop(context);
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //       builder: (context) =>
                                //           const RegisterScreen(),
                                //     ));
                              },
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
