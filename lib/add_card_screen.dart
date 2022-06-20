import 'package:flutter/material.dart';

class AddCardScreen extends StatelessWidget {
  const AddCardScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios,
            color: Color(0xff2F1155),
            size: 18,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                "Add card",
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                width: 240,
                height: 340,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40.0),
                  child: Stack(
                    children: [
                      // SvgPicture.asset(
                      //   "icons/iconInCart.svg",
                      //   color: Colors.white,
                      // ),

                      Container(
                        width: 240,
                        height: 340,
                        decoration: BoxDecoration(
                          color: const Color(0xffEA7C00),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        // child: Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //   children: [
                        //     Column(
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       mainAxisAlignment: MainAxisAlignment.center,
                        //       children: const [
                        //         Text(
                        //           "Balance",
                        //           style: TextStyle(
                        //             color: Colors.white,
                        //             fontFamily: "Poppins",
                        //             fontSize: 16,
                        //             fontWeight: FontWeight.w500,
                        //           ),
                        //         ),
                        //         Text(
                        //           "£ 1.234",
                        //           style: TextStyle(
                        //             fontWeight: FontWeight.bold,
                        //             fontSize: 24,
                        //             fontFamily: "Quicksand",
                        //             color: Colors.white,
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //     Column(
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       mainAxisAlignment: MainAxisAlignment.center,
                        //       children: const [
                        //         Text(
                        //           "Card",
                        //           style: TextStyle(
                        //             fontSize: 16,
                        //             color: Colors.white,
                        //             fontWeight: FontWeight.w500,
                        //             fontFamily: "Poppins",
                        //           ),
                        //         ),
                        //         Text(
                        //           "Mabank",
                        //           style: TextStyle(
                        //             fontFamily: "Quicksand",
                        //             color: Colors.white,
                        //             fontSize: 24,
                        //             fontWeight: FontWeight.bold,
                        //           ),
                        //         )
                        //       ],
                        //     ),
                        //   ],
                        // ),
                      ),
                      Positioned(
                        left: 108,
                        top: 225,
                        child: Container(
                          width: 170,
                          height: 170,
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 3.5,
                              color: const Color(0xffFBBC05),
                            ),
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                      ),
                      Positioned(
                        left: -17,
                        top: -58,
                        child: Container(
                          width: 163,
                          height: 163,
                          decoration: BoxDecoration(
                            color: const Color(0xffFBBC05),
                            borderRadius: BorderRadius.circular(120),
                          ),
                        ),
                      ),
                      const Positioned(
                        right: 20,
                        bottom: 30,
                        child: Text(
                          "VISA",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 210,
                child: Text(
                  "Add a new card\n on your wallet for easy life",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    fontFamily: "Quicksand",
                  ),
                ),
              ),
              const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
