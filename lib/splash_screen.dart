import 'package:flutter/material.dart';
import 'package:woofwallet/register_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 4),
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const RegisterScreen(),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xffFB8500),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * .4,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(55),
                  ),
                  child: Image.asset(
                    "icons/logo.png",
                    color: const Color(0xffFB8500),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Woof Wallet',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 1.3,
              height: 300,
              child: Stack(
                children: [
                  Positioned.fill(
                    bottom: -720,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Center(
                        child: Container(
                          width: screenSize.width * 2,
                          height: screenSize.width * 1.3,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(.18),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(1000)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    bottom: -600,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Center(
                        child: Container(
                          width: screenSize.width * 1.3,
                          height: screenSize.width * 1.3,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(.18),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(1000),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    bottom: -500,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Center(
                        child: Container(
                          width: screenSize.width * 1.3,
                          height: screenSize.width * 1.3,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(.18),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(1000),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Positioned(
                  //   bottom: -110,
                  //   child: SvgPicture.asset(
                  //     "icons/cirlcle1.svg",
                  //     height: 170,
                  //     color: Colors.white.withOpacity(.6),
                  //     // height: 220,
                  //   ),
                  // ),
                  // Positioned(
                  //   bottom: -50,
                  //   child: SvgPicture.asset(
                  //     "icons/cirlcle2.svg",
                  //     height: 170,
                  //     color: Colors.white.withOpacity(.4),
                  //   ),
                  // ),
                  // Positioned(
                  //   bottom: -120,
                  //   child: SvgPicture.asset(
                  //     "icons/cirlcle3.svg",
                  //     // height: 300,
                  //     width: screenSize.width,
                  //     color: Colors.white,
                  //     height: 170,
                  //   ),
                  // ),
                  // Positioned(
                  //   bottom: -60,
                  //   child: SvgPicture.asset(
                  //     "icons/cirlcle2.svg",
                  //     // height: 300,
                  //     width: screenSize.width,
                  //     color: Colors.white,
                  //     height: 170,
                  //   ),
                  // ),
                  // Positioned(
                  //   bottom: -2,
                  //   child: SvgPicture.asset(
                  //     "icons/cirlcle1.svg",
                  //     // height: 300,
                  //     width: screenSize.width,
                  //     color: Colors.white,
                  //     height: 170,
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
